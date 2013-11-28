#!/usr/bin/env bash

REL_SRC=${BASH_SOURCE[0]}
CANONICAL_SRC=$(readlink -f $REL_SRC)
DIR="$(cd -P "$(dirname $CANONICAL_SRC)" && pwd)"

# Ubuntu / Upstart
sudo service mpd stop
sudo update-rc.d mpd disable

# GNOME-based
AUTOSTART_DIR="${HOME}/.config/autostart"
mkdir -p ${AUTOSTART_DIR}
ln -s -f "${DIR}/mpd.desktop" "${AUTOSTART_DIR}/mpd.desktop"

mpd
