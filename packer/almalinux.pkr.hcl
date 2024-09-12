source "proxmox-iso" "almalinux" {
  iso_url              = "https://repo.almalinux.org/almalinux/8/isos/x86_64/AlmaLinux-8.6-x86_64-dvd.iso"
  iso_checksum         = "SHA256:3ed462b45e0b1f0f56cd0a4b3f35cc4dbb4cde92e50b9a3f2ecb7df1e8d9ec1e"
  iso_checksum_type    = "sha256"
  
  vm_name              = "almalinux-packer-template"
  target_node          = ""
  storage_pool         = ""
  format               = "qcow2"

  cores                = 2
  memory               = 2048
  scsi_controller      = "virtio-scsi-pci"
  scsi0                = "local-lvm:10G"
  
  ssh_username         = ""
  ssh_password         = ""
  ssh_wait_timeout     = "5m"

  network_adapters = [{
    model     = "virtio"
    bridge    = "vmbr0"
  }]

  boot_wait = "20s"
  boot_command = [
    "<enter><wait>",
    "linux ks=http://your-kickstart-server/almalinux.ks<enter>"
  ]
}

build {
  name = "almalinux-proxmox-image"

  sources = [
    "source.proxmox-iso.almalinux"
  ]

  provisioner "shell" {
    inline = [
      "dnf update -y",
      "dnf install -y openssh-server",
      "systemctl enable sshd",
      "systemctl start sshd"
    ]
  }
}

