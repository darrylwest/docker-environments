#!/usr/bin/env bash
# dpw@piedmont
# 2023-11-15 19:02:33
# @see https://hub.docker.com/r/linuxserver/code-server
#
# ubuntu 22

docker run -d \
  --name=code-server \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Etc/UTC \
  -e PASSWORD=7mkm4YRpPf2i \
  -e PROXY_DOMAIN=code-server.piedmont \
  -e DEFAULT_WORKSPACE=/config/workspace `#optional` \
  -p 8443:8443 \
  -v /path/to/appdata/config:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/code-server:latest


