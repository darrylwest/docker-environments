# Use the official Debian 12 (Bookworm) base image
FROM debian:12-slim

LABEL maintainer="darryl west" version="25.07.01-101"

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Set environment variables for locale (required for money)
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# --- Install build dependencies for GCC, CMake, and other libraries ---
RUN apt update && \
    apt install -y build-essential make binutils autoconf automake libtool libgmp-dev pkg-config \
    libmpfr-dev libmpc-dev flex bison texinfo curl wget uuid-dev python3-dev libstdc++6 locales openssh-client \
    xz-utils git vim neovim ninja-build fswatch openssl libssl-dev iputils-ping jq libsodium-dev libncurses-dev \
    nlohmann-json3-dev procps ca-certificates gnupg

# --- Download and extract CMake binary ---
RUN wget https://github.com/Kitware/CMake/releases/download/v3.31.6/cmake-3.31.6-linux-x86_64.sh && \
    chmod a+x cmake-3.31.6-linux-x86_64.sh && \
    ./cmake-3.31.6-linux-x86_64.sh --skip-license --prefix=/usr/local && \
    rm cmake-3.31.6-linux-x86_64.sh

# Set the locale in the environment (this breaks)
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    export LC_ALL=en_US.UTF-8

ADD gcc-14.2.0.tar.gz /opt

# --- Set the newly built GCC as the default ---
RUN update-alternatives --install /usr/bin/gcc gcc /opt/gcc-14.2.0/bin/gcc 140 \
     --slave /usr/bin/g++ g++ /opt/gcc-14.2.0/bin/g++ && \
     update-alternatives --set gcc /opt/gcc-14.2.0/bin/gcc

# Verify the installed GCC version
RUN gcc --version && cmake --version

# --- Catch2 build ---
WORKDIR /opt
RUN git clone https://github.com/catchorg/Catch2.git && \
    cd Catch2 && cmake -B build -S . -DBUILD_TESTING=OFF && \
    cmake --build build/ --target install 

# --- sockpp build ---
RUN git clone https://github.com/fpagliughi/sockpp.git && \
    cd sockpp && cmake -B build -DSOCKPP_BUILD_SHARED=OFF -DSOCKPP_BUILD_STATIC=ON . && \
    cmake --build build/ --target install

# -- rcs dep builds... ---
RUN git clone https://github.com/darrylwest/cpp-domain-keys.git domain-keys && \
    cd domain-keys && cmake -B build . && \
    cmake --build build/ --target install

RUN git clone https://github.com/darrylwest/cpp-termio.git termio && \
    cd termio && cmake -B build . && \
    cmake --build build/ --target install

RUN git clone https://github.com/darrylwest/cpp-money.git money && \
    cd money && cmake -B build . && \
    cmake --build build/ --target install

RUN git clone https://github.com/darrylwest/quickkv.git quickkv && \
    cd quickkv && cmake -B build . && \
    cmake --build build/ --target install

# --- Clean up to reduce image size ---
# These are build artifacts from the base image, safe to remove here.
RUN apt autoremove -y && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* &&  \
    rm -rf /opt/Catch2/ /opt/sockpp /opt/domain-keys /opt/termio /opt/money /opt/quickkv

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
