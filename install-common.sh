#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"


sudo apt-get install mpd mpc ncmpcpp


MPDDIR="${HOME}/.mpd"
NCMPCPPDIR="${HOME}/.ncmpcpp"

mkdir -p "${MPDDIR}" "${NCMPCPPDIR}"
touch "${MPDDIR}/database" "${MPDDIR}/log"

read -e -n 1 -p 'To setup MPD [local-only, type 0], to setup MPD [open to the LAN, type 1] > ' CHOICE
CONFFILE_DEFAULT="${DIR}/mpd.conf.local"
CONFFILES_ARRAY=( "${DIR}/mpd.conf.local" "${DIR}/mpd.conf.open" )
CONFFILE_CHOSEN="${CONFFILES_ARRAY[${CHOICE}]}"
CONFFILE_="${CONFFILE_CHOSEN:-${CONFFILE_DEFAULT}}"
ln -s -f -n "${CONFFILE_}" "${DIR}/mpd.conf"

ln -s -f -n "${DIR}/mpd.conf"         "${MPDDIR}/mpd.conf"
ln -s -f -n "${DIR}/ncmpcpp.config"   "${NCMPCPPDIR}/config"


MUSICDIR="${HOME}/Music"
MUSICMETA="${MUSICDIR}/meta"
MUSICLYRICS="${MUSICMETA}/lyrics"
MUSICPLAYLISTS="${MUSICMETA}/playlists"
mkdir -p "${MUSICLYRICS}"  "${MUSICPLAYLISTS}"
ln -s -f -n "${MUSICLYRICS}"  "${HOME}/.lyrics"

