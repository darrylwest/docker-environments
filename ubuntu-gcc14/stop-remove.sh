#!/usr/bin/env bash
# dpw@piedmont
# 2025-07-01 20:05:07
#

set -eu

export name=ubuntu-24.10-gcc-14.2
export image=ubuntu-24.10-gcc-14.2

docker stop $name
docker rm $name

docker image prune -af

