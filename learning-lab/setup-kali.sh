#!/usr/bin/env bash
set -euo pipefail

LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLS_DIR="$LAB_DIR/tools"
mkdir -p "$TOOLS_DIR"

printf '\nOSINT Learning Lab setup\n'
printf 'Use only your own data/assets or targets with written permission.\n\n'

if [[ "${EUID}" -eq 0 ]]; then
  SUDO=""
else
  SUDO="sudo"
fi

$SUDO apt update
$SUDO apt install -y git python3 python3-venv pipx libimage-exiftool-perl

pipx ensurepath || true
export PATH="$HOME/.local/bin:$PATH"

install_pipx_tool() {
  local package="$1"
  if pipx list --short 2>/dev/null | grep -qi "^${package}[[:space:]]"; then
    echo "[OK] $package already installed; checking for updates"
    pipx upgrade "$package" || true
  else
    pipx install "$package"
  fi
}

install_pipx_tool "sherlock-project"
install_pipx_tool "maigret"
install_pipx_tool "shodan"

if command -v theHarvester >/dev/null 2>&1; then
  echo "[OK] theHarvester already available"
else
  if apt-cache show theharvester >/dev/null 2>&1; then
    $SUDO apt install -y theharvester
  else
    echo "[INFO] theHarvester package was not found. Use the official repository instructions:"
    echo "       https://github.com/laramies/theHarvester/wiki/Installation"
  fi
fi

SPIDERFOOT_DIR="$TOOLS_DIR/spiderfoot"
if [[ ! -d "$SPIDERFOOT_DIR/.git" ]]; then
  git clone https://github.com/smicallef/spiderfoot.git "$SPIDERFOOT_DIR"
else
  git -C "$SPIDERFOOT_DIR" pull --ff-only || true
fi

if [[ ! -d "$SPIDERFOOT_DIR/venv" ]]; then
  python3 -m venv "$SPIDERFOOT_DIR/venv"
fi
"$SPIDERFOOT_DIR/venv/bin/python" -m pip install --upgrade pip
"$SPIDERFOOT_DIR/venv/bin/pip" install -r "$SPIDERFOOT_DIR/requirements.txt"

cat <<'EOF'

Setup complete.

Checks:
  sherlock --help
  maigret --help
  exiftool -ver
  shodan --help
  theHarvester -h

Start SpiderFoot locally:
  cd learning-lab/tools/spiderfoot
  ./venv/bin/python sf.py -l 127.0.0.1:5001

Then open http://127.0.0.1:5001 in your browser.
Begin with passive modules and scan only assets you own or are authorized to test.

Maltego is not copied into this repository. Install it from:
  https://www.maltego.com/downloads/

Never save API keys, cookies, credentials, or investigation output in GitHub.
EOF
