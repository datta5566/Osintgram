$ErrorActionPreference = "Stop"

Write-Host "Reel tool environment check"
Write-Host "==========================="

function Test-Command {
    param([Parameter(Mandatory = $true)][string]$Name)

    $command = Get-Command $Name -ErrorAction SilentlyContinue
    if ($null -ne $command) {
        Write-Host "[FOUND] $Name -> $($command.Source)"
        return $true
    }

    Write-Host "[NOT FOUND] $Name"
    return $false
}

[void](Test-Command -Name "python")
[void](Test-Command -Name "python3")
[void](Test-Command -Name "git")
[void](Test-Command -Name "docker")

$maltegoFound = (Test-Command -Name "maltego") -or (Test-Command -Name "maltego.exe")
if (-not $maltegoFound) {
    Write-Host "Maltego is not available as a terminal command. Install/check it only through the official page:"
    Write-Host "https://www.maltego.com/downloads/"
}

Write-Host ""
Write-Host "FaceCheck.ID is marked probable-not-confirmed and is not opened automatically."
Write-Host "Use all investigation tools only on your own data or with clear authorization."
Write-Host "Never save credentials, cookies, API keys, or investigation results in this repository."
