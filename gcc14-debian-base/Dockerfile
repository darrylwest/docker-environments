# Use the official Debian 12 (Bookworm) base image
FROM debian:12-slim

LABEL maintainer="darryl west" version="25.06.30-thin"

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# --- Install build dependencies for GCC, CMake, and other libraries ---
RUN apt update && \
    apt install -y build-essential make binutils autoconf automake libtool libgmp-dev pkg-config \
    libmpfr-dev libmpc-dev flex bison texinfo curl wget uuid-dev python3-dev \
    xz-utils git vim neovim ninja-build fswatch openssl libssl-dev iputils-ping jq libsodium-dev libncurses-dev 

# --- Download and extract CMake binary ---
RUN wget https://github.com/Kitware/CMake/releases/download/v3.31.6/cmake-3.31.6-linux-x86_64.sh && \
    chmod a+x cmake-3.31.6-linux-x86_64.sh && \
    ./cmake-3.31.6-linux-x86_64.sh --skip-license --prefix=/usr/local

ADD gcc-14.2.0.tar.gz /opt

# --- Set the newly built GCC as the default ---
RUN update-alternatives --install /usr/bin/gcc gcc /opt/gcc-14.2.0/bin/gcc 140 \
     --slave /usr/bin/g++ g++ /opt/gcc-14.2.0/bin/g++ && \
     update-alternatives --set gcc /opt/gcc-14.2.0/bin/gcc

# Verify the installed GCC version
RUN gcc --version

# --- Clean up to reduce image size ---
# These are build artifacts from the base image, safe to remove here.
RUN apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# -- copy in the root/.bashrc --
COPY .bashrc /root/.bashrc

# -- now create a dpw user --
RUN groupadd --gid 1000 dpw && useradd --uid 1000 --gid 1000 --shell /bin/bash --create-home dpw

# ADD the home/user install.tgz
ADD install.tgz /

RUN chown -R dpw:dpw /home/dpw

USER dpw

WORKDIR /home/dpw

CMD ["tail", "-f", "/dev/null"]
