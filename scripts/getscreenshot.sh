#!/usr/bin/env bash
# Simple script to move the most recent screenshot to the specified path.

SCREENSHOT_DIR="$HOME/Pictures/screenshots"

targetpath=$1

get_most_recent_filename() {
  ls -Art $SCREENSHOT_DIR | tail -n 1
}

filepath="$SCREENSHOT_DIR/$(get_most_recent_filename)"

mv $filepath $targetpath
