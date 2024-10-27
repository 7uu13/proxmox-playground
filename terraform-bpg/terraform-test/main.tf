module "cloud_init" {
  source = "./modules/cloud_image/"

  virtual_environment_node_name = var.virtual_environment_node_name
}

module "cloud_init_ubuntu_vm" {
  source = "./modules/vm_cloud_init/"

  virtual_environment_endpoint = var.virtual_environment_endpoint
  virtual_environment_username = var.virtual_environment_username
  virtual_environment_password = var.virtual_environment_password
  virtual_environment_ssh_username = var.virtual_environment_ssh_username

  virtual_environment_node_name = var.virtual_environment_node_name
  virtual_environment_ip   = var.virtual_environment_ip

  cloud_init_virtual_machines = var.cloud_init_virtual_machines
  proxmox_host_ipv4_addrs = var.proxmox_host_ipv4_addrs
}