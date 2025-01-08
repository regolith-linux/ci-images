ARG REFERENCE=${REFERENCE:-debian:latest}
FROM $REFERENCE

ENV DEBIAN_FRONTEND="noninteractive"

ARG PACKAGES=${PACKAGES:-sudo}
RUN apt update -qq && apt install --no-install-recommends -y $PACKAGES

RUN useradd -m -u 1000 regolith
USER regolith

WORKDIR /build
