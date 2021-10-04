#!/bin/bash -ex

apt update && apt upgrade -y
apt install sudo cloud-init qemu-guest-agent vim unattended-upgrades git

if grep --quiet 'ssh_deletekeys: \w*' /etc/cloud/cloud.cfg; then
    echo -e "\nssh_deletekeys: true" >> /etc/cloud/cloud.cfg
fi

echo "datasource_list: [ NoCloud, ConfigDrive ]" > /etc/cloud/cloud.cfg.d/99-pve.cfg

cat <<EOF > /etc/apt/apt.conf.d/20auto-upgrades
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
EOF
