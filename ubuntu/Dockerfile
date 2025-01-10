ARG REFERENCE=${REFERENCE:-ubuntu:latest}
FROM $REFERENCE

ENV DEBIAN_FRONTEND="noninteractive"

ARG PACKAGES=${PACKAGES:-sudo}
RUN apt update -qq && apt install --no-install-recommends -y $PACKAGES

RUN if id ubuntu >/dev/null 2>&1; then userdel -r ubuntu; fi && \
    useradd -m -u 1001 regolith && \
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

USER regolith
WORKDIR /build
