FROM alpine:3.11
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
&& apk add --no-cache clamav-daemon clamav-libunrar

WORKDIR /etc/clamav
COPY 10-clamav-conf.patch .

RUN patch -p1 -i 10-clamav-conf.patch && rm *.patch
RUN crontab -d -u root && echo "0 */6 * * * /usr/bin/freshclam" | crontab -u clamav -

VOLUME "/var/lib/clamav"

WORKDIR /usr/local/bin
COPY entrypoint.sh .

ENTRYPOINT [ "entrypoint.sh" ]

EXPOSE 3310
