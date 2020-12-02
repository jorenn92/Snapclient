#
# From alpine
#
FROM    alpine:latest
MAINTAINER  "Jven"
LABEL   Description="Snapcast client"

ENV HOST 192.168.0.2
COPY entrypoint.sh /entrypoint.sh

RUN set -x && \
    apk upgrade --update && \
    apk add --no-cache snapcast-client --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community && \
	apk add --no-cache bluez dbus && \
	chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]