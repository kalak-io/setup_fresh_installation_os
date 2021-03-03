#!/usr/bin/env bash

DOW=$(date +%u)
HOUR=$(date +%H)
if [ $DOW -lt 6 -a $HOUR -lt 18 ]; then
  chromium --disable-gpu &
  firefox &
  slack &
fi
