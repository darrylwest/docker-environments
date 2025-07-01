#!/usr/bin/env bash
# dpw@piedmont
# 2025-07-01 20:05:07
#

set -eu

name=gcc14.2-debian-12-dev
image=gcc14.2-debian12-dev

docker stop $name
docker rm $name

