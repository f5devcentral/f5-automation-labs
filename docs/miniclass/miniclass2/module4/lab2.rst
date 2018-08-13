Modify the master.tf file
-------------------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

#. Remove the VIP, monitor, Pool code resulting in the following content::

        provider "bigip" {
                address = "10.1.1.246"
                username = "admin"
                password = "admin"
        }

        resource "bigip_sys_ntp" "ntp1" {
                description = "/Common/NTP1"
                servers = ["time.google.com"]
                timezone = "America/Los_Angeles"
        }

        resource "bigip_sys_dns" "dns1" {
                description = "/Common/DNS1"
                name_servers = ["8.8.8.8"]
                number_of_dots = 2
                search = ["f5.com"]
        }

        resource "bigip_net_vlan" "vlan1" {
                name = "/Common/internal"
                tag = 101
                interfaces = {
                        vlanport = 1.2,
                        tagged = false
                }
        }

        resource "bigip_net_vlan" "vlan2" {
                name = "/Common/external"
                tag = 102
                interfaces = {
                                vlanport = 1.1,
                                tagged = false
                }
        }

        resource "bigip_net_selfip" "selfip1" {
                name = "/Common/internalselfIP"
                ip = "10.1.20.246/24"
                vlan = "/Common/internal"
                depends_on = ["bigip_net_vlan.vlan1"]
        }

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
