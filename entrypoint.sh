#!/bin/sh
echo '$TIMEZONE=' $TIMEZONE
echo

if [ -n "$TIMEZONE" ]
then
  apk add --no-cache tzdata
  if [ -f /usr/share/zoneinfo/"$TIMEZONE" ]
  then
    echo "Setting timezone to $TIMEZONE"
    cp /usr/share/zoneinfo/"$TIMEZONE" /etc/localtime
    echo "$TIMEZONE" > /etc/timezone
  else
    echo "$TIMEZONE does not exist"
  fi
  apk del tzdata
fi

echo "Starting clamav at $(date +'%x %X')"
freshclam --no-dns
crond -f & clamd
