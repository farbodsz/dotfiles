#!/bin/sh
# dmenu selector for man pages

man -k . |
  dmenu -i -l 20 -p "man>" |
  awk '{print $1}' |
  tr -d '/n' |
  xargs kitty -e man
