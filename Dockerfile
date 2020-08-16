FROM alpine:3.12
LABEL maintainer "Duncan Bellamy <dunk@denkimushi.com>"

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
&& apk add --no-cache clamav-daemon clamav-libunrar

WORKDIR /etc/clamav
COPY etc-b/clamav.conf etc-b/freshclam.conf ./

RUN crontab -d -u root && echo "0 */6 * * * /usr/bin/freshclam" | crontab -u clamav -

WORKDIR /usr/local/bin
COPY travis-helpers/set-timezone.sh entrypoint.sh ./

ENTRYPOINT [ "entrypoint.sh" ]
VOLUME /var/lib/clamav
EXPOSE 3310
