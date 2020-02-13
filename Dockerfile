FROM alpine:3.11
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"

RUN apk add --no-cache clamav-daemon clamav-libunrar

WORKDIR /etc/clamav
COPY 10-clamav-conf.patch .

RUN patch -p1 -i 10-clamav-conf.patch && rm *.patch
RUN echo "0 */6 * * * /usr/bin/freshclam --no-dns" | crontab -u clamav -

VOLUME [ "/var/lib/clamav" ]

ENTRYPOINT [ "sh", "-c", "freshclam --no-dns; crond -f & clamd;" ]

EXPOSE 3310
