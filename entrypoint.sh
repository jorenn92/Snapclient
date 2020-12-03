#!/bin/bash

if [[ -e "/run/dbus/pid" ]]; then
	rm /run/dbus/pid &
fi

bluetooth start &
/usr/bin/dbus-daemon --system &
/usr/lib/bluetooth/bluetoothd &
echo "bluetooth service started, moving on."

if [[ -e "/config/setupdone" ]]; then
	./scripts/autopair &
else
    ./scripts/setup &
fi

echo "All done starting snapclient.."
snapclient -h $HOST