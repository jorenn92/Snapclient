#
# From ubuntu
#
FROM ubuntu:20.04
MAINTAINER  "Jven"
LABEL   Description="Snapcast client"

ENV HOST 192.168.0.2
COPY entrypoint.sh /entrypoint.sh

RUN set -x && \
    apt update -y && \
	apt install -y snapclient && \
	chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]