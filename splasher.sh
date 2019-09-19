#!/usr/sbin/env bash

set -exo pipefail
export DISPLAY=:0

source ~/.config/splasher.conf

DIR=${DIR:-${HOME}/.splaser}
ORIENTATION=${ORIENTATION:-"landscape"}
[ -z ${CLIENT_ID} ] && exit 1

if [[ ! -d "${DIR}" ]]; then
    mkdir "${DIR}"
fi

cd "${DIR}"

if [[ -z "${WALLPAPER_NAME}" ]]; then
    rm "${WALLPAPER_NAME}"
fi

if [[ -z ${SEARCH_TERMS} ]]; then
    image_URL=$(curl -G "https://api.unsplash.com/photos/random" \
        --data-urlencode "orientation=${ORIENTATION}" \
        --data-urlencode "client_id=${CLIENT_ID}" | jq -r '.urls.full')
else
    image_URL=$(curl -G "https://api.unsplash.com/photos/random" \
        --data-urlencode "orientation=${ORIENTATION}" \
        --data-urlencode "query=${SEARCH_TERMS// /-}" \
        --data-urlencode "client_id=${CLIENT_ID}" | jq -r '.urls.full')
fi

curl -0 ${image_URL} -o ${WALLPAPER_NAME}
feh --bg-fill "${WALLPAPER_NAME}"

exit 0
