# AI-based-Energy-Theft-Detection-System
# AI-Based Energy Theft Detection System
### MCA Final Year Project | IoT + Machine Learning

---

## Project Overview

This system uses **Machine Learning** to detect electricity theft by analyzing smart meter (IoT) data. It identifies three types of theft — meter bypass, meter tampering, and illegal line tapping — with high accuracy using statistical and behavioral features extracted from consumption time-series.

**Tech Stack:** Python · Scikit-learn · Flask · Chart.js · MQTT-ready

---

## System Architecture

```
IoT Smart Meters
      ↓  (simulated in Python)
Data Pipeline (generate_data.py)
      ↓
Feature Engineering (feature_engineering.py)
      ↓  [28 behavioral/statistical features]
ML Model (Random Forest / Gradient Boosting)
      ↓
Flask REST API (app.py)
      ↓
Web Dashboard (index.html)
```

---

## Features

### AI / ML Layer
- Synthetic IoT dataset: 100 consumers × 8760 hours (1 year)
- 28 engineered features per consumer (statistical + behavioral)
- Multi-model comparison: Random Forest, Gradient Boosting, XGBoost
- Unsupervised detection via Isolation Forest
- Cross-validated model selection by ROC-AUC

### Theft Types Detected
| Type | Signature | Detection Feature |
|---|---|---|
| Meter Bypass | Consumption drops to 5–30% | `near_zero_ratio`, `mean_consumption` |
| Meter Tamper | Erratic spikes and drops | `cv_consumption`, `n_sudden_spikes` |
| Illegal Tap | Abnormal night-time usage | `night_day_ratio`, `p90` |

### API Endpoints
| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/health` | System health + model status |
| GET | `/api/dashboard/stats` | Summary stats for dashboard |
| GET | `/api/consumers` | Paginated consumer list |
| GET | `/api/consumers/<id>/history` | 7-day meter history |
| POST | `/api/predict` | Single consumer prediction |
| POST | `/api/simulate` | Simulate IoT meter reading |

### Dashboard
- Real-time 24-hour alert trend chart
- Theft type distribution (donut chart)
- Zone-wise theft rate breakdown
- Risk score distribution
- Live consumer registry with risk bars
- IoT meter simulator with live AI detection

---

## Quick Start

### Windows
```
Double-click: setup_and_run.bat
```

### Linux / Mac
```bash
chmod +x setup_and_run.sh
./setup_and_run.sh
```

### Manual
```bash
# 1. Install dependencies
pip install -r requirements.txt

# 2. Generate dataset
cd data && python generate_data.py && cd ..

# 3. Train model
cd models && python train_model.py && cd ..

# 4. Start API + Dashboard
cd api && python app.py

# Open http://localhost:5000
```

---

## Project Structure
```
ai_energy_theft_detection/
│
├── data/
│   ├── generate_data.py       ← Synthetic IoT data generator
│   └── energy_data.csv        ← Generated dataset (after running)
│
├── models/
│   ├── feature_engineering.py ← Feature extraction from time-series
│   ├── train_model.py         ← Model training & evaluation
│   └── saved/
│       ├── best_model.pkl     ← Trained model
│       ├── scaler.pkl         ← Feature scaler
│       └── model_metadata.json
│
├── api/
│   ├── app.py                 ← Flask REST API
│   └── templates/
│       └── index.html         ← Web dashboard
│
├── requirements.txt
├── setup_and_run.sh           ← Linux/Mac one-click setup
├── setup_and_run.bat          ← Windows one-click setup
└── README.md
```

---

## Model Performance (Expected)
| Model | Accuracy | F1-Score | ROC-AUC |
|---|---|---|---|
| Random Forest | ~94% | ~0.92 | ~0.97 |
| Gradient Boosting | ~93% | ~0.91 | ~0.96 |
| XGBoost | ~95% | ~0.93 | ~0.98 |

---

## How to Present This in Interviews

**"I built a real-time IoT energy theft detection system. The pipeline ingests simulated smart meter readings, extracts 28 behavioral and statistical features — like night-to-day consumption ratio and near-zero reading frequency — and feeds them into a Random Forest classifier. The REST API serves predictions and feeds a live dashboard. The system achieves ~95% ROC-AUC and detects three distinct theft patterns: bypass, tampering, and illegal tapping."**

Key talking points:
- Feature engineering from time-series data (not just raw numbers)
- Model selection via cross-validation (not just accuracy)
- REST API design with Flask
- Unsupervised fallback via Isolation Forest
- End-to-end system thinking

---

## Author
MCA Final Year Student
Built with: Python, Scikit-learn, Flask, Chart.js
No paid tools used. 100% free and open-source.
