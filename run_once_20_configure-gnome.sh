#!/usr/bin/env bash

set -e

echo "Configuring GNOME extensions..."

# Suppress the Caffeine initialisation notification
gsettings set org.gnome.shell.extensions.caffeine show-notifications false

gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
gnome-extensions enable bazaar-integration@kolunmi.github.io
gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable caffeine@patapon.info
gnome-extensions enable dash-to-dock@micxgx.gmail.com
gnome-extensions enable gradia-integration@alexandervanhee.github.io
gnome-extensions enable gsconnect@andyholmes.github.io
gnome-extensions enable media-controller@naimur
gnome-extensions enable search-light@icedman.github.com