#!/bin/ash

/usr/bin/dbus-daemon --system &
/usr/lib/bluetooth/bluetoothd &
snapclient -h $HOST