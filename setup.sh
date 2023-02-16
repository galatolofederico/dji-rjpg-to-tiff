#!/bin/sh

mkdir -p ./sdk
wget https://dl.djicdn.com/downloads/dji_thermal_sdk/20221108/dji_thermal_sdk_v1.4_20220929.zip -O ./sdk/dji-sdk.zip
cd ./sdk
unzip dji-sdk.zip