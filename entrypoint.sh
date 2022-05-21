#!/bin/sh
echo "[PlexConnect]" > /PlexConnect/Settings.cfg
env | grep '^PLEXCONNECT_' | sed -E -e 's/^PLEXCONNECT_//' -e 's/(.*)=/\1 /' | awk '{printf "%s", tolower($1); $1=""; print " =" $0}' >> /PlexConnect/Settings.cfg
tail -F /PlexConnect/PlexConnect.log &
exec "${@}"
