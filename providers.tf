provider "vsphere" {
  vsphere_server = var.vsphere_server
  user = var.vsphere_user
  password = var.vsphere_password
  allow_unverified_ssl = true
}
provider "aci" {
  username = var.aci_user
  password = var.aci_password
  url      = var.aci_controller
  insecure = true
}