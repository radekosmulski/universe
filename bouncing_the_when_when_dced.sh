#!/bin/bash

wlan=`/sbin/ifconfig <interface> | grep inet\ addr | wc -l`

if [ $wlan -eq 0 ]; then
  /sbin/ifdown <interface> && /sbin/ifup <interface>
fi
