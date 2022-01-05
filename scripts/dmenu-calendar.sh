#!/bin/bash
# dmenu interface for choosing gcalcli actions.

set -e

ACTIONS=("browse" "add" "calw")

SELECTION=$(printf '%s\n' "${ACTIONS[@]}" | dmenu -i -l "${#ACTIONS[@]}" -p "Calendar > ")

if [ "$SELECTION" == "browse" ]; then
  google-chrome "https://calendar.google.com/calendar/u/0/r/week"
  exit 0
fi

kitty --hold -e gcalcli --config-folder "$XDG_CONFIG_HOME/gcalcli/" "$SELECTION"
