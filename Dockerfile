FROM ubuntu:19.04

RUN apt update \
 && apt install --no-install-recommends -y \
    bash \
    ca-certificates \
    curl \
    git \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get -y autoremove
 
