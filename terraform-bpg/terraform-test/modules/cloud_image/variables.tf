# variable "virtual_environment_endpoint" {
#   type        = string
#   description = "URL for the Proxmox Virtual Environment"
# }

# variable "virtual_environment_password" {
#   type        = string
#   sensitive   = true
#   description = "The password for the Proxmox Virtual Environment"
# }

# variable "virtual_environment_username" {
#   type        = string
#   description = "The username and realm for the Proxmox Virtual Environment (example: root@pam)"
# }

# variable "pm_tls_insecure" {
#   description = "Set to true to ignore certificate errors"
#   type        = bool
#   default     = false
# }

# variable "virtual_environment_password" {
#   type        = string
#   sensitive   = true
#   description = "The password for the Proxmox Virtual Environment"
# }

# variable "virtual_environment_ssh_username" {
#   type        = string
#   description = "The username and realm for the Proxmox Virtual Environment"
# }

variable "virtual_environment_node_name" {
  type        = string
  description = "The endpoint for the Proxmox Virtual Environment"
}

# variable "virtual_environment_ip" {
#   type        = string
#   description = "IP of node1 for SSH"
# }

variable "cloud_images" {
  type = map(object({
    url  = string
    file_name = string
    content_type = string
  }))
  default = {
    ubuntu_22_jammy = {
      url       = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
      file_name = "jammy-server-cloudimg-amd64.img"
      content_type = "iso"
    }

   alma_9 = {
      url       = "https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-9.4-20240507.x86_64.qcow2"
      file_name = "AlmaLinux-9-GenericCloud-9.4-20240507.x86_64.qcow2"
      content_type = "iso"
    }

    # rocky_9_cloud = {
    #   url = "https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"
    #   file_name = "Rocky-9.4-x86_64-boot.iso"
    #   content_type = "iso"
    # }
  }
}

