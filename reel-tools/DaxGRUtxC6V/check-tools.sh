#!/usr/bin/env bash
set -u

printf '%s\n' "Reel tool environment check"
printf '%s\n' "==========================="

check_command() {
  local name="$1"
  if command -v "$name" >/dev/null 2>&1; then
    printf '[FOUND] %s -> %s\n' "$name" "$(command -v "$name")"
    return 0
  fi

  printf '[NOT FOUND] %s\n' "$name"
  return 1
}

check_command python3 || true
check_command git || true
check_command docker || true

if ! check_command maltego; then
  printf '%s\n' "Maltego is not available as a terminal command."
  printf '%s\n' "Install/check it only through the official page: https://www.maltego.com/downloads/"
fi

printf '\n%s\n' "FaceCheck.ID is marked probable-not-confirmed and is not opened automatically."
printf '%s\n' "Use all investigation tools only on your own data or with clear authorization."
printf '%s\n' "Never save credentials, cookies, API keys, or investigation results in this repository."
