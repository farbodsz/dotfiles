#!/usr/bin/env sh
# Usage:
#     confluence-sync new FILEPATH SPACE TITLE
#     confluence-sync update FILEPATH SPACE TITLE

set -e

if [ "$#" -ne 4 ]; then
  echo "Expected 4 arguments"
  exit 1
fi

ACTION=$1
FILEPATH=$2
SPACE=$3
TITLE=$4

TMP_FILE="/tmp/$(whoami)-pandoc-confluence"

PANDOC="$APPS_HOME/.local/bin/pandoc"

$PANDOC \
  -F pandoc-confluence \
  --to=html \
  "$FILEPATH" >"$TMP_FILE"

if [ "$ACTION" = "new" ]; then
  confluence content add \
    --space "$SPACE" \
    --title "$TITLE" \
    --path "$TMP_FILE"
  exit
fi

if [ "$ACTION" != "update" ]; then
  echo "Invalid action!"
  exit 1
fi

content_id=$(
  confluence content info "$SPACE" "$TITLE" |
    head -n 1 |
    awk '{ print $2 }'
)

confluence content update "$content_id" --path "$TMP_FILE"
