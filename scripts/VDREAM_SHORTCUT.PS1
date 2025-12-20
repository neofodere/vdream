# V.Dream Shortcut Creator by FODSOFT(TM)

param
(
    [string]$rutaVdream
)

if (-not $rutaVdream -or $rutaVdream -eq "") 
{
    $rutaVdream = "$env:LOCALAPPDATA\fodsoft\vdream\vdream.exe"
}
$rutaAccesoDirectoEscritorio = "$env:USERPROFILE\Desktop\V.Dream.lnk"
$rutaAccesoDirectoMenuInicio = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\V.Dream\V.Dream.lnk"

if (-Not (Test-Path $rutaVdream)) 
{
    Write-Host "V.Dream could not be found in the expected location:"
    Write-Host "$rutaVdream"
    Write-Host ""
    Write-Host "Please reinstall V.Dream from the official website to restore missing files."
    exit
}
$WshShell = New-Object -ComObject WScript.Shell
$accesoDirecto = $WshShell.CreateShortcut($rutaAccesoDirectoEscritorio)
$accesoDirecto.TargetPath = $rutaVdream
$accesoDirecto.WorkingDirectory = Split-Path $rutaVdream
$accesoDirecto.Save()
Write-Host "Shortcut created successfully on your Desktop."

$rutaCarpetaMenuInicio = Split-Path $rutaAccesoDirectoMenuInicio
if (-Not (Test-Path $rutaCarpetaMenuInicio)) 
{
    New-Item -ItemType Directory -Path $rutaCarpetaMenuInicio | Out-Null
}
$accesoDirectoInicio = $WshShell.CreateShortcut($rutaAccesoDirectoMenuInicio)
$accesoDirectoInicio.TargetPath = $rutaVdream
$accesoDirectoInicio.WorkingDirectory = Split-Path $rutaVdream
$accesoDirectoInicio.Save()
Write-Host "Shortcut created successfully in the Start Menu."
# FODSOFT(TM). Neo Fodere de Frutos. All rights reserved.
