# Integrity Checker for V.Dream v.1.0/v.1.1 by FODSOFT(TM)

param
(
    [string]$rutaVdream
)

$errores = @()
$es64 = $env:PROCESSOR_ARCHITECTURE -eq "AMD64"

if (-not $rutaVdream -or $rutaVdream -eq "") 
{
    $rutaVdream = "$env:LOCALAPPDATA\fodsoft\vdream"
}

function Tamano-Archivo 
{
    param([long]$bytes)
    return [math]::Ceiling($bytes / 1024)
}

if ($es64) 
{
    $tam_vdream = 4817
    $tam_core   = 1082
}
else 
{
    $tam_vdream = 4789
    $tam_core   = 1031
}

$archivos =
@(
    @{ nombre="vdream.exe"; ruta="$rutaVdream\vdream.exe"; tam=$tam_vdream },
    @{ nombre="vdream_core.exe"; ruta="$rutaVdream\vdream_core.exe"; tam=$tam_core }
)

foreach ($f in $archivos) 
{
    if (-Not (Test-Path $f.ruta)) 
    {
        $errores += "$($f.nombre) is missing"
        continue
    }
    $tamBytes = (Get-Item $f.ruta).Length
    $tamKB = Tamano-Archivo $tamBytes
    if ($tamKB -ne $f.tam) 
    {
        $errores += "$($f.nombre) has an invalid size ($tamKB KB)"
    }
}

$runtimeOK = $false
$dotnetList = & dotnet --list-runtimes 2>$null

if ($dotnetList) 
{
    if ($dotnetList -match "Microsoft.NETCore.App 8\.0" -and
        $dotnetList -match "Microsoft.WindowsDesktop.App 8\.0") 
    {
        $runtimeOK = $true
    }
}

if (-Not $runtimeOK) 
{
    $errores += ".NET 8 Desktop Runtime is missing"
}

if ($errores.Count -eq 0) 
{
    Write-Host "OK" -ForegroundColor Green
}
else 
{
    Write-Host "KO" -ForegroundColor Red
    foreach ($e in $errores) 
    {
        Write-Host $e
    }
}
# FODSOFT(TM). Neo Fodere de Frutos. All rights reserved.
