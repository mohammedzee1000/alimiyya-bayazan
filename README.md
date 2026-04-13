# Alimiyya Bayazan - Quranic Study Workbook Generator

A Python-based tool for generating comprehensive Quranic study workbooks (Bayazan) designed for Alimiyya Islamic education courses. The system creates beautifully formatted Microsoft Word documents with word-by-word Arabic analysis, morphological data, and space for student notes.

## 🌟 Features

- **Word-by-Word Analysis**: Each Quranic word presented in structured table format
- **Morphological Integration**: Automatic root extraction from Quranic Corpus databases
- **Color-Coded Grammar**: Visual distinction between nouns (blue), verbs (red), and particles (grey)
- **Dual Generation Modes**:
  - **Standard Mode**: 2-column layout with basic word analysis
  - **Pro Academic Mode**: 4-column layout with advanced morphological features and theme support
- **Theme Support**: Indo-Pak Nastaleeq and Uthmani scripts (Pro mode)
- **Batch Processing**: Generate all 25 volumes covering the entire Quran with a single command
- **Professional Typography**: Optimized Arabic fonts with full tashkeel support

## 📋 Prerequisites

- **Python**: 3.7 or higher
- **Operating System**: macOS, Linux, or Windows
- **Microsoft Word**: For viewing and editing generated documents

## 🚀 Quick Start

### 1. Clone and Setup
```bash
git clone https://github.com/yourusername/alimiyya-bayazan.git
cd alimiyya-bayazan
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

### 2. Download Data Sources
See [`DATA_SOURCES.md`](DATA_SOURCES.md) for all required downloads and setup instructions.

### 3. Generate Workbooks

**Standard Mode (2-column):**
```bash
python generate_bayazan.py --start 1 --end 2 -o "My_Workbook.docx"
```

**Pro Academic Mode (4-column with themes):**
```bash
# Indo-Pak theme (default)
python generate_bayazan_pro.py --start 78 --end 114 --theme indopak -o "Juz_30_IndoPak.docx"

# Uthmani theme
python generate_bayazan_pro.py --start 78 --end 114 --theme uthmani -o "Juz_30_Uthmani.docx"
```

**Batch Generation (All 25 Volumes):**
```bash
# Standard mode
bash gen_bayzan_all.sh

# Pro mode with Indo-Pak theme
bash gen_bayzan_all.sh --pro

# Pro mode with Uthmani theme
bash gen_bayzan_all.sh --pro --theme=uthmani
```

## 📖 Command-Line Arguments

### Standard Mode (`generate_bayazan.py`)
| Argument | Required | Description |
|----------|----------|-------------|
| `--start` | Yes | Starting Surah number (1-114) |
| `--end` | Yes | Ending Surah number (1-114) |
| `-o, --output` | No | Custom output filename |

### Pro Academic Mode (`generate_bayazan_pro.py`)
| Argument | Required | Description |
|----------|----------|-------------|
| `--start` | Yes | Starting Surah number (1-114) |
| `--end` | Yes | Ending Surah number (1-114) |
| `--theme` | No | Theme: `indopak` or `uthmani` (default: `indopak`) |
| `-o, --output` | No | Custom output filename |

## 🎨 Available Themes

| Theme | Description | Status |
|-------|-------------|--------|
| **indopak** | Traditional Indo-Pak Nastaleeq script | ✅ Available |
| **uthmani** | Classical Uthmani script (HAFS) | ✅ Available |

## 📁 Project Structure

```
alimiyya-bayazan/
├── generate_bayazan.py          # Standard 2-column generator
├── generate_bayazan_pro.py      # Pro 4-column generator with themes
├── config.py                    # Configuration (paths, colors, themes)
├── gen_bayzan_all.sh           # Batch generation script
├── requirements.txt             # Python dependencies
├── sources/                    # Data sources (see DATA_SOURCES.md)
│   ├── shared/                 # Shared resources (metadata, morphology)
│   ├── themes/                 # Theme-specific resources
│   │   ├── indopak/           # Indo-Pak Nastaleeq
│   │   └── uthmani/           # Uthmani script
│   └── standard/              # Standard mode resources
└── generated/                  # Output directory (auto-created)
```

## 🗄️ Data Sources

This project uses academically verified Islamic resources from:
- **[QUL Tarteel](https://qul.tarteel.ai/)** - Morphology databases, scripts, and fonts
- **[Tanzil.net](https://tanzil.net/)** - Quranic text and metadata
- **[Quranic Arabic Corpus](http://corpus.quran.com/)** (University of Leeds) - Part-of-speech tagging
- **[King Fahd Complex](https://fonts.qurancomplex.gov.sa/)** - Arabic typography

**For complete setup instructions, download links, and database schemas, see: [`DATA_SOURCES.md`](DATA_SOURCES.md)**

## ⚙️ Configuration

Edit [`config.py`](config.py) to customize:

**Paths:**
```python
PATHS = {
    "shared": {...},      # Metadata and morphology
    "standard": {...},    # Standard mode resources
    "output_dir": "generated"
}
```

**Color Scheme:**
```python
COLORS = {
    "NOUN": (0, 51, 102),      # Deep Blue
    "VERB": (153, 0, 0),       # Deep Red
    "PARTICLE": (64, 64, 64),  # Dark Grey
}
```

**Themes:**
```python
THEMES = {
    "indopak": {...},
    "uthmani": {...}
}
```

## 🎨 Output Formats

**Standard Mode:**
- 5-column table: Word | Root | Role | Meaning | Notes
- Surah introductions with note space
- Ayah context sections
- Dynamic Table of Contents

**Pro Academic Mode:**
- 4-column table: Word | Root | Sarf | Notes
- Color-coded grammatical categories
- Juz indicators
- Enhanced morphological data
- Theme-specific fonts and scripts

## 🤝 Contributing

Contributions welcome! Areas for contribution:
- Additional output formats (PDF, HTML)
- Translation integration
- Enhanced tafseer sections
- Web interface

## 📄 License

MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Built entirely on freely available, academically verified Islamic resources. Deep gratitude to:
- **Tanzil.net** - Verified Quranic text
- **Quranic Arabic Corpus** (University of Leeds, Kais Dukes) - Morphological analysis
- **QUL Tarteel** - Linguistic databases and fonts
- **King Fahd Complex** - Arabic typography
- **Alimiyya Islamic Education Program** - Pedagogical inspiration

## 📞 Support

- Open an issue on GitHub
- Contact the maintainer

---

**Note**: This tool is designed for educational purposes to facilitate Quranic study. Ensure you have the necessary data sources and fonts installed before use.