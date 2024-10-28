## Proxmox provider setup

variable "virtual_environment_endpoint" {
  type        = string
  description = "URL for the Proxmox Virtual Environment"
}

variable "virtual_environment_username" {
  type        = string
  description = "The username and realm for the Proxmox Virtual Environment (example: root@pam)"
}

variable "virtual_environment_password" {
  type        = string
  sensitive   = true
  description = "The password for the Proxmox Virtual Environment"
}

variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = false
}

variable "virtual_environment_ssh_username" {
  type        = string
  description = "The username and realm for the Proxmox Virtual Environment"
}

variable "virtual_environment_node_name" {
  type        = string
  description = "The endpoint for the Proxmox Virtual Environment"
}

variable "virtual_environment_ip" {
  type        = string
  description = "IP of node1 for SSH"
}

variable "proxmox_host_ipv4_addrs" {
  type = map(string)
  default = {
    tuule = "192.168.1.174"
  }
}

variable "cloud_init_virtual_machines" {
  default = {

    # "monitor" = {
    #   hostname        = "monitor"
    #   ip_address      = "192.168.1.197/24"
    #   gateway         = "192.168.1.1"
    #   node_name       = "tuule"
    #   cpu_cores       = 2
    #   memory          = "2048"
    #   qemu_os         = "l26"
    #   disk_size       = "10"
    #   storage         = "VM"
    #   vm_image_name   = "jammy-server-cloudimg-amd64.img"
    #   cloud_init_file = "monitor_cloud_init.yml"
    #   pve_vm_id       = 5000
    #   image_name      = "local:iso/jammy-server-cloudimg-amd64.img"
    # }

    # "dns" = {
    #   hostname        = "dns"
    #   ip_address      = "192.168.1.211/24"
    #   gateway         = "192.168.1.1"
    #   node_name       = "tuule"
    #   cpu_cores       = 2
    #   memory          = "2048"
    #   qemu_os         = "l26"
    #   disk_size       = "100"
    #   storage         = "VM"
    #   vm_image_name   = "jammy-server-cloudimg-amd64.img"
    #   cloud_init_file = "dns_cloud_init.yml"
    #   pve_vm_id       = 10000
    #   image_name      = "local:iso/jammy-server-cloudimg-amd64.img"
    # }

    "kube1" = {
      hostname        = "kube1"
      ip_address      = "192.168.1.175/24"
      gateway         = "192.168.1.1"
      node_name       = "tuule"
      cpu_cores       = 1
      memory          = "1024"
      qemu_os         = "l26"
      disk_size       = "10"
      storage         = "VM"
      vm_image_name   = "jammy-server-cloudimg-amd64.img"
      cloud_init_file = "monitor_cloud_init.yml"
      pve_vm_id       = 6001
      image_name      = "local:iso/jammy-server-cloudimg-amd64.img"
    }

    "kube2" = {
      hostname        = "kube2"
      ip_address      = "192.168.1.176/24"
      gateway         = "192.168.1.1"
      node_name       = "tuule"
      cpu_cores       = 1
      memory          = "1024"
      qemu_os         = "l26"
      disk_size       = "10"
      storage         = "VM"
      vm_image_name   = "jammy-server-cloudimg-amd64.img"
      cloud_init_file = "monitor_cloud_init.yml"
      pve_vm_id       = 6002
      image_name      = "local:iso/jammy-server-cloudimg-amd64.img"
    }

    "kube3" = {
      hostname        = "kube3"
      ip_address      = "192.168.1.177/24"
      gateway         = "192.168.1.1"
      node_name       = "tuule"
      cpu_cores       = 1
      memory          = "1024"
      qemu_os         = "l26"
      disk_size       = "10"
      storage         = "VM"
      vm_image_name   = "jammy-server-cloudimg-amd64.img"
      cloud_init_file = "monitor_cloud_init.yml"
      pve_vm_id       = 6003
      image_name      = "local:iso/jammy-server-cloudimg-amd64.img"
    }

  }
}
