ARG REFERENCE=${REFERENCE:-ubuntu:latest}
FROM $REFERENCE

ENV DEBIAN_FRONTEND="noninteractive"

ARG PACKAGES=${PACKAGES:-sudo}
RUN apt update -qq && apt install --no-install-recommends -y $PACKAGES

RUN if id ubuntu >/dev/null 2>&1; then userdel -r ubuntu; fi
RUN useradd -m -u 1000 regolith
USER regolith

WORKDIR /build
