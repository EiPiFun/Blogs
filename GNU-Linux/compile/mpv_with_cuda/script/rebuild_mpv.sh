#!/usr/bin/sh

hwapi_name=$1

cd ./mpv-build/

cat ffmpeg_options_$hwapi_name > ffmpeg_options
cat mpv_options_$hwapi_name > mpv_options

./rebuild -j 6

sudo ./install
sudo ./uninstall
sudo ./install
