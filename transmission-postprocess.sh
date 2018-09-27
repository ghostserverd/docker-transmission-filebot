#!/bin/sh -xu

# Input Parameters
ARG_PATH="$TR_TORRENT_DIR/$TR_TORRENT_NAME"
ARG_NAME="$TR_TORRENT_NAME"
ARG_LABEL="N/A"

# Configuration
CONFIG_OUTPUT="/media"

/usr/local/bin/filebot -script fn:amc --output "$CONFIG_OUTPUT" --action duplicate --conflict auto -non-strict --log-file /media/amc.log --def unsorted=y music=y artwork=y subtitles=en movieFormat={plex} seriesFormat={plex} animeFormat={plex} musicFormat={plex} excludeList=".excludes" ut_dir="$ARG_PATH" ut_kind="multi" ut_title="$ARG_NAME" ut_label="$ARG_LABEL"
