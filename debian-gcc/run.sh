#!/bin/sh
# dpw@seattle.local
# 2017.01.03
#

set -eu

export DOCKER_REPO=darrylwest
export IMAGE=${DOCKER_REPO}/debian-gcc
export VSN=$(cat version)

# no volumes, all source is in the container
docker run --name debian-gcc \
    -it \
    --detach \
    --workdir /home/coder/project \
    -p 5050:8080 \
    "$IMAGE:$VSN"

sleep 2
docker ps | fgrep debian-gcc
printf "invoke 'copy-env.sh' to get started...\n"

