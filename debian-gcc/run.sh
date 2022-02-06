#!/bin/sh
# dpw@seattle.local
# 2017.01.03
#

set -eu

export DOCKER_REPO=darrylwest
export IMAGE=${DOCKER_REPO}/debian-gcc
export VSN=$(cat version)

docker run --name debian-gcc \
    -it \
    --detach \
    --workdir /workspace \
    "$IMAGE:$VSN"

sleep 2
docker ps | fgrep debian-gcc
