#
# From ubuntu
#
FROM ubuntu:20.04
MAINTAINER  "Jven"
LABEL   Description="Snapcast client"

ENV HOST 192.168.0.2
COPY entrypoint.sh /entrypoint.sh

RUN set -x && \
    apt-get update -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y snapclient git automake libtool build-essential pkg-config python-docutils alsa && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y libasound2-dev libbluetooth-dev libdbus-1-dev libglib2.0-dev libsbc-dev libfdk-aac-dev && \
	mkdir /opt/bluez-alsa && \
	cd /opt/bluez-alsa && \
	git clone https://github.com/Arkq/bluez-alsa.git && \
	cd bluez-alsa && \
	autoreconf --install --force && \ 
	mkdir build && \
	cd build && \
	../configure --enable-aac --enable-ofono --enable-debug && \
	make && \
	make install && \
	DEBIAN_FRONTEND=noninteractive apt-get remove -y git automake build-essential libtool pkg-config python-docutils && \
	DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y libfdk-aac1 libgio-cil bluez && \
	chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]