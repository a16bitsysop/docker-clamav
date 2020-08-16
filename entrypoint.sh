#!/bin/sh

set-timezone.sh clamav

freshclam --no-dns
crond -f &
clamd
