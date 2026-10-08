@echo off
setlocal
cd /d "%~dp0"
call .venv\Scripts\activate.bat
pip install pyinstaller
pyinstaller --noconfirm --windowed --name 7O2-OXYGEN --clean ^
  --hidden-import oxygen.ui.app ^
  --hidden-import oxygen.scrapers.seeknow_login ^
  --collect-all customtkinter ^
  main.py
echo.
echo Executable : dist\7O2-OXYGEN\7O2-OXYGEN.exe
echo Copiez .env a cote de l'exe. Le dossier data sera cree au premier lancement.
pause
endlocal
