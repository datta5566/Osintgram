# Instagram Reel Tool Setup — DaxGRUtxC6V

Source reel: https://www.instagram.com/reel/DaxGRUtxC6V/

This folder records the tools mentioned in the reel and provides safe environment checks. It does **not** contain copied commercial software, passwords, Instagram credentials, scraping automation, private-profile bypasses, or exploit code.

## Identification status

| Tool | Status | How it is included |
|---|---|---|
| Maltego | Confirmed from the available reel transcript | Official-installation reference and local availability check |
| FaceCheck.ID | Probable, not fully confirmed because Instagram did not expose the complete reel transcript | Reference only; no automated face search or upload |
| Tool #1 | Pending identification | Placeholder only—no guessed software added |

## 1. Maltego

Maltego is desktop investigation/link-analysis software. It is not redistributed inside this repository. Install it only from the official source:

- https://www.maltego.com/downloads/

After installation, run one of the local check scripts in this folder. The script only checks whether the command is available; it does not run an investigation or collect anyone's information.

## 2. FaceCheck.ID — unconfirmed reference

The available reel text appears to describe a service that searches for public social-profile references using a face photo. This may refer to FaceCheck.ID, but the full reel could not be verified. For that reason, it is listed only in `tools.json` as **probable-not-confirmed** and is not opened or automated by either script.

Use facial-search services only with the person's consent, for your own images, or for a legitimate authorized purpose. Do not use them to stalk, harass, dox, or identify private individuals.

## Run the checks

### Windows PowerShell

```powershell
powershell -ExecutionPolicy Bypass -File .\check-tools.ps1
```

### Linux / Kali / macOS

```bash
chmod +x check-tools.sh
./check-tools.sh
```

## Safety rules

- Work only on your own accounts, devices, data, or systems for which you have clear written authorization.
- Do not attempt to bypass private accounts, authentication, rate limits, or platform security controls.
- Never commit credentials, session cookies, API keys, access tokens, exported personal data, or investigation results to GitHub.
- Follow Instagram's terms, applicable privacy law, and your organization's written authorization.

## Next identification step

Tool #1 and the exact identity of Tool #3 should be updated only after the reel's complete audio or screenshots showing the tool names are available. Do not add a tool based only on a guess.
