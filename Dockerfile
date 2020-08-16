FROM alpine:3.12
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"

WORKDIR /etc/clamav
COPY 10-clamav-conf.patch .

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
&& apk add --no-cache clamav-daemon clamav-libunrar \
&& apk add --no-cache --virtual .build-deps patch \
&& patch -p1 -i 10-clamav-conf.patch && rm *.patch \
&& apk del .build-deps

RUN crontab -d -u root && echo "0 */6 * * * /usr/bin/freshclam" | crontab -u clamav -

WORKDIR /usr/local/bin
COPY travis-helpers/set-timezone.sh entrypoint.sh ./

ENTRYPOINT [ "entrypoint.sh" ]
VOLUME /var/lib/clamav
EXPOSE 3310
