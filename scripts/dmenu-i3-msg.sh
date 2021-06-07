#!/bin/sh
# dmenu prompt for i3-msg

grep -v -e '^$\|#' ~/.dotfiles/scripts/i3cmds.txt |
  dmenu -i -l 10 -p "i3-msg>" |
  xargs -I {} i3-msg "{}"
