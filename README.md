# docker-clamav
Alpine based Dockerfile for a [clamav](https://www.clamav.net) image.

Uses alpine cron to update the virus database four times a day.

[![Docker Pulls](
https://img.shields.io/docker/pulls/a16bitsysop/clamav.svg?style=flat-square)](
https://hub.docker.com/r/a16bitsysop/clamav/)
[![Docker Stars](
https://img.shields.io/docker/stars/a16bitsysop/clamav.svg?style=flat-square)](
https://hub.docker.com/r/a16bitsysop/clamav/)
[![Version](
https://images.microbadger.com/badges/version/a16bitsysop/clamav.svg)](
https://microbadger.com/images/a16bitsysop/clamav "Get_your_own_version_badge_on_microbadger.com")
[![Commit](
https://images.microbadger.com/badges/commit/a16bitsysop/clamav.svg)](
https://microbadger.com/images/a16bitsysop/clamav "Get_your_own_commit_badge_on_microbadger.com")

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
