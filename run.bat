@echo off
setlocal
cd /d "%~dp0"

where py >nul 2>&1
if %ERRORLEVEL%==0 (
  set "PY=py -3"
) else (
  set "PY=python"
)

if not exist .venv (
  echo Creation de l'environnement virtuel...
  %PY% -m venv .venv
  if errorlevel 1 (
    echo Python 3 introuvable. Installez-le depuis https://www.python.org/downloads/ en cochant "Add python.exe to PATH".
    pause
    exit /b 1
  )
)

call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt
if not exist .env (
  copy /Y .env.example .env
  echo Fichier .env cree. Les cles se collent dans Parametres, ou directement dans .env.
)

python main.py
if errorlevel 1 pause
endlocal
