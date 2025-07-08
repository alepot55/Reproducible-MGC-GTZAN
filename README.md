# Progetto Classificazione Genere Musicale

Questo progetto implementa un sistema di classificazione automatica dei generi musicali utilizzando il dataset GTZAN e tecniche di machine learning e deep learning.

## Struttura del Progetto

```
naml_project/
├── data/
│   └── Gtzan/                    # Dataset GTZAN
│       └── genres_original/
│           ├── blues/
│           ├── classical/
│           ├── country/
│           ├── disco/
│           ├── hiphop/
│           ├── jazz/
│           ├── metal/
│           ├── pop/
│           ├── reggae/
│           └── rock/
├── notebooks/
│   ├── 01_Data_Preparation_and_Feature_Extraction.ipynb
│   └── 02_Model_Training_and_Evaluation.ipynb
├── scripts/
│   └── (funzioni riutilizzabili)
├── venv/                         # Virtual environment
├── .gitignore
├── requirements.txt
└── README.md
```

## Dataset

Il progetto utilizza il dataset GTZAN, un dataset standard per la classificazione dei generi musicali che contiene:
- 10 generi musicali diversi
- 100 tracce audio per genere (30 secondi ciascuna)
- Formato: file audio WAV a 22050 Hz mono

### Download del Dataset

Per scaricare il dataset GTZAN:
1. Visita il sito ufficiale: http://marsyas.info/downloads/datasets.html
2. Scarica il file `genres.tar.gz`
3. Estrai il contenuto nella cartella `data/Gtzan/`

## Installazione

### Installazione Automatica (Consigliata)

#### Linux/macOS:
```bash
./setup.sh
```

#### Windows (Prompt dei comandi):
```cmd
setup.bat
```

#### Windows (PowerShell):
```powershell
.\setup.ps1
```

### Installazione Manuale

#### 1. Creare un Virtual Environment

```bash
python -m venv venv
source venv/bin/activate  # Su Windows: venv\Scripts\activate
```

#### 2. Installare le Dipendenze

```bash
pip install -r requirements.txt
```

## Utilizzo

### 1. Attivare l'Ambiente Virtuale
```bash
# Linux/macOS
source venv/bin/activate

# Windows (Prompt dei comandi)
venv\Scripts\activate.bat

# Windows (PowerShell)
venv\Scripts\Activate.ps1
```

### 2. Avviare Jupyter Lab
```bash
jupyter lab
```

### 3. Preparazione dei Dati
Eseguire il notebook `01_Data_Preparation_and_Feature_Extraction.ipynb` per:
- Caricare e esplorare il dataset
- Estrarre features audio (MFCC, Spectral Features, ecc.)
- Preparare i dati per il training

### 4. Training e Valutazione
Eseguire il notebook `02_Model_Training_and_Evaluation.ipynb` per:
- Addestrare modelli di machine learning e deep learning
- Valutare le performance
- Confrontare diversi approcci

## Troubleshooting

### Problemi Comuni

**Errore: "python non riconosciuto"**
- Assicurati che Python sia installato e nel PATH
- Su Windows, reinstalla Python selezionando "Add Python to PATH"

**Errore di permessi su PowerShell**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Problemi con TensorFlow**
- Su sistemi più vecchi, potrebbe essere necessario installare una versione specifica
- Per CPU only: `pip install tensorflow-cpu`

**Errori di memoria durante il training**
- Riduci la dimensione del batch
- Usa il gradient checkpointing
- Considera l'uso di un dataset ridotto per test

## Features Audio Estratte

- **MFCC (Mel-Frequency Cepstral Coefficients)**: Caratteristiche spettrali
- **Spectral Centroid**: Centro di massa dello spettro
- **Spectral Rolloff**: Frequenza sotto cui si concentra il 85% dell'energia
- **Zero Crossing Rate**: Tasso di attraversamento dello zero
- **Chroma Features**: Caratteristiche tonali
- **Tempo**: Velocità del brano

## Modelli Implementati

1. **Machine Learning Tradizionale**:
   - Random Forest
   - Support Vector Machine (SVM)
   - K-Nearest Neighbors (KNN)

2. **Deep Learning**:
   - Reti Neurali Dense
   - Reti Neurali Convoluzionali (CNN)

## Metriche di Valutazione

- Accuracy
- Precision, Recall, F1-score per classe
- Matrice di confusione
- Cross-validation

## Requisiti di Sistema

- Python 3.7+
- Almeno 4GB di RAM
- Spazio su disco: ~2GB per il dataset

## Contributi

Per contribuire al progetto:
1. Fork del repository
2. Crea un branch per la tua feature
3. Commit delle modifiche
4. Push al branch
5. Crea una Pull Request

## Licenza

Questo progetto è distribuito sotto licenza MIT.

## Contatti

Per domande o suggerimenti, apri una issue nel repository.
