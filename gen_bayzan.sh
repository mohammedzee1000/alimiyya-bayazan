#!/bin/bash

# --- SMART DETECT PYTHON ---
if command -v python3 &>/dev/null; then
    PY_CMD="python3"
elif command -v python &>/dev/null; then
    PY_CMD="python"
else
    echo "Error: Python is not installed."
    exit 1
fi

echo "Generating all 25 Volumes using ${PY_CMD}..."

$PY_CMD generate_bayazan.py --start 1 --end 2 -o "Vol_01_Fatiha_Baqarah"
$PY_CMD generate_bayazan.py --start 3 --end 3 -o "Vol_02_Al_Imran"
$PY_CMD generate_bayazan.py --start 4 --end 4 -o "Vol_03_An_Nisa"
$PY_CMD generate_bayazan.py --start 5 --end 5 -o "Vol_04_Al_Maidah"
$PY_CMD generate_bayazan.py --start 6 --end 6 -o "Vol_05_Al_Anam"
$PY_CMD generate_bayazan.py --start 7 --end 7 -o "Vol_06_Al_Araf"
$PY_CMD generate_bayazan.py --start 8 --end 9 -o "Vol_07_Anfal_Tawbah"
$PY_CMD generate_bayazan.py --start 10 --end 11 -o "Vol_08_Yunus_Hud"
$PY_CMD generate_bayazan.py --start 12 --end 14 -o "Vol_09_Yusuf_to_Ibrahim"
$PY_CMD generate_bayazan.py --start 15 --end 16 -o "Vol_10_Hijr_Nahl"
$PY_CMD generate_bayazan.py --start 17 --end 18 -o "Vol_11_Isra_Kahf"
$PY_CMD generate_bayazan.py --start 19 --end 21 -o "Vol_12_Maryam_to_Anbiya"
$PY_CMD generate_bayazan.py --start 22 --end 25 -o "Vol_13_Hajj_to_Furqan"
$PY_CMD generate_bayazan.py --start 26 --end 26 -o "Vol_14_Ash_Shuara"
$PY_CMD generate_bayazan.py --start 27 --end 29 -o "Vol_15_Naml_to_Ankabut"
$PY_CMD generate_bayazan.py --start 30 --end 35 -o "Vol_16_Rum_to_Fatir"
$PY_CMD generate_bayazan.py --start 36 --end 39 -o "Vol_17_Yasin_to_Zumar"
$PY_CMD generate_bayazan.py --start 40 --end 45 -o "Vol_18_Ghafir_to_Jathiyah"
$PY_CMD generate_bayazan.py --start 46 --end 50 -o "Vol_19_Ahqaf_to_Qaf"
$PY_CMD generate_bayazan.py --start 51 --end 57 -o "Vol_20_Zariyat_to_Hadid"

# Juz 28 and 29
$PY_CMD generate_bayazan.py --start 58 --end 66 -o "Vol_21_Juz_28_Mujadila_to_Tahrim"
$PY_CMD generate_bayazan.py --start 67 --end 77 -o "Vol_22_Juz_29_Mulk_to_Mursalat"

# Juz 30 (Amma Para)
$PY_CMD generate_bayazan.py --start 78 --end 85 -o "Vol_23_Juz_30_Part1"
$PY_CMD generate_bayazan.py --start 86 --end 100 -o "Vol_24_Juz_30_Part2"
$PY_CMD generate_bayazan.py --start 101 --end 114 -o "Vol_25_Juz_30_Part3"

echo "All volumes generated successfully!"
