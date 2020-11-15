ARG REFERENCE=${REFERENCE:-ubuntu:latest}
FROM $REFERENCE

ENV DEBIAN_FRONTEND="noninteractive"
WORKDIR /build

RUN apt update -qq && \
    apt dist-upgrade -y && \
    apt install --no-install-recommends -y curl \
        ca-certificates \
        packaging-dev \
        git-buildpackage \
        git \
        wget \
        jq && \
    curl -o /usr/bin/copy-package "http://bazaar.launchpad.net/~ubuntu-archive/ubuntu-archive-tools/trunk/download/head:/copy-package" && \
    chmod +x /usr/bin/copy-package