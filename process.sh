#!/bin/bash

export LD_LIBRARY_PATH=./sdk/utility/bin/linux/release_x64/
EXE=./sdk/utility/bin/linux/release_x64/dji_irp 

if [ $# -ne 4 ]; then
    echo "Usage: $0 <distance> <humidity> <emissivity> <reflection>"
    exit 1
fi

distance=$1
humidity=$2
emissivity=$3
reflection=$4

rm -rf ./outputs
mkdir -p ./outputs/raw

for file in ./inputs/*; do
    echo "Processing $file"

    filename=$(basename -- "$file")
    $EXE -a measure \
        --measurefmt float32 \
        --distance $distance \
        --humidity $humidity \
        --emissivity $emissivity \
        --reflection $reflection \
        --source $file \
        --output ./outputs/raw/$filename.raw

done