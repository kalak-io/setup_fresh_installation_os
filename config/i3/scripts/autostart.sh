#!/usr/bin/env bash

DOW=$(date +%u)
HOUR=$(date +%H)
if [ $DOW -lt 6 -a $HOUR -lt 18 ]; then
  # redshift &
  google-chrome-stable --disable-gpu &
  firefox &
  slack &
fi
