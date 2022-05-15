# Instructions

The following will create a good image to use for quick Proxmox Debian 11
deployments

1. Create Debian 11 Image no normal User (Name = debian11-setup) (Minimal SSH)
2. Create an image snapshot called 'Initial'
3. Start, Upgrade, install git, and pull this repo
4. Run scripts/first_boot.sh <- Will install cloud-init and qemu-agent
5. Run scripts/cloud_ready.sh <- Will clear cloud-init files
6. Manually Attach Cloud-init drive <- Done in the proxmox gui
7. Change IP Config to ip=dhcp,ip6=auto
8. Create an image snapshot called 'Ready'
9. Run Packer Build from your Terraform/Packer Bastion running on Proxmox

# Terraform/Packer bastion host

Requires that a Terraform/Packer bastion host be deployed on your Proxmox
infra

1. Create Debian 11 Image no normal User (Name = terraform-bastion)
   (Can be created as a full-clone of the above image)
2. Create an image snapshot called 'Initial'
3. Start, Upgrade, install git, packer and terraform and pull this repo
4. Create an API key in the Proxmox gui for use in this bastion, add
   details into `~/.profile`
5. `cd` into this cloned git repo, run `packer build cloud_setup.pkr.hcl` &
   `packer build docker_setup.pkr.hcl`

## Installing Packer and Terraform

```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update && sudo apt install terraform packer
```
