ARG ALPINE_VERSION=3.17
FROM docker.io/alpine:$ALPINE_VERSION AS build

# hadolint ignore=DL3018
RUN apk add --no-cache \
        alpine-sdk \
        autoconf \
        automake \
        bash \
        bind-tools \
        bison \
        coreutils \
        file \
        findutils \
        gettext \
        gettext-dev \
        gperf \
        jq \
        rsync \
        texinfo \
        wget \
        xz

# https://github.com/upx/upx
ARG UPX_VERSION=4.0.2
RUN set -xeu; \
    curl -#Lo upx.tar.xz \
        "https://github.com/upx/upx/releases/download/v$UPX_VERSION/upx-$UPX_VERSION-amd64_linux.tar.xz"; \
    tar -xvf upx.tar.xz --strip-components=1 "upx-$UPX_VERSION-amd64_linux/upx"; \
    chmod +x upx; \
    mv upx /usr/local/bin/upx; \
    rm -f upx.tar.xz

ENTRYPOINT ["/bin/bash"]
