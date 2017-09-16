FROM alpine:latest
LABEL maintainer="shouhei.yamaguchi.ssi@gmail.com"
EXPOSE 67/udp 67/udp
RUN apk update && \
    apk add alpine-sdk git autoconf automake openssl openssl-dev boost-dev libtool pkgconfig && \
    cd /tmp && \
    git clone -b 1.2.x https://github.com/log4cplus/log4cplus.git && \
    cd log4cplus && \
    git submodule update --init --recursive && \
    autoreconf && \
    ./configure && \
    make && \
    make install && \
    cd /tmp && \
    git clone https://github.com/isc-projects/kea.git && \
    cd kea && \
    autoreconf --install && \
    ./configure && \
    make && \
    make install && \
    rm -rf /tmp/* && \
    apk del alpine-sdk git autoconf automake pkgconfig && \
    rm -rf /var/cache/apk/*
