#!/usr/sbin/env bash

set -exuo pipefail

dir="${HOME}/.splasher"
wallpaper_name="background.jpg"

if [[ ! -d "${dir}" ]]; then
    mkdir "${dir}"
fi

cd "${dir}"

if [[ -z "$wallpaper_name" ]]; then
    rm "${wallpaper_name}"
fi

image_URL=$(curl "https://api.unsplash.com/photos/random?client_id=19aada4dabad279cf21e37342f6277d865e58b1336ba7d6f5a2038793d35ea7c" | jq -r '.urls.full')
wget $image_URL --output-document="${wallpaper_name}"
feh --bg-fill "${wallpaper_name}"

exit 0
