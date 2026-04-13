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

#### Pro Academic Mode (4-column with morphology and themes)

**Indo-Pak Theme (Default):**
```bash
python generate_bayazan_pro.py --start 78 --end 114 --theme indopak -o "Juz_30_IndoPak.docx"
```

**Uthmani Theme (Placeholder - requires Uthmani resources):**
```bash
python generate_bayazan_pro.py --start 78 --end 114 --theme uthmani -o "Juz_30_Uthmani.docx"
```

### Generate All 25 Volumes

#### Standard Mode
```bash
bash gen_bayzan_all.sh
```

#### Pro Academic Mode (Default: Indo-Pak Theme)
```bash
bash gen_bayzan_all.sh --pro
```

#### Pro Academic Mode with Specific Theme
```bash
# Indo-Pak theme (explicit)
bash gen_bayzan_all.sh --pro --theme=indopak

# Uthmani theme
bash gen_bayzan_all.sh --pro --theme=uthmani
```

This will generate 25 volumes covering:
- Volumes 1-20: Individual Surahs and Surah groups
- Volume 21: Juz 28 (Surah 58-66)
- Volume 22: Juz 29 (Surah 67-77)
- Volumes 23-25: Juz 30 / Amma Para (Surah 78-114)

### Command-Line Arguments

#### Standard Mode (`generate_bayazan.py`)
| Argument | Required | Description | Example |
|----------|----------|-------------|---------|
| `--start` | Yes | Starting Surah number (1-114) | `--start 1` |
| `--end` | Yes | Ending Surah number (1-114) | `--end 114` |
| `-o, --output` | No | Custom output filename | `-o "MyWorkbook.docx"` |

#### Pro Academic Mode (`generate_bayazan_pro.py`)
| Argument | Required | Description | Example |
|----------|----------|-------------|---------|
| `--start` | Yes | Starting Surah number (1-114) | `--start 1` |
| `--end` | Yes | Ending Surah number (1-114) | `--end 114` |
| `--theme` | No | Theme: `indopak` or `uthmani` (default: `indopak`) | `--theme indopak` |
| `-o, --output` | No | Custom output filename | `-o "MyWorkbook.docx"` |

### Available Themes

| Theme | Description | Status |
|-------|-------------|--------|
| **indopak** | Traditional Indo-Pak Nastaleeq script | ✅ Available |
| **uthmani** | Classical Uthmani script | 🚧 Placeholder (requires resources) |

## 📁 Project Structure

```
alimiyya-bayazan/
├── generate_bayazan.py          # Standard 2-column generator
├── generate_bayazan_pro.py      # Pro 4-column generator with theme support
├── config.py                    # Configuration (paths, colors, styles, themes)
├── gen_bayzan_all.sh           # Batch generation script with theme support
├── requirements.txt             # Python dependencies
├── setup_env.sh                # Environment setup helper
├── sources/                    # Data sources (organized by theme)
│   ├── shared/                 # Shared resources across all themes
│   │   ├── metadata/
│   │   │   └── quran-data.xml      # Surah metadata (Tanzil)
│   │   └── morphology/
│   │       ├── word-root.db        # Root mappings (QUL)
│   │       ├── word-lemma.db       # Lemma mappings (QUL)
│   │       ├── word-stem.db        # Stem mappings (QUL)
│   │       ├── ayah-root.db        # Ayah-level roots (QUL)
│   │       ├── ayah-lemma.db       # Ayah-level lemmas (QUL)
│   │       ├── ayah-stem.db        # Ayah-level stems (QUL)
│   │       └── quranic-corpus-morphology-0.4.txt # Leeds morphology
│   ├── themes/                 # Theme-specific resources
│   │   ├── indopak/           # Indo-Pak Nastaleeq theme
│   │   │   ├── text/
│   │   │   │   └── indopak-nastaleeq.db # Indo-Pak word database
│   │   │   └── fonts/
│   │   │       └── AlQuran IndoPak by QuranWBW.ttf
│   │   └── uthmani/           # Uthmani script theme (placeholder)
│   │       ├── text/
│   │       │   └── .gitkeep   # Add Uthmani database here
│   │       └── fonts/
│   │           └── .gitkeep   # Add Uthmani font here
│   └── standard/              # Standard mode resources
│       ├── KFGQPCNastaleeq-Regular.ttf # Font for standard mode
│       └── quran-simple.txt   # Plain Arabic text (Tanzil)
└── generated/                  # Output directory (auto-created)
```

## 🗄️ Data Sources & Academic Credits

This project stands on the shoulders of giants in Islamic digital scholarship. The academic depth and accuracy of the generated workbooks are made possible by trusted sources from:

- **[QUL Tarteel](https://qul.tarteel.ai/)** - Morphology databases, word-by-word scripts, and fonts
- **[Tanzil.net](https://tanzil.net/)** - Quranic text and metadata
- **[Quranic Arabic Corpus](http://corpus.quran.com/)** (University of Leeds) - Part-of-speech tagging
- **[King Fahd Complex](https://fonts.qurancomplex.gov.sa/)** - Arabic typography

### 📋 Detailed Documentation

For complete information about all data sources, including:
- Exact download links and versions
- Database schemas and compatibility
- License information
- Setup instructions
- Update procedures

**See: [`DATA_SOURCES.md`](DATA_SOURCES.md)**

### Quick Setup

The `sources/` directory is not included in the repository. To set up:

1. **Review** [`DATA_SOURCES.md`](DATA_SOURCES.md) for all download links
2. **Download** required resources for your mode (Standard/Pro)
3. **Place files** in the appropriate directories as documented
4. **Configure** paths in [`config.py`](config.py:1) if needed

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