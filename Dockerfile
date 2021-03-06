#
# From ubuntu
#
FROM ubuntu:20.04
MAINTAINER  "Jven"
LABEL   Description="Snapcast client"

ENV HOST 192.168.0.2
COPY entrypoint.sh 	/entrypoint.sh
COPY scripts 		/scripts
COPY config 		/config

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
	../configure --enable-aac --enable-msbc --enable-ofono --enable-debug && \
	make && \
	make install && \
	DEBIAN_FRONTEND=noninteractive apt-get remove -y git automake build-essential libtool pkg-config python-docutils && \
	DEBIAN_FRONTEND=noninteractive apt-get remove -y libasound2-dev libbluetooth-dev libdbus-1-dev libglib2.0-dev libsbc-dev libfdk-aac-dev && \
	DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
	DEBIAN_FRONTEND=noninteractive apt-get clean -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y libfdk-aac1 libgio-cil bluez && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y dbus libfdk-aac1 libasound2 libbluetooth3 libbsd0 libglib2.0-0 libsbc1 rsyslog && \
	chmod +x /entrypoint.sh /scripts/* && \
	echo "@reboot hciattach /dev/ttyAMA0 bcm43xx 921600 -" | crontab -

ENTRYPOINT ["/entrypoint.sh"]