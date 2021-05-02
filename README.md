# docker-clamav
Alpine based Dockerfile for a [clamav](https://www.clamav.net) image.

Uses alpine cron to update the virus database four times a day.

[![Docker Pulls](https://img.shields.io/docker/pulls/a16bitsysop/clamav.svg?style=flat-square)](https://hub.docker.com/r/a16bitsysop/clamav/)
[![Docker Stars](https://img.shields.io/docker/stars/a16bitsysop/clamav.svg?style=flat-square)](https://hub.docker.com/r/a16bitsysop/clamav/)
[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/a16bitsysop/clamav/latest?style=plastic)](https://hub.docker.com/r/a16bitsysop/clamav/)
[![Github SHA](https://img.shields.io/badge/dynamic/json?style=plastic&color=orange&label=Github%20SHA&query=object.sha&url=https%3A%2F%2Fapi.github.com%2Frepos%2Fa16bitsysop%2Fdocker-clamav%2Fgit%2Frefs%2Fheads%2Fmain)](https://github.com/a16bitsysop/docker-clamav)

## Github
Github Repository: [https://github.com/a16bitsysop/docker-clamav](
https://github.com/a16bitsysop/docker-clamav)

## Environment Variables
| Name     | Desription                                             | Default |
|----------|--------------------------------------------------------|---------|
| TIMEZONE | Timezone to use inside the container, eg Europe/London | unset   |

## Examples
**To run a container with tmpfs mount on /tmp**
```bash
docker container run --mount type=tmpfs,destination=/tmp -p 3310:3310 \
-d --name clamav a16bitsysop/clamav
```
