#!/bin/sh

if [ $# -ne 4 ]; then
    echo "Usage: $0 <distance> <humidity> <emissivity> <reflection>"
    exit 1
fi

distance=$1
humidity=$2
emissivity=$3
reflection=$4

./process.sh $distance $humidity $emissivity $reflection
python convert.py
./metadata.sh