# Use the official Ubuntu 24.10 oracular + gcc-14.2.0
FROM ubuntu:oracular

LABEL maintainer="darryl west" version="25.07.02-101"

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# --- Install build dependencies for GCC, and other libraries ---
RUN apt-get update && \
    apt-get install -y build-essential gcc-14 g++-14 bash

COPY .bashrc /root/.bashrc

CMD ["tail", "-f", "/dev/null"]
