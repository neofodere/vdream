# VTech Signature Inserter for ROMs by FODSOFT(TM)

param
(
    [Parameter(Mandatory = $true)]
    [string]$rom,
    [Parameter(Mandatory = $false)]
    [string]$encode = "ascii",
    [Parameter(Mandatory = $false)]
    [string]$output = $null
)

$encode = $encode.ToLower()
if ($encode -ne "ascii" -and $encode -ne "unicode") 
{ 
    $encode = "ascii" 
}

if (-not (Test-Path $rom)) 
{ 
    exit 1 
}

if (-not $output) 
{
    $dir  = Split-Path $rom
    $nom  = [System.IO.Path]::GetFileNameWithoutExtension($rom)
    $ext  = [System.IO.Path]::GetExtension($rom)
    $output = Join-Path $dir "$nom.signed$ext"
}

[byte[]]$bin = [System.IO.File]::ReadAllBytes($rom)
if ($encode -eq "ascii") 
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
    [System.IO.File]::WriteAllBytes($output, $bin)
    Write-Host "Done" -ForegroundColor Green
}
# FODSOFT(TM). Neo Fodere de Frutos. All rights reserved.
