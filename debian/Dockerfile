ARG REFERENCE=${REFERENCE:-debian:latest}
FROM $REFERENCE

ENV DEBIAN_FRONTEND="noninteractive"

ARG LEGACY=${LEGACY:-no}

ARG PACKAGES=${PACKAGES:-sudo}
RUN apt update -qq && apt install --no-install-recommends -y $PACKAGES

RUN useradd -m -u 1001 regolith && \
    adduser regolith sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /home/regolith/.ssh/ && \
    chown -R regolith /home/regolith/.ssh/ && \
    chmod 700 /home/regolith/.ssh

RUN mkdir -p /home/regolith/.gnupg/ && \
    chown -R regolith /home/regolith/.gnupg/ && \
    chmod 700 /home/regolith/.gnupg

RUN mkdir -p /build/ && \
    mkdir -p /build/buildlog/ && \
    mkdir -p /build/manifests/ && \
    mkdir -p /build/publish/ && \
    mkdir -p /build/workspace/ && \
    chown -R regolith /build/

SHELL ["/bin/bash", "--noprofile", "--norc", "-c", "-e", "-o pipelfail"] 

USER regolith
WORKDIR /build
