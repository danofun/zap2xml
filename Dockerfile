FROM ghcr.io/linuxserver/baseimage-mono:LTS

# set version label
ARG BUILD_DATE
ARG VERSION
ARG SONARR_VERSION
LABEL build_version="version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="danofun"

# set environment variables
ENV USERNAME=none
ENV PASSWORD=none
ENV XMLTV_FILENAME=xmltv.xml
ENV OPT_ARGS=

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
 	perl \
 	perl-html-parser \
 	perl-http-cookies \
 	perl-lwp-useragent-determined \
 	perl-json \
 	perl-json-xs

VOLUME /config
ADD zap2xml.pl /zap2xml.pl
ADD entry.sh /entry.sh
RUN chmod 755 /entry.sh /zap2xml.pl

CMD ["/entry.sh"]
