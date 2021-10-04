# Instructions

1. Create Debian 11 Image no normal User (Name = debian11-setup) (Minimal SSH)
2. Snapshot Initial config
3. Start, Upgrade, install git, and pull this repo
4. Run scripts/first_boot.sh
5. Run scripts/cloud_ready.sh
6. Manually Attach Cloud-init drive
7. Change IP Config to ip=dhcp,ip6=auto
8. Snapshot Current Configuration
9. Run Packer Build from your Terraform/Packer Bastion running on Proxmox
