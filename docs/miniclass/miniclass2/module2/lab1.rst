Creating TF file with ntp, vlan, dns, selfip
--------------------------------------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

This class covers the following topics:

- Update the master.tf file to include infrastructure resources like NTP, DNS, VLAN::

   cd $GOPATH/src/github.com/f5devcentral/terraform-provider-bigip/
   nano master.tf


#. Using an editor of your choice, open master.tf in terminal on the Client/Jumpbox VM. The contents should already be the following::

            provider "bigip" {
               address = "10.1.1.246"
               username = "admin"
               password = "admin"
            }

#. Update master file to include ntp resource::

            resource "bigip_sys_ntp" "ntp1" {
                description = "/Common/NTP1"
                servers = ["time.google.com"]
                timezone = "America/Los_Angeles"
            }

#. Update master file to include dns resource::

            resource "bigip_sys_dns" "dns1" {
                description = "/Common/DNS1"
                name_servers = ["8.8.8.8"]
                number_of_dots = 2
                search = ["f5.com"]
            }

#. Update master file to include internal vlan resource::

            resource "bigip_net_vlan" "vlan1" {
                name = "/Common/internal"
                tag = 101
                interfaces = {
                    vlanport = 1.2,
                    tagged = false
                }
            }

#. Update master file to include external vlan resource::

            resource "bigip_net_vlan" "vlan2" {
                name = "/Common/external"
                tag = 102
                interfaces = {
                    vlanport = 1.1,
                    tagged = false
                }
            }

#. Update master file to include Internal Self IP resource::

            resource "bigip_net_selfip" "selfip1" {
                name = "/Common/internalselfIP"
                ip = "10.1.20.246/24"
                vlan = "/Common/internal"
                depends_on = ["bigip_net_vlan.vlan1"]
            }

#. Update master file to include External Self IP resource::

            resource "bigip_net_selfip" "selfip2" {
                name = "/Common/externalselfIP"
                ip = "10.1.10.246/24"
                vlan = "/Common/external"
                depends_on = ["bigip_net_vlan.vlan2"]
            }

.. NOTE::
     All work for this lab will be performed exclusively from the Windows
     jumphost. No installation or interaction with your local system is
     required.
