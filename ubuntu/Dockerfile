ARG REFERENCE=${REFERENCE:-ubuntu:latest}
FROM $REFERENCE

ENV DEBIAN_FRONTEND="noninteractive"

ARG LEGACY=${LEGACY:-no}
RUN if [ "$LEGACY" != "no" ]; then \
        sed -i 's|archive\.ubuntu\.com/ubuntu|old-releases\.ubuntu\.com/ubuntu|' /etc/apt/*.list ; \
        sed -i 's|security\.ubuntu\.com/ubuntu|old-releases\.ubuntu\.com/ubuntu|' /etc/apt/*.list ; \
        sed -i 's|ports\.ubuntu\.com/ubuntu-ports|old-releases\.ubuntu\.com/ubuntu|' /etc/apt/*.list ; \
    fi

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

SHELL ["/bin/bash", "--noprofile", "--norc", "-c", "-e", "-o pipelfail"] 

USER regolith
WORKDIR /build
