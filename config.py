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
        "leeds_txt": "sources/morphology/quranic-corpus-morphology-0.4.txt"
    },

    # Assets
    "font_ttf": "sources/fonts/KFGQPCNastaleeq-Regular.ttf",

    # Output
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
    "font_name": "KFGQPC Nastaleeq Regular",
    "font_size_arabic": 24,      # Large for Tashkeel clarity
    "font_size_header": 11,
    "table_header_bg": "F2F2F2", # Updated key to match script
    "ayah_row_bg": "EBF1DE"      # Subtle Green for Ayah separators
}
