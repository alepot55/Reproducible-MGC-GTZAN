#!/bin/bash

# Script di installazione per il progetto NAML (Linux)
# Configura l'ambiente virtuale, installa le dipendenze Python e di sistema.

set -e  # Esce se qualsiasi comando fallisce

echo "🎵 NAML Project - Setup Environment"
echo "=================================="

# --- 1. Verifica Prerequisiti ---
if ! command -v python3 &> /dev/null; then
    echo "❌ Errore: Python 3 non è installato."
    echo "   Installa Python 3.8+ e riprova."
    exit 1
fi
PYTHON_VERSION=$(python3 --version)
echo "✅ Python trovato: $PYTHON_VERSION"

# --- 2. Installazione Dipendenze di Sistema (per Librosa/PySoundFile) ---
# Questo blocco è specifico per sistemi Debian/Ubuntu.
if [ -f /etc/debian_version ]; then
    echo "🐧 Rilevato sistema basato su Debian/Ubuntu."
    echo "🔧 Installazione della libreria di sistema 'libsndfile1' per il caricamento audio veloce..."
    
    # Aggiorna la lista dei pacchetti e installa senza richiedere conferma
    sudo apt-get update -y
    sudo apt-get install -y libsndfile1
    
    echo "✅ 'libsndfile1' installata con successo."
else
    echo "⚠️ Avviso: Script ottimizzato per Debian/Ubuntu. Su altri OS (es. Fedora, macOS),"
    echo "   potrebbe essere necessario installare 'libsndfile' manualmente (es. 'sudo dnf install libsndfile' o 'brew install libsndfile')."
fi

# --- 3. Creazione Ambiente Virtuale ---
if [ ! -d "venv" ]; then
    echo "📦 Creazione virtual environment..."
    python3 -m venv venv
    echo "✅ Virtual environment creato."
else
    echo "✅ Virtual environment già esistente."
fi

# --- 4. Attivazione e Installazione Dipendenze Python ---
echo "🔧 Attivazione virtual environment..."
source venv/bin/activate

echo "⬆️  Aggiornamento pip..."
python -m pip install --upgrade pip

# Controlla se esiste requirements.txt
if [ ! -f "requirements.txt" ]; then
    echo "❌ Errore: File 'requirements.txt' non trovato."
    echo "   Assicurati che il file esista nella stessa cartella dello script."
    exit 1
fi

echo "📚 Installazione dipendenze da requirements.txt..."
python -m pip install -r requirements.txt
# Aggiungiamo una reinstallazione forzata di pysoundfile per essere sicuri
# che si colleghi alla libreria di sistema appena installata.
echo "🔧 Riconfigurazione di PySoundFile..."
python -m pip install --upgrade --force-reinstall pysoundfile

# --- 5. Istruzioni Finali ---
echo ""
echo "🎉 Installazione completata con successo!"
echo ""
echo "Per attivare l'ambiente virtuale in futuro, esegui:"
echo "   source venv/bin/activate"
echo ""
echo "Per avviare Jupyter Lab:"
echo "   jupyter lab"
echo ""
echo "Per disattivare l'ambiente virtuale:"
echo "   deactivate"