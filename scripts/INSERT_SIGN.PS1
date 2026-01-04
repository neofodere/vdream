# VTech Signature Inserter for ROMs by FODSOFT(TM)

param
(
    [Parameter(Mandatory = $true)]
    [string]$entrada,
    [Parameter(Mandatory = $false)]
    [string]$modo = "ascii",
    [Parameter(Mandatory = $false)]
    [string]$salida = $null
)

$modo = $modo.ToLower()
if ($modo -ne "ascii" -and $modo -ne "unicode") 
{ 
    $modo = "ascii" 
}

if (-not (Test-Path $entrada)) 
{ 
    exit 1 
}

if (-not $salida) 
{
    $dir  = Split-Path $entrada
    $nom  = [System.IO.Path]::GetFileNameWithoutExtension($entrada)
    $ext  = [System.IO.Path]::GetExtension($entrada)
    $salida = Join-Path $dir "$nom.patched$ext"
}

[byte[]]$bin = [System.IO.File]::ReadAllBytes($entrada)
if ($modo -eq "ascii") 
{
    $firma = [System.Text.Encoding]::ASCII.GetBytes("VTECH")
} 
else 
{
    $firma = [System.Text.Encoding]::Unicode.GetBytes("VTECH")
}

$len = $firma.Length
$ok = $false

for ($i = 0; $i -le $bin.Length - $len; $i++) 
{
    $libre = $true
    for ($j = 0; $j -lt $len; $j++) 
    {
        if ($bin[$i + $j] -ne 0x00) 
        { 
            $libre = $false; break 
        }
    }
    if ($libre) 
    {
        for ($j = 0; $j -lt $len; $j++) 
        { 
            $bin[$i + $j] = $firma[$j] 
        }
        $ok = $true
        break
    }
}

if (-not $ok) 
{
    Write-Host "No free space" -ForegroundColor Red
} 
else 
{
    [System.IO.File]::WriteAllBytes($salida, $bin)
    Write-Host "Done" -ForegroundColor Green
}
# FODSOFT(TM). Neo Fodere de Frutos. All rights reserved.
