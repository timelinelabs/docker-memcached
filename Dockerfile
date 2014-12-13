FROM debian:jessie
MAINTAINER Albert Dixon <albert.dixon@timelinelabs.com>

ENV DEBIAN_FRONTEND   noninteractive

RUN apt-get update -qq
RUN apt-get install --no-install-recommends -y --force-yes locales

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

RUN apt-get install --no-install-recommends -y --force-yes memcached

ADD scripts/* /usr/local/bin/
RUN chmod a+x /usr/local/bin/docker-start

CMD ["docker-start"]
EXPOSE 11211