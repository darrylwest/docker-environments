#!/usr/bin/env bash
# dpw@piedmont
# 2025-06-30 17:35:10
#

set -eu

name=gcc14.2-debian-12-dev
image=gcc14.2-debian12-dev
export DOCKER_REPO=darrylwest
export IMAGE=${DOCKER_REPO}/$image
# export VSN=$(cat version)

# no volumes, all source is in the container
docker run --name $name \
    -it \
    --detach \
    "$IMAGE:latest"

sleep 2
docker ps | fgrep debian-gcc

sleep 2
./copy-env
