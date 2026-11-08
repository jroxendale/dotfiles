#!/usr/bin/env bash

set -euo pipefail

echo "Configuring GNOME extensions..."

EXTENSIONS=(
  "appindicatorsupport@rgcjonas.gmail.com"
  "bazaar-integration@kolunmi.github.io"
  "blur-my-shell@aunetx"
  "caffeine@patapon.info"
  "dash-to-dock@micxgx.gmail.com"
  "gradia-integration@alexandervanhee.github.io"
  "gsconnect@andyholmes.github.io"
  "search-light@icedman.github.com"
)

for ext in "${EXTENSIONS[@]}"; do
  if ! gnome-extensions enable "$ext" 2>/dev/null; then
    echo "Could not enable $ext, skipping..."
  fi
done

# Fetch, install and enable the latest Media Controller
UUID="media-controller@naimur"
GNOME_VER=$(gnome-shell --version | cut -d ' ' -f 3 | cut -d . -f 1)
DOWNLOAD_URI=$(curl -s "https://extensions.gnome.org/extension-info/?uuid=${UUID}&shell_version=${GNOME_VER}" | jq -r '.download_url')

if [ -n "$DOWNLOAD_URI" ] && [ "$DOWNLOAD_URI" != "null" ]; then
    curl -sL "https://extensions.gnome.org${DOWNLOAD_URI}" -o /tmp/media-controller@naimur.zip
    gnome-extensions install --force /tmp/media-controller@naimur.zip
    rm -f /tmp/media-controller@naimur.zip
else
    echo "Media Controller is not available, skipping..."
fi 

CURRENT_EXTS=$(gsettings get org.gnome.shell enabled-extensions)
gsettings set org.gnome.shell enabled-extensions "${CURRENT_EXTS%]*}, '${UUID}']"