# Alimiyya Bayazan - Quranic Study Workbook Generator

A Python-based tool for generating comprehensive Quranic study workbooks (Bayazan) designed for Alimiyya Islamic education courses. The system creates beautifully formatted Microsoft Word documents with word-by-word Arabic analysis, morphological data, and space for student notes.

## 🌟 Features

### Core Capabilities
- **Word-by-Word Analysis**: Each Quranic word is presented in a structured table format
- **Morphological Integration**: Automatic root extraction from Quranic Corpus morphology databases
- **Color-Coded Grammar**: Visual distinction between nouns (blue), verbs (red), and particles (grey)
- **Dual Generation Modes**:
  - **Standard Mode**: 2-column layout with basic word analysis
  - **Pro Academic Mode**: 4-column layout with advanced morphological features
- **Batch Processing**: Generate all 25 volumes covering the entire Quran with a single command
- **Proper Arabic Typography**: Optimized for KFGQPC Nastaleeq font with full tashkeel support

### Document Features
- Dynamic Table of Contents with page numbers
- Surah introductions with space for notes
- Ayah-specific tafseer sections
- Landscape orientation for optimal table viewing
- Professional formatting with color-coded headers
- Juz (Para) indicators for easy navigation

## 📋 Prerequisites

- **Python**: 3.7 or higher
- **Operating System**: macOS, Linux, or Windows
- **Font**: KFGQPC Nastaleeq Regular (download from [King Fahd Complex](https://fonts.qurancomplex.gov.sa/))
- **Microsoft Word**: For viewing and editing generated documents

## 🚀 Installation

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/alimiyya-bayazan.git
cd alimiyya-bayazan
```

### 2. Set Up Virtual Environment (Recommended)
```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
# On macOS/Linux:
source venv/bin/activate
# On Windows:
venv\Scripts\activate
```

### 3. Install Dependencies
```bash
pip install -r requirements.txt
```

### 4. Install Arabic Font
Download and install **KFGQPC Nastaleeq Regular** font from the King Fahd Complex website to ensure proper Arabic text rendering.

## 📖 Usage

### Generate Single Surah Range

#### Standard Mode (2-column layout)
```bash
python generate_bayazan.py --start 1 --end 2 -o "My_Workbook.docx"
```

#### Pro Academic Mode (4-column with morphology)
```bash
python generate_bayazan_pro.py --start 78 --end 114 -o "Juz_30_Academic.docx"
```

### Generate All 25 Volumes

#### Standard Mode
```bash
bash gen_bayzan_all.sh
```

#### Pro Academic Mode
```bash
bash gen_bayzan_all.sh --pro
```

This will generate 25 volumes covering:
- Volumes 1-20: Individual Surahs and Surah groups
- Volume 21: Juz 28 (Surah 58-66)
- Volume 22: Juz 29 (Surah 67-77)
- Volumes 23-25: Juz 30 / Amma Para (Surah 78-114)

### Command-Line Arguments

| Argument | Required | Description | Example |
|----------|----------|-------------|---------|
| `--start` | Yes | Starting Surah number (1-114) | `--start 1` |
| `--end` | Yes | Ending Surah number (1-114) | `--end 114` |
| `-o, --output` | No | Custom output filename | `-o "MyWorkbook.docx"` |

## 📁 Project Structure

```
alimiyya-bayazan/
├── generate_bayazan.py          # Standard 2-column generator
├── generate_bayazan_pro.py      # Pro 4-column generator with morphology
├── config.py                    # Configuration (paths, colors, styles)
├── gen_bayzan_all.sh           # Batch generation script
├── requirements.txt             # Python dependencies
├── setup_env.sh                # Environment setup helper
├── sources/                    # Data sources (not in repo)
│   ├── text/
│   │   ├── quran-simple.txt    # Plain Arabic text (Tanzil)
│   │   └── indopak-nastaleeq.db # Word-by-word database
│   ├── metadata/
│   │   └── quran-data.xml      # Surah metadata
│   ├── morphology/
│   │   ├── word-root.db        # Root mappings
│   │   └── quranic-corpus-morphology-0.4.txt # Leeds morphology
│   └── fonts/
│       └── KFGQPCNastaleeq-Regular.ttf
└── generated/                  # Output directory (auto-created)
```

## 🗄️ Data Sources & Academic Credits

This project stands on the shoulders of giants in Islamic digital scholarship. The academic depth and accuracy of the generated workbooks are made possible by the following trusted sources:

### 1. 📚 Linguistic & Morphological Research (Quranic Universal Library - QUL)

The Pro Academic Engine's morphological analysis is powered by specialized research databases from the **Quranic Universal Library (QUL)**. These relational SQLite databases enable automated mapping of Indo-Pak script to classical Arabic roots:

- **`word-root.db` / `ayah-root.db`**: Primary source for trilateral root extraction
- **`word-lemma.db` / `ayah-lemma.db`**: Dictionary form identification for Quranic vocabulary
- **`word-stem.db` / `ayah-stem.db`**: Sarf (morphological) analysis and verb stem identification

**Purpose**: These databases form the backbone of the word-by-word grammatical analysis, allowing students to trace each word back to its classical Arabic root.

### 2. 📖 Standard Text & Metadata (The Tanzil Project)

The project utilizes verified "Standard Model" datasets from **[Tanzil.net](https://tanzil.net/download/)**, serving as the baseline for text accuracy and global Quranic metadata:

- **`quran-simple.txt`**: Primary source for the Standard Engine's text generation (simple, clean Arabic text without diacritics)
- **`quran-data.xml`**: Structural metadata including:
  - Surah names (Arabic and English transliteration)
  - Ayah counts per Surah
  - Classification (Makki/Madani)
  - Revelation order

**Purpose**: Ensures textual accuracy and provides the organizational structure for all generated workbooks.

### 3. 🎓 Parts of Speech & Grammar (Leeds Quranic Corpus)

The automated color-coding logic (Ism/Noun, Fi'l/Verb, Harf/Particle) is derived from the **Quranic Arabic Corpus** at the University of Leeds:

- **Source**: `quranic-corpus-morphology-0.4.txt` (Maintained by Kais Dukes)
- **Role**: Provides POS (Part of Speech) tags that are mapped to specific color hex codes in `config.py`
- **Website**: [corpus.quran.com](http://corpus.quran.com/)

**Purpose**: Enables visual grammatical distinction, helping students quickly identify word types and their syntactic roles.

### 4. ✍️ Indo-Pak Script & Typography

#### Indo-Pak Nastaleeq Database
- **`indopak-nastaleeq.db`**: Primary source for the specific orthography used in the Indo-Pak subcontinent
- **Purpose**: Ensures generated workbooks match the visual style of the Mus'haf used in Alimiyya curriculum and familiar to students in South Asia

#### King Fahd Glorious Qur'an Printing Complex (KFGQPC)
- **Font**: `KFGQPCNastaleeq-Regular.ttf`
- **Download**: [fonts.qurancomplex.gov.sa](https://fonts.qurancomplex.gov.sa/)
- **Technical Implementation**: The software uses direct OOXML injection to force Microsoft Word to utilize the font's Complex Script features, ensuring proper rendering of Arabic diacritics and ligatures

**Purpose**: Provides authentic, beautiful Nastaleeq typography that matches traditional Quranic manuscripts and printed Mus'hafs.

### Setting Up Data Sources

The `sources/` directory is not included in the repository due to licensing and size constraints. To set up:

1. **Download Quran text** from Tanzil.net (simple format)
2. **Download morphology data** from Quranic Corpus
3. **Obtain QUL databases** (word-root.db, word-lemma.db, word-stem.db)
4. **Download Indo-Pak database** (indopak-nastaleeq.db)
5. **Install KFGQPC font** from King Fahd Complex
6. **Place files** according to the structure defined in `config.py`

### Data Integrity & Verification

All data sources are:
- ✅ Academically verified by Islamic scholars
- ✅ Widely used in Quranic research and education
- ✅ Regularly maintained and updated
- ✅ Free for educational and non-commercial use

## ⚙️ Configuration

Edit `config.py` to customize:

### Paths
```python
PATHS = {
    "text_db": "sources/text/indopak-nastaleeq.db",
    "metadata_xml": "sources/metadata/quran-data.xml",
    "morphology": {...},
    "output_dir": "generated"
}
```

### Color Scheme (RGB)
```python
COLORS = {
    "NOUN": (0, 51, 102),      # Deep Blue (Ism)
    "VERB": (153, 0, 0),       # Deep Red (Fi'l)
    "PARTICLE": (64, 64, 64),  # Dark Grey (Harf)
}
```

### Typography
```python
STYLE = {
    "font_name": "KFGQPC Nastaleeq Regular",
    "font_size_arabic": 24,
    "table_header_bg": "F2F2F2"
}
```

## 🎨 Output Formats

### Standard Mode Features
- 5-column table: Word | Root | Role | Meaning | Notes
- Surah introductions
- Ayah context sections
- Table of Contents with dynamic page numbers

### Pro Academic Mode Features
- 4-column table: Word | Root | Sarf | Notes
- Color-coded grammatical categories
- Juz indicators
- Enhanced morphological data
- Optimized for academic study

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

### Development Setup
```bash
# Clone and setup
git clone https://github.com/yourusername/alimiyya-bayazan.git
cd alimiyya-bayazan
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Areas for Contribution
- Additional output formats (PDF, HTML)
- Translation integration
- Enhanced tafseer sections
- Mobile-friendly layouts
- Web interface

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

This project would not be possible without the tireless work of Islamic digital scholarship pioneers:

### Primary Data Providers
- **[Tanzil.net](https://tanzil.net/)** - For providing verified, high-quality Quranic text in multiple formats
- **[Quranic Arabic Corpus](http://corpus.quran.com/)** (University of Leeds, maintained by Kais Dukes) - For comprehensive morphological analysis and POS tagging
- **[Quranic Universal Library (QUL)](https://qul.gtaf.org/)** - For specialized linguistic databases (root, lemma, and stem mappings)
- **[King Fahd Glorious Qur'an Printing Complex](https://fonts.qurancomplex.gov.sa/)** - For authentic Arabic typography and the KFGQPC Nastaleeq font

### Educational Inspiration
- **Alimiyya Islamic Education Program** - For inspiring the pedagogical approach and workbook format
- The global community of Quranic educators and students who continue to benefit from digital tools

### Technical Foundations
- **Python-docx** library maintainers for enabling programmatic Word document generation
- The open-source community for SQLite, lxml, and related technologies

**Special Recognition**: This project is built entirely on freely available, academically verified Islamic resources. We are deeply grateful to all scholars, researchers, and institutions who have made their work accessible for educational purposes.

## 📞 Support

For questions, issues, or suggestions:
- Open an issue on GitHub
- Contact the maintainer

## 🔄 Version History

- **v1.0.0** - Initial release with dual-mode generation
- Standard and Pro academic layouts
- Batch processing for all 25 volumes
- Full morphological integration

---

**Note**: This tool is designed for educational purposes to facilitate Quranic study. Please ensure you have the necessary data sources and fonts installed before use.