#!/usr/bin/env bash

FILENAME="Screenshot_`date +%Y-%m-%d_%H-%M-%S`.png"

saveFullScreen() {
  import -window root ~/Downloads/$FILENAME
}

saveArea() {
  import -window $( \
        i3-msg -t get_tree | \
        jq 'recurse(.nodes[]) | select(.focused).window' \
    ) png:- | \
    xclip -selection clipboard -t image/png
}

$@
