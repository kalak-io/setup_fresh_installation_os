#!/usr/bin/env bash

xrandr \
 --dpi 192 \
 --output eDP1 --mode 3200x1800 --rate 60 --pos 0x0 --primary \
 --output DP1 --off \
 --output DP2 --off
