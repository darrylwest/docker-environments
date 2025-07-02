#!/usr/bin/env bash
# dpw@piedmont
# 2025-06-30 17:35:10
#

set -eu

export name=ubuntu-24.10-gcc-14.2
export image=ubuntu-24.10-gcc-14.2
export DOCKER_REPO=darrylwest
export IMAGE=${DOCKER_REPO}/$image
export VSN=$(cat version)

# no volumes, all source is in the container
docker run --name $name \
    -it \
    --detach \
    "$IMAGE:latest"

sleep 4
docker ps | fgrep $name 

sleep 1
./copy-env
