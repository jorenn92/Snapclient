#!/bin/bash
BTDEVICE=$(cat /config/bluetooth.config | grep -i 'mac-address' | cut -d= -f2)

if [[ -e "/run/dbus/pid" ]]; then
        rm /run/dbus/pid
fi

/etc/init.d/bluetooth start && /usr/bin/dbus-daemon --system 
/usr/lib/bluetooth/bluetoothd &
/usr/bin/bluealsa -i hci0 -p a2dp-source -p a2dp-sink > /dev/null 2>&1 &

echo "Required services started, moving on."

if [[ -e "/config/setupdone" ]]; then
        ./scripts/autopair
else
    ./scripts/setup
fi

echo "All done starting snapclient.."
snapclient -h $HOST
