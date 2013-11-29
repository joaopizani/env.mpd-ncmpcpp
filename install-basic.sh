#!/usr/bin/env bash

REL_SRC=${BASH_SOURCE[0]}
CANONICAL_SRC=$(readlink -f $REL_SRC)
DIR="$(cd -P "$(dirname $CANONICAL_SRC)" && pwd)"

MPDDIR="${HOME}/.mpd"
NCMPCPPDIR="${HOME}/.ncmpcpp"

mkdir -p ${MPDDIR} ${NCMPCPPDIR}
touch "${MPDDIR}/database" "${MPDDIR}/log"

ln -s -f  "${DIR}/mpd.conf.local"   "${DIR}/mpd.conf"
ln -s -f  "${DIR}/mpd.conf"         "${MPDDIR}/mpd.conf"
ln -s -f  "${DIR}/ncmpcpp.config"   "${NCMPCPPDIR}/config"

MUSICDIR="${HOME}/Music"
MUSICMETA="${MUSICDIR}/meta"
MUSICLYRICS="${MUSICMETA}/lyrics"
MUSICPLAYLISTS="${MUSICMETA}/playlists"
mkdir -p ${MUSICLYRICS} ${MUSICPLAYLISTS}
ln -s -f ${MUSICLYRICS}  "${HOME}/.lyrics"

