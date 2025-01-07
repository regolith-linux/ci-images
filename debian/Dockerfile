ARG REFERENCE=${REFERENCE:-debian:latest}
FROM $REFERENCE

ENV DEBIAN_FRONTEND="noninteractive"
WORKDIR /build

RUN apt update -qq && \
    apt install --no-install-recommends -y \
        sudo \
        git \
        ca-certificates \
        wget \
        curl \
        jq \
        gpg \
        gpg-agent \
        devscripts \
        dput \
        diffutils \
        packaging-dev \
        git-buildpackage
