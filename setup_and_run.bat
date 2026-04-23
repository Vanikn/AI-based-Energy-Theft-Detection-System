@echo off
echo ==================================================
echo   AI Energy Theft Detection System - Setup
echo ==================================================
echo.

echo [1/5] Skipping virtual environment, using global Python...
:: py -m venv venv
:: call venv\Scripts\activate

echo [2/5] Installing dependencies...
pip install -r requirements.txt

echo [3/5] Creating directories...
mkdir data 2>nul
mkdir models\saved 2>nul
mkdir api\templates 2>nul
mkdir api\static 2>nul

echo [4/5] Generating synthetic IoT dataset...
cd data
py generate_data.py
cd ..

echo [5/5] Training AI model...
cd models
py train_model.py
cd ..

echo.
echo ==================================================
echo   Setup complete! Starting dashboard...
echo   Open http://localhost:5000 in your browser
echo ==================================================
echo.

cd api
py app.py
pause
