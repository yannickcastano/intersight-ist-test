# Configuration
tenant      = "Demo-Lab"
environment = "Production"
zones       = {
    epg-1 = {
        name   = "Web"
    },
    epg-2 = {
        name   = "App"
    },
    epg-3 = {
        name   = "Db"
    }
}
subnets     = {
    subnet-101 = "10.0.101.254/24",
    subnet-102 = "10.0.102.254/24",
    subnet-103 = "10.0.103.254/24"
}
vms         = {
    vm101-2    = {
        name   = "vm101-2",
        esx    = "esx-1",
        ip     = "10.0.101.2",
        mask   = 24,
        gw     = "10.0.101.254",
        zone   = "epg-2"
    },
    vm102-1    = {
        name   = "vm102-1",
        esx    = "esx-3",
        ip     = "10.0.102.1",
        mask   = 24,
        gw     = "10.0.102.254",
        zone   = "epg-3"
    },
    vm103-1    = {
        name   = "vm103-1",
        esx    = "esx-1",
        ip     = "10.0.103.1",
        mask   = 24,
        gw     = "10.0.103.254",
        zone   = "epg-1"
    }
}
# vCenter
vsphere_server = "10.60.9.180"
vsphere_user = "administrator"
vsphere_password = "C$sco123"
# ESX
esx       = {
    esx-1 = {
        name   = "esx-1.acifabric1.cisco.com/Resources"
    },
    esx-2 = {
        name   = "esx-2.acifabric1.cisco.com/Resources"
    },
    esx-3 = {
        name   = "esx-3.acifabric1.cisco.com/Resources"
    },
    esx-5 = {
        name   = "esx-5.acifabric1.cisco.com/Resources"
    },
    esx-6 = {
        name   = "esx-6.acifabric1.cisco.com/Resources"
    }
}
# ACI
aci_controller = "https://10.60.9.225"
aci_user       = "admin"
aci_password   = "cisco123"
