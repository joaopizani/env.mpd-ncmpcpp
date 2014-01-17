#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"

"${DIR}/install-basic.sh"

# Ubuntu / Upstart
sudo service mpd stop
sudo update-rc.d mpd disable

# Freedesktop.org compliant
AUTOSTART_DIR="${HOME}/.config/autostart"
mkdir -p "${AUTOSTART_DIR}"
ln -s -f -n "${DIR}/mpd.desktop" "${AUTOSTART_DIR}/mpd.desktop"

mpd

