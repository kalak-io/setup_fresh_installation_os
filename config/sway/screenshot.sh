#!/bin/bash

FILENAME="Screenshot_`date +%Y-%m-%d_%H-%M-%S`"

saveFullScreen() {
  grim -t png ~/Downloads/$FILENAME.png
}

saveSelectedScreen() {
  grim -t png -g "$(slurp -d)" ~/Downloads/$FILENAME.png
}

copySelectedScreen() {
  grim -g "$(slurp -d)" -t png - | wl-copy -t image/png
}

"$@"
