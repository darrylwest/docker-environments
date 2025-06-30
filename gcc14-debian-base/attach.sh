#!/usr/bin/env bash
# dpw@larkspur.localdomain
# 2025-06-30 01:42:56
#

set -eu

export name=gcc14.2-debian-12-dev
echo "attaching to $name as $USER user"

docker exec -it -u $USER $name bash -l
