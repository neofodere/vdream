# V.Dream Shortcut Creator by FODSOFT(TM)

$rutaVdream = "$env:LOCALAPPDATA\fodsoft\vdream\vdream.exe"
$rutaAccesoDirecto = "$env:USERPROFILE\Desktop\V.Dream.lnk"

if (-Not (Test-Path $rutaVdream)) 
{
    Write-Host "V.Dream could not be found in the expected location: "
    Write-Host "$rutaVdream"
    Write-Host ""
    Write-Host "Please reinstall V.Dream from the official website to restore missing files."
    exit
}

$WshShell = New-Object -ComObject WScript.Shell
$accesoDirecto = $WshShell.CreateShortcut($rutaAccesoDirecto)
$accesoDirecto.TargetPath = $rutaVdream
$accesoDirecto.Save()
Write-Host "Shortcut created successfully on your Desktop."
# FODSOFT(TM). Neo Fodere de Frutos. All rights reserved.
