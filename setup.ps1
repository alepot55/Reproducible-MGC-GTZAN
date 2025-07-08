# Script di installazione per il progetto NAML (Windows PowerShell)
# Questo script configura l'ambiente virtuale Python e installa le dipendenze

# Verifica esecuzione come amministratore non richiesta per questo script
Write-Host "🎵 NAML Project - Setup Environment" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan

try {
    # Verifica che Python sia installato
    $pythonVersion = python --version 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw "Python non trovato"
    }
    
    Write-Host "✅ Python trovato: $pythonVersion" -ForegroundColor Green
    
    # Verifica versione Python
    $versionCheck = python -c "import sys; exit(0 if sys.version_info >= (3, 8) else 1)"
    if ($LASTEXITCODE -ne 0) {
        throw "Python 3.8+ richiesto"
    }
    
    Write-Host "✅ Versione Python compatibile" -ForegroundColor Green
    
    # Crea virtual environment se non esiste
    if (!(Test-Path "venv")) {
        Write-Host "📦 Creazione virtual environment..." -ForegroundColor Yellow
        python -m venv venv
        Write-Host "✅ Virtual environment creato" -ForegroundColor Green
    } else {
        Write-Host "✅ Virtual environment già esistente" -ForegroundColor Green
    }
    
    # Attiva virtual environment
    Write-Host "🔧 Attivazione virtual environment..." -ForegroundColor Yellow
    & "venv\Scripts\Activate.ps1"
    
    # Aggiorna pip
    Write-Host "⬆️ Aggiornamento pip..." -ForegroundColor Yellow
    python -m pip install --upgrade pip
    
    # Installa le dipendenze
    Write-Host "📚 Installazione dipendenze da requirements.txt..." -ForegroundColor Yellow
    pip install -r requirements.txt
    
    Write-Host ""
    Write-Host "🎉 Installazione completata con successo!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Per attivare l'ambiente virtuale in futuro, usa:" -ForegroundColor Cyan
    Write-Host "   venv\Scripts\Activate.ps1" -ForegroundColor White
    Write-Host ""
    Write-Host "Per avviare Jupyter Lab:" -ForegroundColor Cyan
    Write-Host "   venv\Scripts\Activate.ps1" -ForegroundColor White
    Write-Host "   jupyter lab" -ForegroundColor White
    Write-Host ""
    Write-Host "Per disattivare l'ambiente virtuale:" -ForegroundColor Cyan
    Write-Host "   deactivate" -ForegroundColor White
    
} catch {
    Write-Host "❌ Errore: $_" -ForegroundColor Red
    Write-Host ""
    Write-Host "Assicurati che:" -ForegroundColor Yellow
    Write-Host "- Python 3.8+ sia installato" -ForegroundColor White
    Write-Host "- Python sia nel PATH" -ForegroundColor White
    Write-Host "- Il file requirements.txt esista" -ForegroundColor White
    exit 1
}

Write-Host ""
Write-Host "Premi un tasto per continuare..." -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
