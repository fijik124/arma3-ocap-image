FROM ghcr.io/ptero-eggs/games:arma3

USER root

# Prepnutie repozitárov na Debian 12 (Bookworm) pre získanie GLIBC 2.36
RUN sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        libc6 \
        libstdc++6 \
        libcurl4 \
        libgcc-s1 \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

USER container
