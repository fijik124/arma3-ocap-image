FROM debian:bookworm-slim

LABEL author="SPARTANS CZ/SK"

ENV DEBIAN_FRONTEND=noninteractive

# Inštalácia závislostí pre Arma 3 a OCAP (vrátane GLIBC 2.36)
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        lib32gcc-s1 \
        lib32stdc++6 \
        libstdc++6 \
        libcurl4 \
        libgcc-s1 \
        tini && \
    useradd -m -d /home/container -s /bin/bash container && \
    rm -rf /var/lib/apt/lists/*

USER container
ENV HOME=/home/container
WORKDIR /home/container

ENTRYPOINT ["/usr/bin/tini", "-g", "--"]
