#!/usr/bin/env bash

DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")" )" && pwd)"

MPDDIR="${HOME}/.mpd"
NCMPCPPDIR="${HOME}/.ncmpcpp"

mkdir -p "${MPDDIR}" "${NCMPCPPDIR}"
touch "${MPDDIR}/database" "${MPDDIR}/log"

ln -s -f -n "${DIR}/mpd.conf.local"   "${DIR}/mpd.conf"
ln -s -f -n "${DIR}/mpd.conf"         "${MPDDIR}/mpd.conf"
ln -s -f -n "${DIR}/ncmpcpp.config"   "${NCMPCPPDIR}/config"


MUSICDIR="${HOME}/Music"
MUSICMETA="${MUSICDIR}/meta"
MUSICLYRICS="${MUSICMETA}/lyrics"
MUSICPLAYLISTS="${MUSICMETA}/playlists"
mkdir -p "${MUSICLYRICS}"  "${MUSICPLAYLISTS}"
ln -s -f -n "${MUSICLYRICS}"  "${HOME}/.lyrics"

