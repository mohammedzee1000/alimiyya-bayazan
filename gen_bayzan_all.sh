#!/bin/bash

# --- CONFIGURATION ---
IS_PRO=false
SCRIPT_NAME="generate_bayazan.py"
OUTPUT_DIR="generated"

# --- ARGUMENT PARSING ---
for arg in "$@"; do
    if [ "$arg" == "--pro" ]; then
        IS_PRO=true
        SCRIPT_NAME="generate_bayazan_pro.py"
    fi
done

# --- SMART DETECT PYTHON ---
if [[ -d "venv" ]]; then
    PY_CMD="./venv/bin/python"
elif command -v python3 &>/dev/null; then
    PY_CMD="python3"
elif command -v python &>/dev/null; then
    PY_CMD="python"
else
    echo "Error: Python is not installed."
    exit 1
fi

# --- STARTUP INFO ---
MODE_LABEL="STANDARD (2-column)"
[[ "$IS_PRO" == true ]] && MODE_LABEL="PRO ACADEMIC (4-column)"

echo "=========================================="
echo "🚀 Starting Alimiyya Bayazan Generator"
echo "Mode:   $MODE_LABEL"
echo "Engine: $SCRIPT_NAME"
echo "=========================================="

# Function to run generation with error handling
generate_volume() {
    local start=$1
    local end=$2
    local output="$3.docx"

    echo -n "👉 Generating $output ($start-$end)... "

    if $PY_CMD "$SCRIPT_NAME" --start "$start" --end "$end" -o "$output" > /dev/null 2>&1; then
        echo "✅ DONE"
    else
        echo "❌ FAILED"
        echo "Error: Check logs by running: $PY_CMD $SCRIPT_NAME --start $start --end $end -o $output"
        exit 1
    fi
}

# --- EXECUTION ---

# Volumes 1 to 20
generate_volume 1 2 "Vol_01_Fatiha_Baqarah"
generate_volume 3 3 "Vol_02_Al_Imran"
generate_volume 4 4 "Vol_03_An_Nisa"
generate_volume 5 5 "Vol_04_Al_Maidah"
generate_volume 6 6 "Vol_05_Al_Anam"
generate_volume 7 7 "Vol_06_Al_Araf"
generate_volume 8 9 "Vol_07_Anfal_Tawbah"
generate_volume 10 11 "Vol_08_Yunus_Hud"
generate_volume 12 14 "Vol_09_Yusuf_to_Ibrahim"
generate_volume 15 16 "Vol_10_Hijr_Nahl"
generate_volume 17 18 "Vol_11_Isra_Kahf"
generate_volume 19 21 "Vol_12_Maryam_to_Anbiya"
generate_volume 22 25 "Vol_13_Hajj_to_Furqan"
generate_volume 26 26 "Vol_14_Ash_Shuara"
generate_volume 27 29 "Vol_15_Naml_to_Ankabut"
generate_volume 30 35 "Vol_16_Rum_to_Fatir"
generate_volume 36 39 "Vol_17_Yasin_to_Zumar"
generate_volume 40 45 "Vol_18_Ghafir_to_Jathiyah"
generate_volume 46 50 "Vol_19_Ahqaf_to_Qaf"
generate_volume 51 57 "Vol_20_Zariyat_to_Hadid"

# Juz 28 and 29
generate_volume 58 66 "Vol_21_Juz_28_Mujadila_to_Tahrim"
generate_volume 67 77 "Vol_22_Juz_29_Mulk_to_Mursalat"

# Juz 30 (Amma Para) with Surah numbers in the name
generate_volume 78 85 "Vol_23_Juz_30_Surah_78_to_85"
generate_volume 86 100 "Vol_24_Juz_30_Surah_86_to_100"
generate_volume 101 114 "Vol_25_Juz_30_Surah_101_to_114"

echo "=========================================="
echo "✨ All 25 volumes generated successfully!"
echo "=========================================="
