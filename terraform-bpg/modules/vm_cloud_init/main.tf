data "template_file" "cloud_init" {
  for_each = var.cloud_init_virtual_machines

  template = file("${path.module}/scripts/${each.value.cloud_init_file}")

  vars = {
    hostname                     = each.value.hostname
  }
}

resource "local_file" "cloud_init" {
  for_each = var.cloud_init_virtual_machines

  content  = data.template_file.cloud_init[each.key].rendered
  filename = "./cloud-init-config/user_data_cloud_init_${each.value.hostname}.cfg"
}

resource "null_resource" "cloud_init" {
  for_each = var.cloud_init_virtual_machines

  connection {
    type        = "ssh"
    user = var.virtual_environment_ssh_username
    password = var.virtual_environment_password
    host        = var.virtual_environment_ip
  }

  provisioner "file" {
    source      = local_file.cloud_init[each.key].filename
    destination = "/var/lib/vz/snippets/cloud_init_${each.value.hostname}.yml"
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [ 
      "rm -f /var/lib/vz/snippets/cloud_init_${each.value.hostname}.yml"
     ]
  }
}

resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  for_each = { for key, value in var.cloud_init_virtual_machines : key => value if startswith(value.vm_image_name, "jammy") == true }
  name      = each.value.hostname
  node_name = each.value.node_name
  vm_id = each.value.pve_vm_id

  initialization {
    ip_config {
      ipv4 {
        #address = "dhcp"
        address = each.value.ip_address
        gateway = each.value.gateway
      }
    }

    user_account {
      username = "user"
      password = "tere"
    }

    user_data_file_id = "local:snippets/cloud_init_${each.value.hostname}.yml"
  }

  stop_on_destroy = true

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  cpu {
    cores        = each.value.cpu_cores
    #type         = "qemu64"
  }

  memory {
    dedicated = each.value.memory
  }

  operating_system {
    type = each.value.qemu_os
  }

  agent {
    enabled = false
  }

  network_device {
    bridge = "vmbr0"
  }

  disk {
    datastore_id = each.value.storage
    file_id      = each.value.image_name
    interface    = "scsi0"
    #iothread     = true
    discard      = "on"
    size         = each.value.disk_size
  }
}

# resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
#   name      = "ububnu-2"
#   node_name = "tuule"
#   vm_id = "2500"

#   initialization {
#     ip_config {
#       ipv4 {
#         address = "dhcp"
#       }
#     }

#     user_data_file_id = "local:snippets/cloud_init_ubuntu.yml"
#   }

#   stop_on_destroy = true

#   startup {
#     order      = "3"
#     up_delay   = "60"
#     down_delay = "60"
#   }

#   operating_system {
#     type = "l26"
#   }

#   agent {
#     enabled = false
#   }

#   network_device {
#     bridge = "vmbr0"
#   }

#   disk {
#     datastore_id = "VM"
#     file_id      = "local:iso/jammy-server-cloudimg-amd64.img"
#     interface    = "virtio0"
#     iothread     = true
#     discard      = "on"
#     size         = 10
#   }
# }
