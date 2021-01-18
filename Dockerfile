FROM alpine:latest

RUN apk add --update --no-cache \
    shadow \
    wget \
    tar \
    autoconf \
    gettext \
    gettext-dev \
    git \
    ncurses-dev \
    build-base \
    automake \
    libmaxminddb-dev \
    nginx \
    tini \
    su-exec

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

VOLUME /config

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
