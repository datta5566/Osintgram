# OSINT Learning Lab

This folder is a beginner-friendly learning environment for studying open-source intelligence (OSINT) on **your own accounts, devices, domains, photos, and test data**, or on systems for which you have written permission.

Source reel reference: https://www.instagram.com/reel/DaxGRUtxC6V/

Instagram did not expose the complete reel transcript externally, so this lab includes the confirmed reel tool plus a practical set of widely used OSINT learning tools. No tool is represented as being confirmed from the reel unless it was actually verified.

## Included tools

| Tool | Purpose | Installation |
|---|---|---|
| Maltego | Visual link analysis and relationship mapping | Official installer/reference only |
| Sherlock | Find public accounts that use a given username | Installed by setup script |
| Maigret | Username search and report generation | Installed by setup script |
| SpiderFoot | Automated OSINT and defensive attack-surface mapping | Cloned into the local tools folder |
| theHarvester | Collect public domain-related information | Kali/WSL setup |
| ExifTool | Read metadata from your own files and photos | Installed where supported |
| Shodan CLI | Review internet-exposure information for your own IP/assets | Installed; API key is never stored in GitHub |
| FaceCheck.ID | Manual face-search reference | Browser reference only; no upload automation |

## Quick setup

### Kali Linux / Ubuntu / WSL

```bash
cd learning-lab
chmod +x setup-kali.sh
./setup-kali.sh
```

Restart the terminal after setup if `pipx` commands are not immediately available.

### Windows PowerShell

Open PowerShell and run:

```powershell
cd learning-lab
Set-ExecutionPolicy -Scope Process Bypass
.\setup-windows.ps1
```

SpiderFoot and theHarvester work most reliably in Kali Linux or WSL.

## First learning exercises

Read `authorized-practice.md`. Start with:

1. Search **your own GitHub/Instagram username** using Sherlock and Maigret.
2. Read metadata from a photo you created using ExifTool.
3. Build a small Maltego graph using dummy names and example domains.
4. Run SpiderFoot only against a domain or IP you own and begin with passive modules.
5. Use Shodan only to review your own public IP or authorized company assets.

## Important restrictions

- Do not use these tools to obtain passwords, OTPs, session cookies, private messages, private-profile content, or unauthorized access.
- Do not stalk, harass, identify, track, or expose private individuals.
- Do not scan a company, Wi-Fi network, website, IP address, or account without permission.
- Never commit API keys, credentials, cookies, personal reports, downloaded photos, or investigation output to GitHub.
- Face-search tools should be used only on your own image or with the person's clear consent.
- Tool output is not proof of identity. Verify results and respect privacy and applicable law.

## Official sources

- Maltego: https://www.maltego.com/downloads/
- Sherlock: https://github.com/sherlock-project/sherlock
- Maigret: https://github.com/soxoj/maigret
- SpiderFoot: https://github.com/smicallef/spiderfoot
- theHarvester: https://github.com/laramies/theHarvester
- ExifTool: https://exiftool.org/
- Shodan CLI: https://cli.shodan.io/
- FaceCheck.ID: https://facecheck.id/
