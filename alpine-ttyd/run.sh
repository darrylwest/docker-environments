#!/usr/bin/env bash
# dpw@Darryls-iMac.localdomain
# 2022-02-25 19:29:46
#

set -eu

export DOCKER_REPO=darrylwest
export IMAGE=${DOCKER_REPO}/alpine-ttyd
export VSN=$(cat version)
export name=alpine-ttyd

# no volumes, all source is in the container
docker run --name $name \
    -it \
    --detach \
    --volume $PWD:/home \
    --workdir /home \
    -p 7681:7681 \
    "$IMAGE:$VSN"

sleep 2
docker ps | fgrep $name

