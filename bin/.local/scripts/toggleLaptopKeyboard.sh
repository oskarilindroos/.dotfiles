#!/bin/bash

deviceID=$(xinput list | grep "AT Translated Set 2 keyboard" | sed 's/.*id=\([0-9]*\).*/\1/')
state=$(xinput list-props "$deviceID" | grep "Device Enabled" | grep -o "[01]$")

if [ $state == '1' ];then
  echo "Disabling keyboard with ID $deviceID"
  xinput --disable "$deviceID"
else
  echo "Enabling keyboard with ID $deviceID"
  xinput --enable "$deviceID"
fi
