## Proxmox provider setup

variable "virtual_environment_endpoint" {
  type        = string
  description = "URL for the Proxmox Virtual Environment"
}

variable "virtual_environment_username" {
  type        = string
  description = "The username and realm for the Proxmox Virtual Environment (example: root@pam)"
}

variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = false
}

variable "virtual_environment_password" {
  type        = string
  sensitive   = true
  description = "The password for the Proxmox Virtual Environment"
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
}

variable "cloud_init_virtual_machines" {
  type = map(object({
    hostname = string
    #tags            = list(string)
    #description       = string
    ip_address = string
    gateway    = string
    #search_domain       = string
    #dns_server          = string
    #vlan_tag           = number
    node_name = string
    cpu_cores = number
    #cpu_sockets        = number
    memory    = string
    qemu_os   = string
    disk_size = string
    storage        = string
    #onboot             = bool
    vm_image_name   = string
    cloud_init_file = string
    pve_vm_id       = string
    image_name      = string
  }))
}
