#!/usr/bin/env bash
# Converts TypeScript relative path imports to absolute imports.
#
# Usage:
#     ./convert_ts_relative_to_absolute.sh [FILES]
#
# Absolute path names are based on the directory from which you run this
# command.
#
# Example:
#
#   /path/to/src/$ ./convert_ts_relative_to_absolute.sh $(git ls-files | grep .ts)
#
# Changes are made in-place.
#
# Not ALL imports are converted, but most of them are.

set -e
FILES=$*

abs_import() {
  file=$1
  shift
  args_init=${*:1:$#-1} # imports
  args_last="${*: -1}"  # path

  full_path=$(
    cd "$(dirname "$file")" &&
      readlink -f "$args_last" &&
      cd -
  )

  prefix=$(pwd)
  relative_to_src=$(
    printf '%s' "$full_path" |
      sed -e "s|^$prefix||" -e "s|^/||"
  )

  echo "import ${args_init} from \"${relative_to_src}\";"
}

export -f abs_import

for file in $FILES; do
  sed -i -r "s|import (.*) from \"(\..*)\"|abs_import $file \1 \2|e" "$file"
done
