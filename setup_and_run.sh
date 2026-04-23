#!/bin/bash
# ============================================================
#  AI-Based Energy Theft Detection System
#  One-click Setup & Run Script
# ============================================================
echo ""
echo "=================================================="
echo "  AI Energy Theft Detection System - Setup"
echo "=================================================="
echo ""

# 1. Create virtual environment
echo "[1/5] Creating Python virtual environment..."
python3 -m venv venv
source venv/bin/activate

# 2. Install dependencies
echo "[2/5] Installing dependencies..."
pip install -r requirements.txt --quiet

# 3. Create required directories
echo "[3/5] Creating directories..."
mkdir -p data models/saved api/templates api/static

# 4. Generate training data
echo "[4/5] Generating synthetic IoT dataset..."
cd data && python generate_data.py && cd ..

# 5. Train ML model
echo "[5/5] Training AI model..."
cd models && python train_model.py && cd ..

echo ""
echo "=================================================="
echo "  Setup complete! Starting dashboard..."
echo "  Open http://localhost:5000 in your browser"
echo "=================================================="
echo ""

# Run Flask API
cd api && python app.py
