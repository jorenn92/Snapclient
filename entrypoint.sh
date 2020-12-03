#!/bin/bash

rm /run/dbus/pid &
/etc/init.d/bluetooth start &
/usr/bin/dbus-daemon --system &
#/usr/lib/bluetooth/bluetoothd --debug &
#bluealsa & 
snapclient -h $HOST