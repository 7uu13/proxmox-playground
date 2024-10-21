# Cool Stuff hehe
variable "hostname" {
  type = string
}
variable "description" {
}
variable "os" {
  type = string
}
variable "size" {
  default = "small"
}
variable "ip_address" {
  type = string
}
variable "tags" {
  type = string
}

# Sensitive Stuff
variable "api_url" {
  description = "Address of my local proxmox instance"
  type        = string
}

variable "token_id" {
  description = "Token id for proxmox api"
  sensitive   = true
  type        = string
}

variable "token_secret" {
  description = "Token secret for proxmox api"
  sensitive   = true
  type        = string
}

variable "ssh_pub_key" {
  description = "Pub key for cloudinit"
  type        = string
}

variable "target_node" {
    description = "Name of my proxmox cluster"
    type = string
}