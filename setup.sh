#!/bin/bash

# Script di installazione per il progetto NAML (Linux/macOS)
# Questo script configura l'ambiente virtuale Python e installa le dipendenze

set -e  # Esce se qualsiasi comando fallisce

echo "🎵 NAML Project - Setup Environment"
echo "=================================="

# Verifica che Python sia installato
if ! command -v python3 &> /dev/null; then
    echo "❌ Errore: Python 3 non è installato."
    echo "   Installa Python 3.8+ e riprova."
    exit 1
fi

# Mostra la versione di Python
PYTHON_VERSION=$(python3 --version)
echo "✅ Python trovato: $PYTHON_VERSION"

# Verifica che la versione sia almeno 3.8
PYTHON_VER=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
REQUIRED_VER="3.8"
if python3 -c "import sys; exit(0 if sys.version_info >= (3, 8) else 1)"; then
    echo "✅ Versione Python compatibile: $PYTHON_VER"
else
    echo "❌ Errore: Serve Python 3.8 o superiore. Versione attuale: $PYTHON_VER"
    exit 1
fi

# Crea virtual environment se non esiste
if [ ! -d "venv" ]; then
    echo "📦 Creazione virtual environment..."
    python3 -m venv venv
    echo "✅ Virtual environment creato"
else
    echo "✅ Virtual environment già esistente"
fi

# Attiva virtual environment
echo "🔧 Attivazione virtual environment..."
source venv/bin/activate

# Aggiorna pip nel virtual environment
echo "⬆️  Aggiornamento pip..."
python -m pip install --upgrade pip

# Installa le dipendenze nel virtual environment
echo "📚 Installazione dipendenze da requirements.txt..."
python -m pip install -r requirements.txt

echo ""
echo "🎉 Installazione completata con successo!"
echo ""
echo "Per attivare l'ambiente virtuale in futuro, usa:"
echo "   source venv/bin/activate"
echo ""
echo "Per avviare Jupyter Lab:"
echo "   source venv/bin/activate"
echo "   jupyter lab"
echo ""
echo "Per disattivare l'ambiente virtuale:"
echo "   deactivate"
