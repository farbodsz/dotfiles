#!/bin/sh
# dmenu selector for emojis. Puts selected emoji into the clipboard.

grep -v -e '^$\|#' ~/.scripts/emojis.txt |
  dmenu -i -l 30 -p "Emoji>" |
  awk '{print $1}' |
  tr -d '\n' |
  xclip -selection clipboard

pgrep -x dunst >/dev/null &&
  notify-send "$(xclip -o -selection clipboard) copied to clipboard."
