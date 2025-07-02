# Use the official Ubuntu 24.10 oracular
FROM ubuntu:oracular

LABEL maintainer="darryl west" version="25.07.02-100"

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Set environment variables for locale (required for money)
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# --- Install build dependencies for GCC, and other libraries ---
RUN apt-get update && \
    apt-get install -y build-essential gcc-14 g++-14

COPY .bashrc /root/.bashrc

CMD ["tail", "-f", "/dev/null"]
