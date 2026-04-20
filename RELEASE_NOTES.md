# Release Notes

---

## v1.0.1 - Ayat Number Display & RTL Text Fix

**Release Date:** April 20, 2026

### 🐛 Bug Fixes

- **Fixed RTL Text Direction in Standard Mode** - Arabic text now properly flows right-to-left instead of displaying backwards. This was a critical bug affecting readability when the required Arabic font was not installed on the system.

### ✨ Enhancements

- **Improved Ayat Number Display**
  - Ayat numbers now appear on a separate line above the verse text for better clarity
  - Format: English label "Ayah X:" followed by the Arabic verse text
  - Enhanced visual separation between verses

- **Arabic-Indic Numerals Implementation**
  - Ayat numbers now use traditional Arabic-Indic numerals (٠١٢٣٤٥٦٧٨٩)
  - Square bracket format `[٣]` for reliable cross-platform rendering
  - Maintains traditional Quranic styling while ensuring compatibility

- **Font Optimization**
  - Ayat numbers use Arial font (bold) for consistent numeral display
  - Arabic text maintains theme-specific fonts for authentic styling
  - Improved cross-platform font compatibility

### 📝 Display Format

**Before v1.0.1:**
```
[Arabic text with number at end] ﴿3﴾
```

**After v1.0.1:**
```
Ayah 3:
[Arabic text] [٣]
```

### 🔧 Technical Changes

- Added `paragraph_format.rtl = True` property in Standard mode for proper RTL text flow
- Implemented `to_arabic_numerals()` helper function for numeral conversion
- Split ayat text and numbers into separate runs with appropriate font handling
- Enhanced font fallback behavior for better cross-platform support

### 📦 Files Modified

- `generate_bayazan.py` - Standard mode generator
- `generate_bayazan_pro.py` - Pro academic mode generator

### ⚠️ Important Notes

- Users with v1.0.0 documents should regenerate their workbooks to get the RTL fix
- Font installation is still required before opening documents for proper display
- See `FONT_INSTALLATION.md` in the generated directory for font setup instructions

### 🙏 Acknowledgments

Thanks to the community members who reported the text direction issue and provided feedback on the ayat number display improvements.

---

## v1.0.0 - Initial Release

**Release Date:** April 13, 2026

## 🎉 Initial Release

The first stable release of **Alimiyya Bayazan** - a comprehensive Quranic study workbook generator designed for Islamic education. This tool creates beautifully formatted Microsoft Word documents with word-by-word Arabic analysis, morphological data, and space for student notes.

## 📦 Download Pre-Generated Workbooks

Don't want to generate the workbooks yourself? Download pre-generated artifacts:

- **Standard Mode** (2-column layout)
  - `alimiyya-bayazan-standard-v1.0.0.tar.gz` (Linux/macOS)
  - `alimiyya-bayazan-standard-v1.0.0.zip` (Windows)

- **Pro Mode - Indo-Pak Theme** (4-column with morphology)
  - `alimiyya-bayazan-pro-indopak-v1.0.0.tar.gz` (Linux/macOS)
  - `alimiyya-bayazan-pro-indopak-v1.0.0.zip` (Windows)

- **Pro Mode - Uthmani Theme** (4-column with morphology)
  - `alimiyya-bayazan-pro-uthmani-v1.0.0.tar.gz` (Linux/macOS)
  - `alimiyya-bayazan-pro-uthmani-v1.0.0.zip` (Windows)

Each archive contains all 25 volumes covering the entire Quran, plus fonts and installation instructions.

---

## ✨ Key Features

### Dual Generation Modes
- **Standard Mode**: 2-column layout with basic word analysis
  - 5-column tables: Word | Root | Role | Meaning | Notes
  - Surah introductions with note space
  - Ayah context sections
  - Dynamic Table of Contents

- **Pro Academic Mode**: 4-column layout with advanced morphological features
  - 4-column tables: Word | Root | Sarf | Notes
  - Dynamic Table of Contents with auto-generated index
  - Color-coded grammatical categories (Nouns: Blue, Verbs: Red, Particles: Grey)
  - Juz indicators for easy navigation
  - Surah-level notes sections for comprehensive study
  - Enhanced morphological data from Quranic Corpus

### Theme Support (Pro Mode)
- **Indo-Pak Nastaleeq**: Traditional South Asian script style
- **Uthmani Script (HAFS)**: Classical Uthmani orthography
- Easy theme switching via `--theme` parameter
- Automatic font selection per theme

