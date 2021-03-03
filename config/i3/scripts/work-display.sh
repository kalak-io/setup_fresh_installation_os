#!/usr/bin/env bash

xrandr \
 --output eDP1 --mode 3200x1800 --rate 60 --pos 0x0 --primary \
 --output DP1 --mode 1920x1080 --rate 60 --pos 3200x0 \
 --output DP2 --off
