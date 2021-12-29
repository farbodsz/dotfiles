#!/bin/sh
# dmenu selector for opening WordReference German to English translation.

dmenu -p "WordReference DE-EN>" |
  tr -d '/n' |
  xargs printf -- "https://www.wordreference.com/deen/%s" |
  xargs google-chrome
