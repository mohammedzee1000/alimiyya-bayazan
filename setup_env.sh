#!/bin/bash

# Define colors for terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}===============================================${NC}"
echo -e "${BLUE}  Alimiyya Bayazan Environment Setup Wizard  ${NC}"
echo -e "${BLUE}===============================================${NC}\n"

# --- SMART DETECT PYTHON ---
if command -v python3 &>/dev/null; then
    PY_CMD="python3"
elif command -v python &>/dev/null; then
    PY_CMD="python"
else
    echo -e "${YELLOW}Error: Python is not installed or not in your PATH.${NC}"
    exit 1
fi

# 1. Create Virtual Environment
if [ ! -d "venv" ]; then
    echo -e "${YELLOW}[1/4] Creating new Python virtual environment (venv) using ${PY_CMD}...${NC}"
    $PY_CMD -m venv venv
else
    echo -e "${GREEN}[1/4] Virtual environment 'venv' already exists. Skipping.${NC}"
fi

# 2. Activate the environment
echo -e "${YELLOW}[2/4] Activating virtual environment...${NC}"
source venv/bin/activate

# 3. Upgrade pip (Using the active venv's python)
echo -e "${YELLOW}[3/4] Upgrading pip...${NC}"
python -m pip install --upgrade pip -q

# 4. Install Dependencies
if [ -f "requirements.txt" ]; then
    echo -e "${YELLOW}[4/4] Found requirements.txt. Installing dependencies...${NC}"
    python -m pip install -r requirements.txt -q
else
    echo -e "${YELLOW}[4/4] No requirements.txt found. Installing python-docx...${NC}"
    python -m pip install python-docx -q
    
    echo -e "${YELLOW}      Saving dependencies to requirements.txt...${NC}"
    python -m pip freeze > requirements.txt
fi

echo -e "\n${GREEN}===============================================${NC}"
echo -e "${GREEN}  Setup Complete! The environment is ready.${NC}"
echo -e "${GREEN}===============================================${NC}\n"

echo -e "To start working in your terminal, run:"
echo -e "👉  ${YELLOW}source venv/bin/activate${NC}\n"

echo -e "Then generate your first workbook:"
echo -e "👉  ${YELLOW}${PY_CMD} generate_bayazan.py --start 78 --end 80${NC}\n"
