#!/usr/bin/sh

rm -rf ./nvidia-vaapi-driver/
git clone https://github.com/elFarto/nvidia-vaapi-driver/

cd ./nvidia-vaapi-driver/
meson setup build
sudo meson install -C build
