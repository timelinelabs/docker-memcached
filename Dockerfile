FROM debian:jessie
MAINTAINER Albert Dixon <albert.dixon@timelinelabs.com>

ENV DEBIAN_FRONTEND   noninteractive

RUN apt-get update &&\
    apt-get install --no-install-recommends -y locales memcached &&\
    dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8 &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD docker-entry /usr/local/bin/docker-entry
RUN chmod a+rx /usr/local/bin/docker-entry

ENTRYPOINT ["docker-entry"]

EXPOSE 11211

ENV LC_ALL C.UTF-8
ENV OPEN_FILE_LIMIT 32768
ENV MC_USER nobody
ENV MC_INTERFACE 0.0.0.0
