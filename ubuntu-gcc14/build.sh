#!/usr/bin/env bash
# dpw@larkspur.localdomain
# 2025-06-30 14:45:33
#

set -eu

export name=ubuntu-24.10-gcc-14.2

export DOCKER_REPO=darrylwest
export IMAGE=${DOCKER_REPO}/$name

export VERSION=$( date +"%y.%m.%d" )
export BUILD=$( date +"%s" )

tar czvf install.tgz home usr

time docker build --no-cache \
    -t $IMAGE:$VERSION-$BUILD \
    -t $IMAGE:latest .

echo $VERSION > version
echo "If all goes well, then do this..."
echo "docker push ${IMAGE}:${VERSION}-${BUILD} && docker push ${IMAGE}:latest"
