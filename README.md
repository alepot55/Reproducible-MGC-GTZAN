# Music Genre Classification: From Reproducibility to a New SOTA

**Authors:** Alessandro Potenza, Camilla Sed  
**Course:** Numerical Analysis for Machine Learning, Politecnico di Milano

---

## 1. Project Overview

This project provides a rigorous and reproducible investigation into Music Genre Classification (MGC) using the benchmark GTZAN dataset. The work is motivated by the reproducibility challenges prevalent in the field, where many published results report near-perfect accuracies that are difficult to verify and likely stem from methodological flaws.

Our primary contribution is twofold:
1.  **Establishing a Gold-Standard Pipeline:** We designed and implemented a data pre-processing and evaluation framework that explicitly prevents data leakage, a common pitfall in MGC research.
2.  **A Systematic Architectural Study:** Using this robust pipeline, we conducted a comparative analysis of three distinct deep learning architectures. This study culminates in establishing a new, reliable State-of-the-Art (SOTA) performance on GTZAN and provides a clear narrative on architectural evolution for this specific task.

Our final **U-Net-inspired classifier achieves a test accuracy of 83.5%**, demonstrating the superiority of a multi-scale feature learning approach. The entire project, from data preparation to final analysis, is documented and open-sourced to ensure full transparency and reproducibility.

---

## 2. Repository Structure

The project is organized into a clean and logical directory structure:

```
.
├── models/              # Saved .keras models from the final training runs.
├── notebooks/           # Jupyter notebooks detailing the project workflow.
│   ├── gtzan/
│   │   ├── 00_setup.ipynb
│   │   ├── 01_train_tournament.ipynb   # WP1 + WP2
│   │   └── 01c_kfold_unet.ipynb        # WP4 (optional)
│   │
│   ├── fma/
│   │   ├── 00_setup.ipynb
│   │   └── 01_train.ipynb              # WP3
│   │
│   ├── indian/
│   │   ├── 00_setup.ipynb
│   │   └── 01_train.ipynb
│   │
│   ├── tabla/
│   │   ├── 00_setup.ipynb
│   │   └── 01_train.ipynb
│   │
│   └── final_analysis.ipynb            # Aggregates all results and figures
├── paper.pdf            # The final research paper in PDF format.
├── reports/             # All generated figures, tables, and reports.
├── requirements.txt     # Python dependencies for the project.
├── setup.sh             # Shell script to set up the environment and data.
└── README.md            # This file.
```

---

## 3. The Research Workflow: A Research-Grade, Reproducible Journey

Our research process is documented across three distinct Jupyter notebooks, each with a specific responsibility. This separation ensures a clean and reproducible workflow.

### 📓 `gtzan/00_setup.ipynb`
This notebook is the foundation of the project. It handles the critical task of preparing the GTZAN dataset with a leak-free pipeline.

-   **Input:** Raw GTZAN audio files.
-   **Process:**
    1.  Performs a leak-free, stratified split of the *file paths* (60% train, 20% validation, 20% test).
    2.  Augments the data by segmenting each 30-second clip into 10 smaller chunks.
    3.  Extracts Mel-spectrograms from each audio segment.
    4.  Standardizes features by fitting a scaler **only on the training data**.
-   **Output:** Processed NumPy arrays (`X_train`, `y_train`, etc.) and fitted `scaler`/`label_encoder` objects saved to the `data/processed` directory (not tracked by Git).

### 📓 `gtzan/01_train_tournament.ipynb`
This is the primary computation notebook. It takes the processed data and runs our definitive comparative analysis with and without SpecAugment, also computing efficiency metrics.

-   **Input:** The processed data arrays from Notebook 00.
-   **Process:**
    1.  Defines our three curated architectures: `Efficient_VGG`, `ResSE_AudioCNN`, and `UNet_Audio_Classifier`.
    2.  Systematically trains and evaluates each model under identical conditions.
    3.  Uses robust callbacks for early stopping, learning rate reduction, and saving the best model weights.
-   **Output:**
    -   Best model weights (`.keras` files) saved to the `models/` directory.
    -   A final summary CSV (`training_summary_final.csv`) saved to the `reports/` directory.

### 📓 `final_analysis.ipynb`
This notebook aggregates all results and produces publication-quality figures. It **does not train any models**. Code is English-only; explanatory text is bilingual where helpful.

-   **Input:** The `training_summary_final.csv` and the best `.keras` models.
-   **Process:**
    1.  Loads the tournament results and identifies the champion model.
    2.  Generates publication-quality visualizations:
        -   A bar chart comparing the performance of the three models.
        -   A detailed confusion matrix for the champion model.
        -   A t-SNE plot to visualize the learned feature embeddings.
    3.  Generates a detailed classification report with per-class metrics.
