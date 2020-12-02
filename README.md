# Snapclient
Snapcast client based on alpine

Builds https://hub.docker.com/repository/docker/jorenn92/snapclient

Run with docker run -dti --device /dev/snd -e HOST=YOUR_HOSTNAME_HERE --name snapclient --restart unless-stopped jorenn92/snapclient
