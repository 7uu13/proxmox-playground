terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11" # Make sure to use the latest version available
    }
  }
}

provider "proxmox" {
    pm_api_url = ""
    pm_user = ""
    pm_password = ""
    pm_log_enable = true
    pm_log_file   = "terraform-plugin-proxmox.log"
    # pm_tls_insecure = true
  }

resource "proxmox_vm_qemu" "alma1" {
      name = "alma1"
      target_node = ""
      clone = 
    }
