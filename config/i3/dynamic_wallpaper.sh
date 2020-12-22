#!/bin/bash

lakeside() {
  path=$HOME/Documents/projects/personal/setup_fresh_installation_os/assets/lakeside/
  wallpaper="${path}$(date -u -d @$((($(date -u +%s) / 600) * 600)) "+%Hh%M").png"
}

zelda() {
  path=$HOME/Documents/projects/personal/setup_fresh_installation_os/assets/zelda/
  hour=$(date +%H)
  time_of_day=$(sunwait poll 48.8534N 2.3488E)
  if [[ $time_of_day == "DAY" ]] && [ $hour -lt 10 ]
  then
    wallpaper="${path}wallpaper-morning.jpg"
  elif [ $hour -gt 9 ] && [ $hour -lt 16 ]
  then
    wallpaper="${path}wallpaper-day.jpg"
  elif [ $hour -gt 15 ] && [[ $time_of_day == "DAY" ]]
  then
    wallpaper="${path}wallpaper-evening.jpg"
  elif [[ $time_of_day == "NIGHT" ]]
  then
    wallpaper="${path}wallpaper-night.jpg"
  fi
}

setBackground() {
  if [ $@ = "zelda" ]; then
    zelda
  elif [ $@ = "lakeside" ]; then
    lakeside
  fi
  OLD_PID=$!
  DISPLAY=:0.0 feh --bg-scale $wallpaper
  while true; do
    sleep 600
    if [ $@ = "zelda" ]; then
      zelda
    elif [ $@ = "lakeside" ]; then
      lakeside
    fi
    NEXT_PID=$!
    DISPLAY=:0.0 feh --bg-scale $wallpaper
    sleep 5
    kill $OLD_PID
    OLD_PID=$NEXT_PID
  done
}

$@
