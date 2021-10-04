variable "PM_API_TOKEN_SECRET" {
  default = env("PM_API_TOKEN_SECRET")
}
variable "PM_API_TOKEN_ID" {
  default = env("PM_API_TOKEN_ID")
}
variable "PM_API_URL" {
  default = env("PM_API_URL")
}
variable "PM_NODE" {
  default = env("PM_NODE")
}

source "proxmox-clone" "debian11-template" {
  proxmox_url              = var.PM_API_URL
  username                 = var.PM_API_TOKEN_ID
  token                    = var.PM_API_TOKEN_SECRET
  insecure_skip_tls_verify = true
  node                     = var.PM_NODE
  memory                   = 2048
  os                       = "l26"
  model                    = "virtio"
  scsi_controller          = "virtio-scsi-pci"
  full_clone               = true
  clone_vm                 = "debian11-setup"
  ssh_username             = "james"

  template_description = "Generic Debian Image to use"
  template_name        = "debian11-template"
}

build {
  description = "A template for building a base cloud-init ready image"
  sources = [
    "source.proxmox-clone.debian11-template"
  ]
  provisioner "shell" {
    inline = [
      "sudo apt update && sudo apt upgrade -y",
    ]
  }
  provisioner "shell" {
    scripts = [
      "scripts/cloud-ready.sh"
    ]
  }
}
