#
# version 2022.02.06
#
# FROM debian:latest
FROM debian:bullseye-20220125-slim

LABEL maintainer="darryl west" version="22.02.06"

RUN apt-get update && apt-get install -y \
    make binutils autoconf automake autotools-dev libtool pkg-config cmake \
    build-essential curl wget jq neovim git-core httping netcat figlet \
    gcc g++ uuid-dev clang fswatch \
    zlib1g-dev libcunit1-dev libssl-dev libxml2-dev libev-dev libevent-dev libjansson-dev \
    libcap-dev libacl1-dev libc-ares-dev libjemalloc-dev libsystemd-dev \
    inotify-tools logrotate libboost-dev 

ADD install.tgz /

# enable local docker networks to connect
EXPOSE 80 5050-5060

WORKDIR /workspace

CMD [ "/usr/local/bin/startup" ]
