# Authorized Practice Exercises

Use only your own identifiers, your own files/photos, your own public IP/domain, dummy data, or a target for which you have clear written permission.

## Exercise 1 — Your own username

Run Sherlock and Maigret with a username that belongs to you.

```bash
sherlock YOUR_OWN_USERNAME
maigret YOUR_OWN_USERNAME --html
```

Learning goal: compare false positives, unavailable profiles, and naming collisions. A matching username does not prove that the accounts belong to the same person.

## Exercise 2 — Your own photo metadata

Create or copy one of your own photos into a local practice folder that is excluded from GitHub.

```bash
mkdir -p private-practice
exiftool private-practice/your-photo.jpg
```

Learning goal: identify camera, date, editing-software, orientation, and location-related metadata. Do not upload the photo or metadata report to this repository.

## Exercise 3 — Dummy Maltego graph

Create a graph using dummy entities such as:

- Person: Test User
- Alias: test-user-01
- Domain: example.com
- Email: test@example.com

Learning goal: understand entities, links, layouts, notes, and evidence tracking without investigating a real person.

## Exercise 4 — SpiderFoot on an authorized asset

Start the local interface:

```bash
cd learning-lab/tools/spiderfoot
./venv/bin/python sf.py -l 127.0.0.1:5001
```

On Windows:

```powershell
cd learning-lab\tools\spiderfoot
.\venv\Scripts\python.exe sf.py -l 127.0.0.1:5001
```

Open `http://127.0.0.1:5001`. Use a domain/IP you own, begin with passive modules, and save results outside the Git repository.

## Exercise 5 — theHarvester on your own domain

```bash
theHarvester -d YOUR_OWN_DOMAIN -b crtsh,duckduckgo
```

Learning goal: understand what domain information is publicly discoverable. Do not use employee or email results for unsolicited contact, phishing, password attacks, or harassment.

## Exercise 6 — Shodan self-audit

Create a Shodan account and keep the API key only on your local computer. Follow the official CLI setup instructions. Review only your own public IP or authorized company assets.

Never paste an API key into a screenshot, chat, source file, `.env` committed to GitHub, or command history shared with others.

## Face-search restriction

FaceCheck.ID is a browser reference only. Test it only with your own image or with the person's clear consent. Do not use face search to identify, track, stalk, dox, or expose a private person. Treat every match as an unverified lead, not proof.

## Stop conditions

Stop immediately when:

- the target is not yours and permission is unclear;
- a tool requests someone else's credentials, OTP, session cookie, or private data;
- the activity could disrupt a service or bypass a security control;
- results expose sensitive personal information that is not needed for the authorized exercise.
