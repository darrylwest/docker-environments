#
# version 2022.02.06
#
# FROM debian:latest
# latest is currently debian-11
FROM codercom/code-server:latest

LABEL maintainer="darryl west" version="22.02.15"

RUN sudo apt-get update && sudo apt-get install -y \
    make binutils autoconf automake autotools-dev libtool pkg-config cmake \
    build-essential curl wget jq neovim git-core gcc g++ uuid-dev clang \
    ninja-build fswatch openssl libssl-dev libevent-dev bsdmainutils

# libboost-all-dev
# zlib1g-dev libcunit1-dev libxml2-dev libev-dev libevent-dev libcap-dev

ADD install.tgz /
RUN sudo chown -R coder:coder /home/coder

# enable local docker networks to connect
EXPOSE 80 5050-5060

