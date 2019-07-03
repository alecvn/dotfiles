#!/bin/bash

# or run this script with `timeout 60 . tmp/emacs.sh` from cronjob
emacs -nw -Q --eval="(package-refresh-contents)" &
PID=$!
sleep 60
kill -9 $PID
exit 0