-   **Output:** All figures and text reports saved to the `reports/` directory.

---

## 4. How to Reproduce

Follow these steps to set up the environment and reproduce our results.

### Step 1: Clone the Repository
```bash
git clone <your-repository-url>
cd naml_project
```

### Step 2: Set Up the Environment
Create a Python virtual environment and install the required dependencies.
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Step 3: Download and Prepare Data
Run the `setup.sh` script. This script will:
1.  Create the necessary directory structure (`data/raw`, `data/processed`).
2.  Set up the Kaggle API credentials (you must have your `kaggle.json` file in the `kaggle/` directory).
3.  Download the GTZAN dataset from Kaggle into `data/raw`.
4.  Unzip the dataset.

```bash
# Make sure your kaggle.json is in the kaggle/ directory first!
bash setup.sh
```

### Step 4: Run the Notebooks in Order
Open the `notebooks/` directory and run the Jupyter notebooks sequentially:
1.  GTZAN prep — `gtzan/00_setup.ipynb`
2.  GTZAN tournament (WP1 + WP2) — `gtzan/01_train_tournament.ipynb`
3.  Optional WP4 (5-fold CV UNet) — `gtzan/01c_kfold_unet.ipynb`
4.  FMA Small prep — `fma/00_setup.ipynb`
5.  FMA Small training (WP3) — `fma/01_train.ipynb`
6.  Final analysis — `final_analysis.ipynb`

After running these notebooks, the `reports/` directory will be fully populated with the results documented in our paper.

Tips for speed and reliability:
- Notebooks are designed to avoid data leakage and to be deterministic as much as practical.
- Efficiency metrics (Params, FLOPs, Latency) are computed during the GTZAN tournament to avoid rework.
- Final analysis provides caching of artifacts (confusion matrix, report, t-SNE). Set `FINAL_ANALYSIS_USE_CACHE=0` in the environment if you want to force regeneration.
- To keep memory usage low during analysis, the champion deep-dive executes on CPU, uses small batches, and computes t-SNE on pooled features with balanced subsampling.

---

# Music Genre Classification on GTZAN — Research Workflow Upgrade

This repository contains our end-to-end pipeline for robust Music Genre Classification on GTZAN (and an additional generalization experiment on FMA Small).

## What’s new

We upgraded the project to support a research-grade analysis plan:
- WP1: Ablation on data augmentation (SpecAugment vs no augmentation)
- WP2: Computational efficiency analysis (Params, approximate FLOPs, latency)
- WP3: Cross-dataset generalization on FMA Small (UNet only)
- WP4 (optional): 5-fold cross-validation on GTZAN (UNet only)

## Final notebook structure

```
notebooks/
├── gtzan/
│   ├── 00_setup.ipynb
│   ├── 01_train_tournament.ipynb   # WP1 + WP2
│   └── 01c_kfold_unet.ipynb        # WP4 (optional)
│
├── fma/
│   ├── 00_setup.ipynb
│   └── 01_train.ipynb              # WP3
│
├── indian/
│   ├── 00_setup.ipynb
│   └── 01_train.ipynb
│
├── tabla/
│   ├── 00_setup.ipynb
│   └── 01_train.ipynb
│
└── final_analysis.ipynb            # Aggregates all results
```

## How to run

1) Environment
- Install Python deps: see `requirements.txt`.
- Ensure `data/gtzan/genres` is present (use the original Notebook 00 to download if needed).

2) GTZAN preparation
- Run `notebooks/gtzan/00_setup.ipynb`
  (It reuses arrays saved to `data/processed/`).

3) WP1 + WP2 on GTZAN
- Run `notebooks/gtzan/01_train_tournament.ipynb`.
- It trains three models with augmentation and without, saving:
  - `reports/training_summary_WITH_AUG.csv`
  - `reports/training_summary_NO_AUG.csv`
  - Model checkpoints in `models/` with tag suffixes.

4) WP3 on FMA Small (generalization)
- Place FMA Small at `data/fma_small/` (folder with genre subfolders).
- Run `notebooks/fma/00_setup.ipynb`.
- Run `notebooks/fma/01_train.ipynb` (UNet only). It writes `reports/training_summary_FMA.csv`.

5) Final analysis and figures
- Run `notebooks/final_analysis.ipynb` to produce:
  - WP1 comparison table: with vs without augmentation (+ percentage gain)
  - WP2 efficiency table: Params, approx FLOPs, latency, accuracy
  - FMA summary table
  - Leaderboard and champion deep-dive: normalized and raw confusion matrix, classification report, and t-SNE of learned features

6) WP4 (optional)
- Run `notebooks/gtzan/01c_kfold_unet.ipynb` to compute 5-fold CV on the GTZAN train+val split for UNet. Produces `reports/kfold_cv_unet_gtzan.csv` with mean±std.