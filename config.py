import os

# Base directory mapping
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Theme definitions for Pro Academic Mode
THEMES = {
    "indopak": {
        "name": "Indo-Pak Nastaleeq",
        "text_db": "sources/themes/indopak/text/indopak-nastaleeq.db",
        "font_name": "AlQuran IndoPak by QuranWBW",
        "font_file": "sources/themes/indopak/fonts/AlQuran IndoPak by QuranWBW.ttf",
        "description": "Traditional Indo-Pak script with Nastaleeq calligraphy"
    },
    "uthmani": {
        "name": "Uthmani Script (HAFS)",
        "text_db": "sources/themes/uthmani/text/uthmani.db",
        "font_name": "KFGQPC Uthmanic Script HAFS",
        "font_file": "sources/themes/uthmani/fonts/KFGQPC Uthmanic Script HAFS.otf",
        "description": "Classical Uthmani script with HAFS narration"
    }
}

# Default theme for Pro mode
DEFAULT_THEME = "indopak"

# Paths configuration
PATHS = {
    # Shared resources (used by all themes)
    "metadata_xml": "sources/shared/metadata/quran-data.xml",
    "morphology": {
        "root": "sources/shared/morphology/word-root.db",
        "lemma": "sources/shared/morphology/word-lemma.db",
        "stem": "sources/shared/morphology/word-stem.db",
        "ayah_root": "sources/shared/morphology/ayah-root.db",
        "ayah_lemma": "sources/shared/morphology/ayah-lemma.db",
        "ayah_stem": "sources/shared/morphology/ayah-stem.db",
        "leeds_txt": "sources/shared/morphology/quranic-corpus-morphology-0.4.txt"
    },
    
    # Standard/Simple mode resources (non-Pro)
    "standard": {
        "text_file": "sources/standard/quran-simple.txt",
        "font_file": "sources/standard/KFGQPCNastaleeq-Regular.ttf",
        "font_name": "KFGQPC Nastaleeq Regular"
    },
    
    # Output directory
    "output_dir": "generated"
}

# Color logic for Tarkeeb/Sarf analysis (RGB)
COLORS = {
    "NOUN": (0, 51, 102),      # Deep Blue (Ism)
    "VERB": (153, 0, 0),       # Deep Red (Fi'l)
    "PARTICLE": (64, 64, 64),  # Dark Grey/Black (Harf)
    "DEFAULT": (0, 0, 0)
}

# Mapping Leeds Tags to our Alimiyya Color Categories
POS_MAP = {
    'N': 'NOUN', 'PN': 'NOUN', 'ADJ': 'NOUN', 'PRON': 'NOUN',
    'V': 'VERB',
    'P': 'PARTICLE', 'CONJ': 'PARTICLE', 'PRP': 'PARTICLE', 'DET': 'PARTICLE'
}

# Academic Layout Styling
STYLE = {
    "font_size_arabic": 24,      # Large for Tashkeel clarity
    "font_size_header": 11,
    "table_header_bg": "F2F2F2", # Light grey for table headers
    "ayah_row_bg": "EBF1DE"      # Subtle Green for Ayah separators
}

def get_theme_config(theme_name=None):
    """
    Get configuration for a specific theme.
    
    Args:
        theme_name: Name of the theme ('indopak' or 'uthmani'). 
                   If None, returns default theme.
    
    Returns:
        Dictionary containing theme configuration
    """
    if theme_name is None:
        theme_name = DEFAULT_THEME
    
    if theme_name not in THEMES:
        raise ValueError(f"Unknown theme: {theme_name}. Available themes: {list(THEMES.keys())}")
    
    return THEMES[theme_name]

def list_available_themes():
    """
    List all available themes with their descriptions.
    
    Returns:
        Dictionary of theme names and their descriptions
    """
    return {name: config["description"] for name, config in THEMES.items()}

# Made with Bob
