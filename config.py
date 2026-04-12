import os

# Base directory mapping
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

PATHS = {
    # Core Text Database (Indo-Pak Word-by-Word)
    "text_db": "sources/text/indopak-nastaleeq.db",
    
    # Metadata Source (Tanzil XML)
    "metadata_xml": "sources/metadata/quran-data.xml",
    
    # Linguistic Databases (QUL Morphology)
    "morphology": {
        "root": "sources/morphology/word-root.db",
        "lemma": "sources/morphology/word-lemma.db",
        "stem": "sources/morphology/word-stem.db"
    },
    
    # Assets
    "font_ttf": "sources/fonts/KFGQPCNastaleeq-Regular.ttf",
    
    # Output
    "output_dir": "generated"
}

# Color logic for Tarkeeb analysis
# We'll map these keys to the POS tags found in your SQLite morphology files
COLORS = {
    "NOUN": (0, 51, 102),     # Dark Blue
    "VERB": (153, 0, 0),     # Dark Red
    "PARTICLE": (0, 0, 0),   # Black
    "DEFAULT": (0, 0, 0)
}

# Workbook styling defaults
STYLE = {
    "font_name": "KFGQPC Nastaleeq Regular",
    "font_size_arabic": 18,
    "font_size_text": 10,
    "table_header_bg": "E7E7E7"  # Light Grey
}
