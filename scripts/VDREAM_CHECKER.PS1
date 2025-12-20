# V.Dream Integrity Checker by FODSOFT(TM)

$errores = @()
$es64 = $env:PROCESSOR_ARCHITECTURE -eq "AMD64"
$rutaBase = "$env:LOCALAPPDATA\fodsoft\vdream"

if ($es64) 
{
    $tam_vdream = 198KB
    $tam_core = 1082KB
    $tam_dll = 4613KB
} 
else 
{
    $tam_vdream = 168KB
    $tam_core = 1031KB
    $tam_dll = 4614KB
}

$archivos =
@(
    @{ nombre="vdream.exe"; ruta="$rutaBase\vdream.exe"; tam=$tam_vdream },
    @{ nombre="vdream_core.exe"; ruta="$rutaBase\vdream_core.exe"; tam=$tam_core },
    @{ nombre="vdream.dll"; ruta="$rutaBase\vdream.dll"; tam=$tam_dll },
    @{ nombre="vdream.deps.json"; ruta="$rutaBase\vdream.deps.json"; tam=1KB },
    @{ nombre="vdream.runtimeconfig.json"; ruta="$rutaBase\vdream.runtimeconfig.json"; tam=1KB }
)

foreach ($f in $archivos) 
{
    if (-Not (Test-Path $f.ruta)) 
    {
        $errores += "$($f.nombre) is missing"
        continue
    }
    $tamReal = (Get-Item $f.ruta).Length
    if ($tamReal -ne $f.tam) 
    {
        $errores += "$($f.nombre) has an invalid size ($tamReal bytes)"
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
# FODSOFT(TM). Neo Fodere de Frutos. All rights reserved
