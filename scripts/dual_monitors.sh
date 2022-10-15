#!/usr/bin/env sh
# Script to automatically configure my dual HP monitor setup.
# Usage: ./dual_monitors.sh [RESOLUTION_NAME]

# NOTE: Available resolutions outputted by `xrandr -q`
_res_4k="3840x2160"
_res_qhd="2560x1440"
_res_wuxga="1920x1200"
_res_hd="1920x1080"

case "$1" in
  "4k")
    RESOLUTION=$_res_4k
    ;;
  "qhd")
    RESOLUTION=$_res_qhd
    ;;
  "wuxga")
    RESOLUTION=$_res_wuxga
    ;;
  "hd")
    RESOLUTION=$_res_hd
    ;;
  *)
    echo >&2 "Unrecognised RESOLUTION_NAME '$1'. Defaulting to HD ($_res_hd)"
    RESOLUTION=$_res_hd
    ;;
esac

xrandr --output eDP-1-1 --off &&
  xrandr --output HDMI-1-1 --mode "$RESOLUTION" &&
  xrandr --output DP-1-2 --mode "$RESOLUTION" &&
  xrandr --output HDMI-1-1 --left-of DP-1-2
