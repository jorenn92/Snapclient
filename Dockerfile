#
# From alpine
#
FROM    alpine:latest
MAINTAINER  "Jven"
LABEL   Description="Snapcast client"

ENV HOST 192.168.0.2

RUN set -x && \
    apk upgrade --update && \
    apk add --no-cache snapcast-client --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

ENTRYPOINT ["/bin/ash","-c","snapclient -h $HOST"]

