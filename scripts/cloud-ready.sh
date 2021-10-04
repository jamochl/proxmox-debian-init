#!/bin/bash

> /etc/machine-id
> /var/lib/dbus/machine-id

rm -rf /etc/udev/rules/*

cloud-init clean --logs

passwd -l root

echo "Setup Done"
