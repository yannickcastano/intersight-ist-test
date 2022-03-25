# Configuration
variable "tenant" {}
variable "environment" {}
variable "zones"    { type = map }
variable "subnets"  { type = map }
variable "vms"      { type = map }
# vCenter
variable "vsphere_server" {}
variable "vsphere_user" {}
variable "vsphere_password" {}
# ESX
variable "esx"      { type = map }
# ACI
variable "aci_controller" {}
variable "aci_user" {}
variable "aci_password" {}