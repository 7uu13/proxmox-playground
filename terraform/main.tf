resource "proxmox_vm_qemu" "kube2" {
  name        = "kube2"
  target_node = var.target_node
  vmid        = 5002
  onboot      = true

  clone   = "ubuntu-cloud"
  agent   = 0
  os_type = "cloud-init"
  cpu     = "host"
  memory  = 2048
  cores   = 2

  scsihw   = "virtio-scsi-single"
  bootdisk = "scsi0"

  sshkeys = <<EOF
  var.ssh_pub_key
  EOF

  # network {
  #   model  = "virtio"
  #   bridge = "vmbr0"
  #   ipconfig {
  #     dhcp = true
  #   }
  # }

  disks {
    scsi {
      scsi0 {
        disk {
          storage = "VM"
          size    = "12G"
        }
      }
    }
  }
}