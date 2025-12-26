# Corrupted image files Deleter for V.Dream by FODSOFT(TM)

$rutaCovers = Join-Path $PSScriptRoot "covers"

if (-Not (Test-Path $rutaCovers)) 
{
    $rutaInstalacion = Join-Path $env:LOCALAPPDATA "fodsoft\vdream\covers"
    if (Test-Path $rutaInstalacion) 
    {
        $rutaCovers = $rutaInstalacion
    }
    else 
    {
        Write-Host "The 'covers' folder does not exist."
        exit
    }
}

$imagenes = Get-ChildItem -Path $rutaCovers -Include *.png, *.jpg -File

foreach ($file in $imagenes) 
{
    try 
    {
        $img = [System.Drawing.Image]::FromFile($file.FullName)
        $img.Dispose()
    }
    catch 
    {
        Write-Host "Corrupted file deleted: $($file.Name)"
        Remove-Item $file.FullName -Force -ErrorAction SilentlyContinue
    }
}
# FODSOFT(TM). Neo Fodere de Frutos. All rights reserved.
