import os
import sqlite3
import argparse
import xml.etree.ElementTree as ET
from docx import Document
from docx.shared import Pt, Inches, RGBColor
from docx.enum.section import WD_ORIENT
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.oxml.ns import qn, nsdecls
from docx.oxml import OxmlElement, parse_xml
from config import PATHS, COLORS, STYLE, POS_MAP

class BayazanProEngine:
    def __init__(self):
        self.metadata = self._parse_metadata()
        self.morph_map = self._parse_leeds_morphology()
        # Para/Juz mapping for Juz 30
        self.juz_map = {i: 30 for i in range(78, 115)} 

    def _parse_metadata(self):
        tree = ET.parse(PATHS["metadata_xml"])
        root = tree.getroot()
        data = {}
        for s in root.find('suras'):
            idx = int(s.get('index'))
            data[idx] = {
                "name": s.get('name'),
                "arname": s.get('arname') or s.get('name'),
                "ayas": int(s.get('ayas'))
            }
        return data

    def _parse_leeds_morphology(self):
        mapping = {}
        leeds_path = PATHS["morphology"]["leeds_txt"]
        if not os.path.exists(leeds_path): return mapping
        with open(leeds_path, 'r', encoding='utf-8') as f:
            for line in f:
                if line.startswith('('):
                    parts = line.split('\t')
                    loc_raw = parts[0].strip('()').split(':')
                    loc = f"{loc_raw[0]}:{loc_raw[1]}:{loc_raw[2]}"
                    pos = parts[2]
                    if loc not in mapping or mapping[loc] == 'PARTICLE':
                        mapping[loc] = POS_MAP.get(pos, 'PARTICLE')
        return mapping

    def is_structural_symbol(self, text):
        if len(text) == 1 and ord(text[0]) > 0x06FF: return True
        markers = ['', '', '', '', '', '', '', '', '', '', 'ۜ', 'ۘ', 'ۙ', 'ۚ', 'ۛ', 'ۜ']
        return any(m in text for m in markers)

    def set_cell_shading(self, cell, hex_color):
        tcPr = cell._tc.get_or_add_tcPr()
        shd = parse_xml(f'<w:shd {nsdecls("w")} w:fill="{hex_color}"/>')
        tcPr.append(shd)

    def set_arabic_font(self, run, size, color=None):
        run.font.name = STYLE["font_name"]
        run.font.size = Pt(size)
        if color: run.font.color.rgb = RGBColor(*color)
        rPr = run._element.get_or_add_rPr()
        rFonts = OxmlElement('w:rFonts')
        rFonts.set(qn('w:cs'), STYLE["font_name"])
        rPr.append(rFonts)

    def get_enriched_words(self, sura, ayah):
        conn_text = sqlite3.connect(PATHS["text_db"])
        conn_root = sqlite3.connect(PATHS["morphology"]["root"])
        words = conn_text.execute(
            "SELECT location, text FROM words WHERE surah=? AND ayah=? ORDER BY word", 
            (sura, ayah)
        ).fetchall()
        
        clean_header = " ".join([w[1] for w in words if not self.is_structural_symbol(w[1])])
        full_ref = f"{clean_header} \u200f﴿{ayah}﴾\u200f"
        
        enriched = []
        for loc, text in words:
            is_sym = self.is_structural_symbol(text)
            root_formatted = ""
            if not is_sym:
                root_res = conn_root.execute(
                    "SELECT r.arabic_trilateral FROM roots r JOIN root_words rw ON r.id = rw.root_id WHERE rw.word_location = ?", 
                    (loc,)
                ).fetchone()
                if root_res: root_formatted = root_res[0].strip().replace(" ", " . ")
            
            color = (166, 166, 166) if is_sym else COLORS.get(self.morph_map.get(loc, 'DEFAULT'), (0,0,0))
            enriched.append({"text": text, "root": root_formatted, "color": color, "is_symbol": is_sym})
        conn_text.close(); conn_root.close()
        return full_ref, enriched

    def create_workbook(self, start, end, output_filename):
        doc = Document()
        section = doc.sections[0]
        section.orientation = WD_ORIENT.LANDSCAPE
        section.page_width, section.page_height = Inches(11.69), Inches(8.27)
        section.left_margin = section.right_margin = Inches(0.5)

        # 1. Cover Page
        p_intro = doc.add_paragraph()
        p_intro.alignment = WD_ALIGN_PARAGRAPH.CENTER
        run_intro = p_intro.add_run("أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ\nبِسْم. اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ")
        self.set_arabic_font(run_intro, 26)
        doc.add_page_break()

        for s_num in range(start, end + 1):
            s_info = self.metadata[s_num]
            juz_num = self.juz_map.get(s_num, "??")
            
            # 2. BIG Surah Header with Juz Info
            doc.add_paragraph(f"Juz {juz_num}", style='Caption').alignment = WD_ALIGN_PARAGRAPH.RIGHT
            h_ar = doc.add_heading('', level=1)
            h_ar.alignment = WD_ALIGN_PARAGRAPH.RIGHT
            h_ar.paragraph_format.rtl = True
            run_h = h_ar.add_run(f"سورة {s_info['arname']}")
            self.set_arabic_font(run_h, 36, color=(0, 51, 102))

            if s_num != 9 and s_num != 1:
                p_bis = doc.add_paragraph()
                p_bis.alignment = WD_ALIGN_PARAGRAPH.CENTER
                p_bis.paragraph_format.rtl = True
                run_bis = p_bis.add_run("بِسْمِ اللَّهِ الرَّحْمَـٰنِ الرَّحِيمِ")
                self.set_arabic_font(run_bis, 22)

            for a_idx in range(1, s_info['ayas'] + 1):
                full_ref, words = self.get_enriched_words(s_num, a_idx)
                
                # 3. Ayah Header Line
                p_full = doc.add_paragraph()
                p_full.alignment = WD_ALIGN_PARAGRAPH.RIGHT
                p_full.paragraph_format.rtl = True
                run_full = p_full.add_run(full_ref)
                self.set_arabic_font(run_full, 20, color=(96, 96, 96))

                # 4. Academic Analysis Table
                table = doc.add_table(rows=1, cols=4)
                table.style = 'Table Grid'
                table.allow_autofit = False
                
                table.columns[0].width = Inches(1.2)
                table.columns[1].width = Inches(1.1)
                table.columns[2].width = Inches(2.3)
                table.columns[3].width = Inches(5.9) # Notes area

                hdr_cells = table.rows[0].cells
                # Updated Header List
                headers = ["Word", "Root", "Sarf", "Notes / ملاحظات"]
                
                # Fallback logic for background color to prevent crashes
                bg_color = STYLE.get("table_header_bg", STYLE.get("header_bg", "F2F2F2"))
                
                for i, txt in enumerate(headers):
                    hdr_cells[i].text = txt
                    self.set_cell_shading(hdr_cells[i], bg_color)
                    hdr_cells[i].paragraphs[0].runs[0].bold = True

                for w in words:
                    row = table.add_row().cells
                    p_w = row[0].paragraphs[0]
                    p_w.paragraph_format.rtl = True
                    # Vertical breathing room for handwritten notes
                    p_w.paragraph_format.line_spacing = 1.2 
                    p_w.alignment = WD_ALIGN_PARAGRAPH.CENTER if w['is_symbol'] else WD_ALIGN_PARAGRAPH.RIGHT
                    
                    run_w = p_w.add_run(w['text'])
                    self.set_arabic_font(run_w, STYLE["font_size_arabic"], color=w['color'])
                    
                    p_r = row[1].paragraphs[0]
                    p_r.alignment = WD_ALIGN_PARAGRAPH.CENTER
                    run_r = p_r.add_run(w['root'])
                    self.set_arabic_font(run_r, 14)

                doc.add_paragraph("\nAyah Context / General Analysis:")
                doc.add_paragraph("________________________________________________________________________________")

            doc.add_page_break()

        output_path = os.path.join(PATHS["output_dir"], output_filename)
        doc.save(output_path)
        print(f"✅ Success! Workbook generated: {output_filename}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--start", type=int, required=True)
    parser.add_argument("--end", type=int, required=True)
    parser.add_argument("-o", "--output", type=str)
    args = parser.parse_args()
    
    filename = args.output or f"Academic_Bayazan_{args.start}_{args.end}.docx"
    BayazanProEngine().create_workbook(args.start, args.end, filename)
