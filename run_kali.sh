#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Python 3 is required. Install it with: sudo apt update && sudo apt install -y python3 python3-venv python3-pip"
  exit 1
fi

if [ ! -d "venv" ]; then
  echo "Creating Python virtual environment..."
  python3 -m venv venv
fi

# shellcheck disable=SC1091
source venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
python -m pip install -r requirements.txt

if [ ! -f "config/credentials.ini" ]; then
  echo "Missing config/credentials.ini"
  exit 1
fi

if grep -Eq '^username[[:space:]]*=[[:space:]]*$' config/credentials.ini && grep -Eq '^hikerapi_token[[:space:]]*=[[:space:]]*$' config/credentials.ini; then
  echo
  echo "Setup required: open config/credentials.ini and add either a dedicated test Instagram account or a HikerAPI token."
  echo "Do not use your primary account and never commit credentials to GitHub."
  echo "Run: nano config/credentials.ini"
  exit 1
fi

TARGET="${1:-}"
if [ -z "$TARGET" ]; then
  read -r -p "Enter your own/authorized Instagram test username: " TARGET
fi

if [ -z "$TARGET" ]; then
  echo "A target username is required."
  exit 1
fi

echo "Starting Osintgram for authorized target: $TARGET"
exec python3 main.py "$TARGET"
