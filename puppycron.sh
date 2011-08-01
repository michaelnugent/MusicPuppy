#!/bin/bash

SERVER_URI="<your server here>"
BTADDR="<your BT ID here>"

DBUSADDR=`grep -z DBUS_SESSION_BUS_ADDRESS /proc/*/environ 2> /dev/null| sed 's/DBUS/\nDBUS/g' | tail -1`

if [ "x$DBUSADDR" != "x" ]; then
  export $DBUSADDR
else
  echo "Cannot find DBUS Session for Rhythmbox.  Please be sure the application is running"
  exit 1
fi

NAME=`hcitool name $BTADDR`

if [ -z "$NAME" ] ; then
    `rhythmbox-client --pause`
else
    `rhythmbox-client --play-uri=$SERVER_URI`
fi

