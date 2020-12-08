#! /usr/bin/env bash

function setbg {
  cp $1 ~/.config/wall.jpg
  DISPLAY=:0.0 feh --bg-scale ~/.config/wall.jpg
}

hour=$(date +%H)
time_of_day=$(sunwait poll 48.8534N 2.3488E)
[[ $time_of_day == "DAY" ]] && [ $hour -lt 10 ] && setbg $1 # morning
[ $hour -gt 9 ] && [ $hour -lt 16 ]            && setbg $2 # midday
[ $hour -gt 15 ] && [[ $time_of_day == "DAY" ]] && setbg $3 # dusk
[[ $time_of_day == "NIGHT" ]]                   && setbg $4 # night
