FROM alpine:latest

# set environment variables
ENV USERNAME=none
ENV PASSWORD=none
ENV XMLTV_FILENAME=xmltv.xml
ENV OPT_ARGS=

RUN apk add --no-cache perl perl-html-parser perl-http-cookies perl-lwp-useragent-determined perl-json perl-json-xs perl-lwp-protocol-https perl-uri ca-certificates perl-net-libidn perl-net-ssleay perl-io-socket-ssl perl-libwww perl-mozilla-ca perl-net-http perl-gd
VOLUME /data
ADD zap2xml.pl /zap2xml.pl
ADD entry.sh /entry.sh
RUN chmod 755 /entry.sh /zap2xml.pl

CMD ["/entry.sh"]
