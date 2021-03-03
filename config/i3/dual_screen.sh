#!/usr/bin/env bash

xrandr | grep -q DP1 && xrandr --output eDP1 --auto --output DP1 --auto --right-of eDP1
