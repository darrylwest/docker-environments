#!/bin/sh
# dpw@seattle.local
# 2022.01.12
#

set -eu

export DOCKER_REPO=darrylwest

export VERSION=$( date +"%y.%m.%d" )
export BUILD=$( date +"%s" )

tar czvf install.tgz root usr

IMAGE=${DOCKER_REPO}/alpine-ttyd

docker build  \
  -t $IMAGE:$VERSION-$BUILD \
  -t $IMAGE:latest . \
  && docker push $IMAGE:$VERSION-$BUILD \
  && echo "$VERSION-$BUILD" > version \
  && printf "\nSuccessfully built version $VERSION-$BUILD\n"


