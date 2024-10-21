terraform {
  required_version = ">=0.14"
  required_providers {
    proxmox = {
      source  = "registry.example.com/telmate/proxmox"
      version = ">=1.0.0"
    }
  }
}

provider "proxmox" {
  pm_tls_insecure     = true
  pm_api_url          = var.api_url
  pm_debug            = true
  pm_api_token_id     = var.token_id
  pm_api_token_secret = var.token_secret
}