FROM ghcr.io/ptero-eggs/games:arma3

USER root

# Obnovenie balíčkov a oprava prípadných archívnych repozitárov pre Debian Bullseye
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends libcurl4 libstdc++6 libgcc-s1 || true && \
    rm -rf /var/lib/apt/lists/*

USER container
