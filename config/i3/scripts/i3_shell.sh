#!/bin/sh

WHEREAMI=$(cat /tmp/whereami)
alacritty --working-directory="$WHEREAMI"
