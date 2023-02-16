#!/bin/bash

for file in ./inputs/*; do
    echo "Processing metadata $file"
    filename=$(basename -- "$file")
    exiftool \
        -tagsFromFile \
        $file \
        -all:all \
        outputs/tif/$filename.tif
done

rm outputs/tif/*_original