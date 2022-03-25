# Vm creation
resource "vsphere_virtual_machine" "vm" {
  for_each         = var.vms
  name             = format("%s-%s",var.tenant, each.value.name)
  resource_pool_id = data.vsphere_resource_pool.esx[each.value.esx].id
  datastore_id     = data.vsphere_datastore.datastore_NetApp.id
  num_cpus   = 1
  memory     = 1024
  wait_for_guest_net_timeout = 0
  guest_id = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type
  disk {
   label            = "disk0"
   size             = data.vsphere_virtual_machine.template.disks.0.size
   eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
   thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = format("%s-%s",var.tenant, each.value.name)
        domain    = "cisco.com"
      }
      network_interface {
        ipv4_address = each.value.ip
        ipv4_netmask = each.value.mask
      }
      ipv4_gateway = each.value.gw
    }
  }
}
