data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}
# Datastores
data "vsphere_datastore" "datastore_NetApp" {
  name          = "SVM_Mpod"
  datacenter_id = data.vsphere_datacenter.dc.id
}
# VM template
data "vsphere_virtual_machine" "template" {
  name          = "centos_7_template"
  datacenter_id = data.vsphere_datacenter.dc.id
}
# ESX
data "vsphere_resource_pool" "esx" {
  for_each      = var.esx
  name          = each.value.name
  datacenter_id = data.vsphere_datacenter.dc.id
}
# PortGroups
data "vsphere_network" "pg" {
  depends_on    = [module.aci]
  for_each      = var.zones
  name          = format("%s|%s|%s",var.tenant, var.environment, each.value.name)
  datacenter_id = data.vsphere_datacenter.dc.id
}