#!/usr/bin/env python3
"""
Script per configurare le credenziali Kaggle
Questo script aiuta a configurare automaticamente le credenziali Kaggle
"""

import os
import json
import shutil
from pathlib import Path

def setup_kaggle_credentials():
    """Setup guidato per le credenziali Kaggle"""
    
    print("🔧 Setup Credenziali Kaggle")
    print("=" * 40)
    
    # Determina il path delle credenziali nel progetto
    project_root = Path(__file__).parent.parent  # Vai alla root del progetto
    kaggle_dir = project_root / 'kaggle'
    kaggle_json_path = kaggle_dir / 'kaggle.json'
    
    print(f"📁 Cartella credenziali: {kaggle_dir}")
    print(f"📄 File credenziali: {kaggle_json_path}")
    
    # Verifica se le credenziali esistono già
    if kaggle_json_path.exists():
        print("✅ Le credenziali Kaggle sono già configurate!")
        
        # Verifica che siano valide
        try:
            with open(kaggle_json_path, 'r') as f:
                creds = json.load(f)
                if 'username' in creds and 'key' in creds:
                    print(f"👤 Username: {creds['username']}")
                    print("🔑 API Key: configurata")
                    return True
                else:
                    print("⚠️  Il file kaggle.json sembra essere malformato")
        except Exception as e:
            print(f"❌ Errore nella lettura del file: {e}")
    
    print("\n🔧 Le credenziali Kaggle non sono configurate.")
    print("\n📋 Segui questi passi:")
    
    print("\n1. 🌐 Vai su https://www.kaggle.com/account")
    print("2. 📥 Nella sezione 'API', clicca 'Create New API Token'")
    print("3. 📁 Verrà scaricato un file 'kaggle.json'")
    
    # Crea la cartella .kaggle se non esiste
    print(f"\n4. 📂 Creazione cartella {kaggle_dir}...")
    kaggle_dir.mkdir(exist_ok=True)
    print("   ✅ Cartella creata")
    
    # Cerca il file kaggle.json in possibili locations
    possible_locations = [
        Path.home() / 'Downloads' / 'kaggle.json',
        Path.home() / 'Desktop' / 'kaggle.json',
        Path.cwd() / 'kaggle.json'
    ]
    
    found_kaggle_json = None
    for location in possible_locations:
        if location.exists():
            found_kaggle_json = location
            break
    
    if found_kaggle_json:
        print(f"\n🎯 Trovato kaggle.json in: {found_kaggle_json}")
        response = input("Vuoi copiarlo automaticamente? (s/n): ").lower().strip()
        
        if response in ['s', 'si', 'y', 'yes']:
            try:
                shutil.copy2(found_kaggle_json, kaggle_json_path)
                print(f"✅ File copiato in: {kaggle_json_path}")
                
                # Imposta i permessi corretti (Unix-like systems)
                if os.name != 'nt':  # Non Windows
                    os.chmod(kaggle_json_path, 0o600)
                    print("🔒 Permessi impostati correttamente")
                
                print("🎉 Configurazione completata!")
                return True
                
            except Exception as e:
                print(f"❌ Errore nella copia: {e}")
        else:
            print("ℹ️  Copia manualmente il file nella posizione corretta")
    else:
        print("\n5. 📁 Copia il file kaggle.json in una di queste posizioni:")
        for location in possible_locations:
            print(f"   {location}")
        print(f"\n6. 🔄 Poi riesegui questo script")
    
    print(f"\n💡 Comando per copia manuale:")
    print(f"   cp ~/Downloads/kaggle.json {kaggle_json_path}")
    
    if os.name != 'nt':  # Non Windows
        print(f"   chmod 600 {kaggle_json_path}")
    
    return False

def test_kaggle_connection():
    """Testa la connessione a Kaggle"""
    try:
        # Imposta la directory delle credenziali Kaggle per il progetto
        project_root = Path(__file__).parent.parent
        kaggle_dir = project_root / 'kaggle'
        os.environ['KAGGLE_CONFIG_DIR'] = str(kaggle_dir)
        
        import kaggle
        print("🧪 Test connessione Kaggle...")
        
        # Prova a ottenere le informazioni dell'utente
        kaggle.api.authenticate()
        print("✅ Autenticazione riuscita!")
        
        # Test semplice di connessione
        try:
            kaggle.api.dataset_list(search='gtzan')
            print("🎵 Connessione a Kaggle API verificata")
        except:
            print("🎵 Autenticazione completata")
        
        return True
        
    except Exception as e:
        print(f"❌ Errore nel test: {e}")
        print("🔧 Verifica la configurazione delle credenziali")
        return False

if __name__ == "__main__":
    print("🎵 Setup Kaggle per Progetto NAML")
    print("=" * 50)
    
    success = setup_kaggle_credentials()
    
    if success:
        print("\n🧪 Test della configurazione...")
        if test_kaggle_connection():
            print("\n🎉 Tutto configurato correttamente!")
            print("➡️  Ora puoi usare il notebook per scaricare il dataset")
        else:
            print("\n⚠️  Configurazione completata ma test fallito")
            print("🔧 Verifica le credenziali manualmente")
    else:
        print("\n📝 Completa la configurazione e riesegui lo script")
    
    print("\n📚 Per maggiori informazioni:")
    print("   https://github.com/Kaggle/kaggle-api#api-credentials")