### Batch Processing
- Generate all 25 volumes covering the entire Quran with a single command
- Configurable Surah ranges for custom workbooks
- Automated file naming and organization

### Professional Typography
- Optimized Arabic fonts with full tashkeel support
- Proper Complex Script font rendering
- Automatic font copying to output directory
- Font installation instructions included

### Document Features
- Landscape orientation for optimal table viewing
- Professional formatting with color-coded headers
- Proper Basmala placement (Islamic scholarly consensus)
- Page numbers in footer
- Surah-level notes sections
- Ayah-specific analysis space

---

## 📦 What's Included

### Core Scripts
- `generate_bayazan.py` - Standard mode generator
- `generate_bayazan_pro.py` - Pro academic mode generator with theme support
- `gen_bayzan_all.sh` - Batch generation script for all 25 volumes
- `config.py` - Centralized configuration (paths, colors, themes)

### Documentation
- `README.md` - Complete usage guide and quick start
- `DATA_SOURCES.md` - Comprehensive data source documentation
- `LICENSE` - MIT License

### Configuration
- Theme-based directory structure for easy resource management
- Shared resources (metadata, morphology) across all themes
- Modular design for adding new themes

---

## 🎨 Supported Themes

| Theme | Script Style | Status |
|-------|-------------|--------|
| **indopak** | Indo-Pak Nastaleeq | ✅ Fully Available |
| **uthmani** | Uthmani (HAFS) | ✅ Fully Available |

---

## 🗄️ Data Sources

This project uses academically verified Islamic resources:
- **QUL Tarteel** - Morphology databases, word-by-word scripts, and fonts
- **Tanzil.net** - Quranic text and metadata
- **Quranic Arabic Corpus** (University of Leeds) - Part-of-speech tagging
- **King Fahd Complex** - Arabic typography

See `DATA_SOURCES.md` for complete download links and setup instructions.

---

## 🚀 Quick Start

### Installation
```bash
git clone https://github.com/yourusername/alimiyya-bayazan.git
cd alimiyya-bayazan
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Generate Single Workbook
```bash
# Standard mode
python generate_bayazan.py --start 1 --end 2 -o "My_Workbook.docx"

# Pro mode with Indo-Pak theme
python generate_bayazan_pro.py --start 78 --end 114 --theme indopak -o "Juz_30.docx"

# Pro mode with Uthmani theme
python generate_bayazan_pro.py --start 78 --end 114 --theme uthmani -o "Juz_30_Uthmani.docx"
```

### Generate All 25 Volumes
```bash
# Standard mode
bash gen_bayzan_all.sh

# Pro mode with Indo-Pak theme
bash gen_bayzan_all.sh --pro

# Pro mode with Uthmani theme
bash gen_bayzan_all.sh --pro --theme=uthmani
```

---

## 🔧 Technical Improvements

### Architecture
- Modular theme-based directory structure
- Centralized configuration management
- Separation of shared and theme-specific resources
- Clean code organization following best practices

### Document Generation
- Proper document metadata to prevent compatibility mode warnings
- Optimized font injection for Complex Script rendering
- Enhanced waqf symbol detection and handling
- Improved table formatting and spacing

### Code Quality
- Type hints and documentation
- Error handling and validation
- Resource cleanup and management
- Consistent coding style

---

## 📋 Requirements

- **Python**: 3.7 or higher
- **Dependencies**: 
  - python-docx
  - lxml
- **Operating System**: macOS, Linux, or Windows
- **Microsoft Word**: For viewing and editing generated documents

---

## 🐛 Known Issues

- None reported in this release

---

## 🙏 Acknowledgments

This project is built entirely on freely available, academically verified Islamic resources. Deep gratitude to:
- Tanzil.net team
- Quranic Universal Library (QUL) / Tarteel.ai
- University of Leeds Quranic Corpus team (Kais Dukes)
- King Fahd Glorious Qur'an Printing Complex
- Alimiyya Islamic Education Program

---

## 📄 License

MIT License - Free for educational and non-commercial use.

---

## 📞 Support

- **Issues**: Report bugs or request features on GitHub Issues
- **Documentation**: See README.md and DATA_SOURCES.md
- **Contact**: Open an issue for questions or support

---

## 🔮 Future Roadmap

Potential features for future releases:
- Additional output formats (PDF, HTML)
- Translation integration
- Enhanced tafseer sections
- Web interface
- Mobile-friendly layouts
- Additional Quranic script themes

---

**Note**: This tool is designed for educational purposes to facilitate Quranic study. Please ensure you have the necessary data sources and fonts installed before use.

---

**Full Changelog**: Initial release v1.0.0