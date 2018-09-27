FROM ghostserverd/transmission

USER root

RUN apk update

RUN apk add ca-certificates coreutils tzdata

# install filebot dependencies
RUN echo '@testing http://dl-4.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
        java-cacerts \
        java-jna \
        libzen@testing \
        libmediainfo@testing \
        openjdk8-jre-base

# Install filebot
WORKDIR /usr/local/bin
COPY FileBot_4.7.7-portable.tar.xz filebot.tar.xz
RUN ls -lah
RUN tar xvf filebot.tar.xz
RUN chmod +x filebot.sh
RUN mv filebot.sh filebot

# add local files
COPY root/ /

# RUN filebot --help

# RUN filebot -script fn:sysinfo
