#!/usr/bin/sh

rm -rf ./nv-codec-headers/
git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git

cd ./nv-codec-headers/
sudo make install

