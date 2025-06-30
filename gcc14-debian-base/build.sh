#!/usr/bin/env bash
# dpw@larkspur.localdomain
# 2025-06-30 14:45:33
#

set -eu

image=gcc14-debian-base
docker build -t $image .
