@echo off
setlocal
echo === FamilyPickTool v3.0.3 - Sesion 1 ===
set "DIR=%USERPROFILE%\familypicktool"

if exist "%DIR%\.git" (
  echo [*] Actualizando repositorio...
  cd /d "%DIR%"
  git pull --quiet
) else (
  if exist "%DIR%" rmdir /s /q "%DIR%"
  echo [*] Clonando repositorio...
  git clone https://github.com/durannahir313-design/familypicktool.git "%DIR%"
)

echo [*] Creando comando...
echo @php "%%~dp0launcher.php" %%* > "%DIR%\familypicktool.bat"

echo [*] Agregando al PATH...
setx PATH "%%PATH%%;%DIR%" >nul

echo.
echo [✓] Instalado correctamente.
echo     Cierra esta ventana, abre una nueva CMD y escribe: familypicktool
pause
