#!/usr/bin/env bash
# dpw@piedmont
# 2025.07.02
#

set -eu

export image=darrylwest/ubuntu24-gpp1420:latest

docker run -it --rm $image gcc --version

