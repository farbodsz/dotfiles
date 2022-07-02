# Takes inputFile and outputFile

inputFile=$1
outputFile=$2

pandoc -f markdown \
  --standalone \
  --mathjax \
  --extract-media=_preview_media \
  --lua-filter ~/.pandoc_filters/diagram-generator.lua \
  $inputFile \
  -o \
  $outputFile
