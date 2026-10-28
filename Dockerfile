FROM ghcr.io/ptero-eggs/games:arma3

USER root

# Doinštalovanie knižníc pre OCAP (libcurl4 + C++ runtime)
RUN apt-get update && \
    apt-get install -y --no-install-recommends libcurl4 libstdc++6 libgcc-s1 ca-certificates && \
    rm -rf /var/lib/apt/lists/*

USER container
