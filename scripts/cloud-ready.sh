#!/bin/bash

sudo truncate -s 0 /etc/machine-id
sudo truncate -s 0 /var/lib/dbus/machine-id

sudo rm -rf /etc/udev/rules/* || true

sudo cloud-init clean --logs

sudo passwd -l root

echo "Setup Done"
