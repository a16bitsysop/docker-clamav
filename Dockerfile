FROM alpine:3.14
LABEL maintainer="Duncan Bellamy <dunk@denkimushi.com>"

# hadolint ignore=DL3018
RUN apk add --no-cache --upgrade clamav-daemon clamav-libunrar

WORKDIR /etc/clamav
COPY etc-b ./

SHELL [ "/bin/ash", "-o", "pipefail", "-c" ]
RUN crontab -d -u root && echo "0 */6 * * * /usr/bin/freshclam" | crontab -u clamav -

WORKDIR /usr/local/bin
COPY travis-helpers/set-timezone.sh \
travis-helpers/health-nc.sh \
entrypoint.sh ./

ENTRYPOINT [ "entrypoint.sh" ]
VOLUME /var/lib/clamav
EXPOSE 3310

HEALTHCHECK --start-period=6m --interval=6m --timeout=6m \
  CMD health-nc.sh PING 3310 PONG || exit 1
