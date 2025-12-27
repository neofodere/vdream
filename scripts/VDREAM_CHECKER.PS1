# Integrity Checker for V.Dream by FODSOFT(TM)

param([string]$rutaVdream)

$errores = @()
$es64 = $env:PROCESSOR_ARCHITECTURE -eq "AMD64"

if (-not $rutaVdream -or $rutaVdream -eq "") 
{
    $rutaVdream = "$env:LOCALAPPDATA\fodsoft\vdream"
}

function KB 
{ 
    param($bytes) [math]::Ceiling($bytes / 1024) 
}

$versiones =
@(
    @{
        ver = "v1.1"
        vdream = if ($es64) { 4817 } else { 4789 }
        core = if ($es64) { 1082 } else { 1031 }
    },
    @{
        ver = "v1.2"
        vdream = if ($es64) { 4818 } else { 4791 }
        core = if ($es64) { 1082 } else { 1031 }
    }
)

$rutaVdream = "$rutaVdream\vdream.exe"
$rutaCore = "$rutaVdream\vdream_core.exe"

if (-not (Test-Path $rutaVdream))
{ 
    $errores += "vdream.exe is missing" 
}

if (-not (Test-Path $rutaCore))   
{ 
    $errores += "vdream_core.exe is missing" 
}

if ($errores.Count -eq 0) 
{
    $tam_vdream = KB ((Get-Item $rutaVdream).Length)
    $tam_core   = KB ((Get-Item $rutaCore).Length)
    $versionDetectada = $versiones |
        Where-Object { $_.vdream -eq $tam_vdream -and $_.core -eq $tam_core } |
        Select-Object -First 1
    if (-not $versionDetectada) 
    {
        $errores += "Unknown or modified V.Dream version (vdream=$tam_vdream KB, core=$tam_core KB)"
    }
}

$dotnetList = & dotnet --list-runtimes 2>$null
if (-not ($dotnetList -match "Microsoft.NETCore.App 8\.0" -and
    $dotnetList -match "Microsoft.WindowsDesktop.App 8\.0")) 
{
    $errores += ".NET 8 Desktop Runtime is missing"
}

if ($errores.Count -eq 0) 
{
    Write-Host "$($versionDetectada.ver) OK" -ForegroundColor Green
}
else 
{
    Write-Host "KO" -ForegroundColor Red
    $errores | ForEach-Object { Write-Host $_ }
}
# FODSOFT(TM). Neo Fodere de Frutos. All rights reserved.
