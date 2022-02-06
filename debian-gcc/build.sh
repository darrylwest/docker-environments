#!/bin/sh
# dpw@seattle.local
# 2022.01.12
#

set -eu

export DOCKER_REPO=darrylwest

export VERSION=$( date +"%y.%m.%d" )
export BUILD=$( date +"%s" )

[ -d workspace ] || mkdir workspace

# install the utils...
(
  /bin/rm -fr workspace
  mkdir workspace
  cd workspace
  git clone git@gitlab.com:darrylwest/cpp-utils.git
  git clone git@gitlab.com:darrylwest/cpp-sandbox.git
  git clone https://github.com/fmtlib/fmt.git
)

tar czvf install.tgz root etc usr workspace

IMAGE=${DOCKER_REPO}/debian-gcc

docker build  \
  -t $IMAGE:$VERSION-$BUILD \
  -t $IMAGE:latest . \
  && docker push $IMAGE:$VERSION-$BUILD \
  && echo "$VERSION-$BUILD" > version

printf "\nSuccessfully built version $VERSION-$BUILD\n"

exit 0
