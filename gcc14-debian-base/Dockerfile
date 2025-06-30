# Use the official Debian 12 (Bookworm) base image
FROM debian:12

LABEL maintainer="darryl west" version="25.06.30-base"

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# --- Install build dependencies for GCC, CMake, and other libraries ---
RUN apt update && \
    apt install -y build-essential libgmp-dev libmpfr-dev libmpc-dev flex bison texinfo curl wget \
    xz-utils git vim neovim nano ninja-build fswatch openssl libssl-dev iputils-ping jq libsodium-dev libncurses-dev

# --- Download and extract CMake source code ---
WORKDIR /usr/src
RUN wget https://cmake.org/files/v3.31/cmake-3.31.6.tar.gz && \
    tar -xf cmake-3.31.6.tar.gz

# --- Build and install CMake ---
WORKDIR /usr/src/cmake-3.31.6
RUN ./bootstrap --prefix=/opt/cmake-3.31.6 && \
    make -j$(nproc) && \
    make install

# --- Update PATH for CMake ---
ENV PATH="/opt/cmake-3.31.6/bin:${PATH}"

# --- Download and extract GCC source code ---
WORKDIR /usr/src
RUN wget https://ftp.gnu.org/gnu/gcc/gcc-14.2.0/gcc-14.2.0.tar.gz && \
    tar -xf gcc-14.2.0.tar.gz

# --- Build and install GCC ---
WORKDIR /usr/src/gcc-14.2.0
RUN mkdir build && cd build && \
    ../configure --prefix=/opt/gcc-14.2.0 \
                 --enable-languages=c,c++ \
                 --disable-multilib && \
    make -j$(nproc) && \
    make install

# --- Set the newly built GCC as the default ---
RUN update-alternatives --install /usr/bin/gcc gcc /opt/gcc-14.2.0/bin/gcc 140 \
    --slave /usr/bin/g++ g++ /opt/gcc-14.2.0/bin/g++ && \
    update-alternatives --config gcc

# Verify the installed GCC version
RUN gcc --version

# --- Install external libraries from source (placeholders) ---
# You will need to replace these with actual URLs and build steps
WORKDIR /usr/local/src

# termio
RUN git clone https://github.com/darrylwest/cpp-termio.git termio && \
    cd termio && \
    mkdir build && cd build && cmake .. && make && make test && make install && \
    cd /usr/local/src

# money
RUN git clone https://github.com/darrylwest/cpp-money.git money && \
    cd money && \
    mkdir build && cd build && cmake .. && make && make test && make install && \
    cd /usr/local/src
    
# domainkeys
RUN git clone https://github.com/darrylwest/cpp-money.git domainkeys && \
    cd domainkeys && \
    mkdir build && cd build && cmake .. && make && make test && make install && \
    cd /usr/local/src

# quickkv
RUN git clone https://github.com/darrylwest/quickkv.git quickkv && \
    cd quickkv && \
    mkdir build && cd build && cmake .. && make && make test && make install && \
    cd /usr/local/src

# --- Clean up to reduce image size ---
# These are build artifacts from the base image, safe to remove here.
RUN rm -rf /usr/src/gcc-14.2.0 /usr/src/gcc-14.2.0.tar.gz && \
    rm -rf /usr/src/cmake-3.31.6 /usr/src/cmake-3.31.6.tar.gz && \
    rm -rf /usr/local/src/* && \
    apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /
CMD ["tail", "-f", "/dev/null"]
