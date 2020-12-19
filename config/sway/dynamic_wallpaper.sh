#!/bin/sh
swaybg -i ./img/$(date -u -d @$((($(date -u +%s)
                 / 600) * 600)) "+%Hh%M").png -m fill &
OLD_PID=$!
while true; do
    sleep 600
    swaybg -i ./img/$(date -u -d @$((($(date -u +%s)
                     / 600) * 600)) "+%Hh%M").png -m fill &
    NEXT_PID=$!
    sleep 5
    kill $OLD_PID
    OLD_PID=$NEXT_PID
done
