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
    tzdata \
    su-exec

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN echo "Europe/Paris" > /etc/timezone
ENV TZ Europe/Paris
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR.UTF-8
ENV LC_ALL fr_FR.UTF-8

VOLUME /config

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
