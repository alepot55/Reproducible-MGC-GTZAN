@echo off
REM Script di installazione per il progetto NAML (Windows)
REM Questo script configura l'ambiente virtuale Python e installa le dipendenze

echo 🎵 NAML Project - Setup Environment
echo ==================================

REM Verifica che Python sia installato
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Errore: Python non è installato o non è nel PATH.
    echo    Installa Python 3.8+ da https://python.org e riprova.
    echo    Assicurati di selezionare "Add Python to PATH" durante l'installazione.
    pause
    exit /b 1
)

REM Mostra la versione di Python
for /f "tokens=2" %%i in ('python --version') do set PYTHON_VERSION=%%i
echo ✅ Python trovato: %PYTHON_VERSION%

REM Verifica che la versione sia almeno 3.8
python -c "import sys; exit(0 if sys.version_info >= (3, 8) else 1)"
if %errorlevel% neq 0 (
    echo ❌ Errore: Serve Python 3.8 o superiore.
    echo    Versione attuale: %PYTHON_VERSION%
    pause
    exit /b 1
)

echo ✅ Versione Python compatibile

REM Crea virtual environment se non esiste
if not exist "venv" (
    echo 📦 Creazione virtual environment...
    python -m venv venv
    echo ✅ Virtual environment creato
) else (
    echo ✅ Virtual environment già esistente
)

REM Attiva virtual environment
echo 🔧 Attivazione virtual environment...
call venv\Scripts\activate.bat

REM Aggiorna pip
echo ⬆️  Aggiornamento pip...
python -m pip install --upgrade pip

REM Installa le dipendenze
echo 📚 Installazione dipendenze da requirements.txt...
pip install -r requirements.txt

echo.
echo 🎉 Installazione completata con successo!
echo.
echo Per attivare l'ambiente virtuale in futuro, usa:
echo    venv\Scripts\activate.bat
echo.
echo Per avviare Jupyter Lab:
echo    venv\Scripts\activate.bat
echo    jupyter lab
echo.
echo Per disattivare l'ambiente virtuale:
echo    deactivate
echo.
pause
