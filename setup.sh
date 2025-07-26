#!/bin/bash
set -e

echo "🎵 NAML Project - Setup (Official TensorFlow Method)"
echo "================================================="

# 1. Prerequisito di Sistema (per Librosa)
echo "🔧 Verifying system dependencies (libsndfile1)..."
sudo apt-get update -y > /dev/null
sudo apt-get install -y libsndfile1

# 2. Ambiente Virtuale Python
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment 'venv'..."
    python3 -m v-env venv
fi
echo "✅ Activating virtual environment..."
source venv/bin/activate

# 3. Installazione Dipendenze Python
echo "⬆️  Updating pip..."
python -m pip install --upgrade pip

if [ ! -f "requirements.txt" ]; then
    echo "❌ ERROR: requirements.txt not found."
    exit 1
fi

echo "📚 Installing Python packages from requirements.txt..."
python -m pip install -r requirements.txt

echo ""
echo "🎉 Setup complete! The environment is ready."
echo "To activate in the future, run: source venv/bin/activate"