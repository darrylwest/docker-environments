#!/usr/bin/env bash
# dpw@Darryls-iMac.localdomain
# 2022-02-06 21:44:58
#

set -eu

# This will start a simple code-server container and expose it at port 5050.
# It will also mount your work directory into the container as `/home/coder/project`
# and forward your UID/GID so that all file system operations occur as your user outside
# the container.
#
# Your $HOME/.config is mounted at $HOME/.config within the container to ensure you can
# easily access/modify your code-server config in $HOME/.config/code-server/config.json
# outside the container.
#
# mkdir -p ~/.config
# -v "$HOME/.config:/home/coder/.config" \

docker run -it --name code-server -p 0.0.0.0:5050:8080 \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  codercom/code-server:latest

