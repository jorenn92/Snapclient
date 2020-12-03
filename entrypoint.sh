#!/bin/bash

rm /run/dbus/pid &
/etc/init.d/bluetooth start &
/usr/bin/dbus-daemon --system &
/usr/lib/bluetooth/bluetoothd &


if [[ -e "/config/setupdone" ]]; then
	./scripts/autopair &
else
    ./scripts/setup &
fi

snapclient -h $HOST