resource "proxmox_virtual_environment_download_file" "ubuntu-cloud-test" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = var.virtual_environment_node_name
  file_name    = "jammy-server-cloudimg-amd64.img"
  url          = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  overwrite    = false
  upload_timeout = 1800
}

# resource "proxmox_virtual_environment_download_file" "rocky-cloud-test" {
#   content_type = "iso"
#   datastore_id = "local"
#   node_name    = var.virtual_environment_endpoint_node1_name
#   file_name    = "Rocky-9.4-x86_64.iso"
#   url          = "https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2"
#   overwrite    = false
#   upload_timeout = 1800
# }

# resource "proxmox_virtual_environment_download_file" "cloud-images-test" {
#   for_each     = var.cloud_images
#   content_type = each.value.content_type
#   datastore_id = "local"
#   node_name    = var.virtual_environment_endpoint_node1_name
#   file_name    = each.value.file_name
#   url          = each.value.url
#   overwrite    = false
#   upload_timeout = 1800
# }