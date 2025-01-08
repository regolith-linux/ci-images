ARG REFERENCE=${REFERENCE:-debian:latest}
FROM $REFERENCE

ENV DEBIAN_FRONTEND="noninteractive"

ARG PACKAGES=${PACKAGES:-sudo}
RUN apt update -qq && apt install --no-install-recommends -y $PACKAGES

RUN useradd -m -u 1001 regolith && \
    adduser regolith sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER regolith
WORKDIR /build
