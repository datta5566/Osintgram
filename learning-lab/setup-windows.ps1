$ErrorActionPreference = "Stop"

Write-Host "OSINT Learning Lab setup" -ForegroundColor Cyan
Write-Host "Use only your own data/assets or targets with written permission.`n"

function Require-Command {
    param([Parameter(Mandatory=$true)][string]$Name)
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "$Name is required but was not found. Install it, reopen PowerShell, and run this script again."
    }
}

Require-Command "python"
Require-Command "git"

python -m pip install --user --upgrade pip pipx
python -m pipx ensurepath | Out-Null

$UserScripts = Join-Path $env:APPDATA "Python\Python313\Scripts"
$possiblePaths = @(
    (Join-Path $env:USERPROFILE ".local\bin"),
    $UserScripts
)
foreach ($path in $possiblePaths) {
    if (Test-Path $path) { $env:PATH = "$path;$env:PATH" }
}

function Install-PipxTool {
    param([Parameter(Mandatory=$true)][string]$Package)
    try {
        python -m pipx install $Package
    }
    catch {
        Write-Host "$Package may already be installed; attempting upgrade." -ForegroundColor Yellow
        python -m pipx upgrade $Package
    }
}

Install-PipxTool "sherlock-project"
Install-PipxTool "maigret"
Install-PipxTool "shodan"

$LabDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ToolsDir = Join-Path $LabDir "tools"
$SpiderFootDir = Join-Path $ToolsDir "spiderfoot"
New-Item -ItemType Directory -Path $ToolsDir -Force | Out-Null

if (-not (Test-Path (Join-Path $SpiderFootDir ".git"))) {
    git clone https://github.com/smicallef/spiderfoot.git $SpiderFootDir
}
else {
    git -C $SpiderFootDir pull --ff-only
}

$VenvDir = Join-Path $SpiderFootDir "venv"
if (-not (Test-Path $VenvDir)) {
    python -m venv $VenvDir
}

$VenvPython = Join-Path $VenvDir "Scripts\python.exe"
& $VenvPython -m pip install --upgrade pip
& $VenvPython -m pip install -r (Join-Path $SpiderFootDir "requirements.txt")

Write-Host "`nSetup complete." -ForegroundColor Green
Write-Host @"

Check tools after reopening PowerShell:
  sherlock --help
  maigret --help
  shodan --help

Start SpiderFoot locally:
  cd learning-lab\tools\spiderfoot
  .\venv\Scripts\python.exe sf.py -l 127.0.0.1:5001

Then open http://127.0.0.1:5001 in your browser.
Use passive modules first and scan only assets you own or have permission to test.

theHarvester is recommended through Kali Linux or WSL using setup-kali.sh.
ExifTool and Maltego should be installed from their official sources:
  https://exiftool.org/
  https://www.maltego.com/downloads/

Never save API keys, cookies, credentials, or investigation output in GitHub.
"@
