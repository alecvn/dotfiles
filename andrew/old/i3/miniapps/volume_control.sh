#!/bin/bash

COMMAND="$1"

if [ ${COMMAND} == "up" ]; then
    amixer -D pulse sset Master 5%+
elif [ ${COMMAND} == "down" ]; then
    amixer -D pulse sset Master 5%-
elif [ ${COMMAND} == "mute" ]; then
    amixer -D pulse set Master 1+ toggle
fi
