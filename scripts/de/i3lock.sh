#!/bin/bash

ICON=$HOME/Pictures/avatar_kalak.png
PICTURE=/tmp/i3lock.png
BLUR="0x6"

scrot $PICTURE
convert $PICTURE -blur $BLUR $PICTURE
convert $PICTURE $ICON -gravity center -composite $PICTURE
i3lock -i $PICTURE
rm $PICTURE
