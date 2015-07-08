#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"

"${DIR}/install-common.sh"

# Systemd
sudo systemctl stop mpd.service
sudo systemctl stop mpd.socket
sudo systemctl disable mpd.service
sudo systemctl disable mpd.socket

# Freedesktop.org compliant
AUTOSTART_DIR="${HOME}/.config/autostart"
mkdir -p "${AUTOSTART_DIR}"
ln -s -f -n "${DIR}/mpd.desktop" "${AUTOSTART_DIR}/mpd.desktop"

mpd
mpc update

