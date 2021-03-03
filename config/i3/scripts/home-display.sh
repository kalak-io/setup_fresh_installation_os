#!/usr/bin/env bash

xrandr \
 --dpi 192 \
 --output eDP1 --mode 3200x1800 --rate 60 --pos 0x0 --primary \
 --output DP1 --mode 1024x768 --rate 75 --pos 3200x0 --scale 2x2 \
 --output DP2 --off
