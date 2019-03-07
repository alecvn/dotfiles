#!/bin/bash
# after fresh restart this worked for VLC
# after second test this works for MellowPlayer but it takes longer to scrobble successfully to lastfm

# dbus failure error:
# https://github.com/FeralInteractive/gamemode/issues/8




systemctl --user enable --now mpris-scrobbler.service
mpris-scrobbler-signon enable lastfm
mpris-scrobbler-signon token lastfm
mpris-scrobbler-signon session lastfm
