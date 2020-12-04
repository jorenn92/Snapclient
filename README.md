# Snapclient
Snapcast client based on alpine

Builds https://hub.docker.com/repository/docker/jorenn92/snapclient

Run command :  docker run -dti --privileged --device /dev/snd --device /dev/bus/usb -v /usr/apps/snapclient/devices:/var/lib/bluetooth -v /usr/apps/snapclient/config:/config --net=host --cap-add NET_ADMIN -v /var/run/dbus:/var/run/dbus -v /etc/localtime:/etc/localtime:ro --name snapclient --restart unless-stopped jorenn92/snapclient
