#!/usr/bin/env bash
# dpw@larkspur.localdomain
# 2025-06-30 01:42:56
#

set -eu

export usr=$USER

if [ "$USER" != "root" ]
then
    export usr=dpw
fi

export name=gcc14.2-debian-12-dev
echo "attaching to $name as user: $usr"

docker exec -it -u $usr $name bash -l
