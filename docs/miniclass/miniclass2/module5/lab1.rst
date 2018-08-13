Do Terraform Apply to configure vlan, selfip
--------------------------------------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

#. Execute terraform apply with updated **master.tf**::

    terraform apply

You should see the following output::

	An execution plan has been generated and is shown below.
	Resource actions are indicated with the following symbols:
	+ create

	Terraform will perform the following actions:

	+ bigip_net_selfip.selfip1
		id:                      <computed>
		ip:                      "10.1.20.246/24"
		name:                    "/Common/internalselfIP"
		traffic_group:           "traffic-group-local-only"
		vlan:                    "/Common/internal"

	+ bigip_net_selfip.selfip2
		id:                      <computed>
		ip:                      "10.1.10.246/24"
		name:                    "/Common/externalselfIP"
		traffic_group:           "traffic-group-local-only"
		vlan:                    "/Common/external"

	+ bigip_net_vlan.vlan1
		id:                      <computed>
		interfaces.#:            "1"
		interfaces.0.tagged:     "false"
		interfaces.0.vlanport:   "1.2"
		name:                    "/Common/internal"
		tag:                     "101"

	+ bigip_net_vlan.vlan2
		id:                      <computed>
		interfaces.#:            "1"
		interfaces.0.tagged:     "false"
		interfaces.0.vlanport:   "1.1"
		name:                    "/Common/external"
		tag:                     "102"

	+ bigip_sys_dns.dns1
		id:                      <computed>
		description:             "/Common/DNS1"
		name_servers.#:          "1"
		name_servers.3817307869: "8.8.8.8"
		number_of_dots:          "2"
		search.#:                "1"
		search.3719609835:       "f5.com"

	+ bigip_sys_ntp.ntp1
		id:                      <computed>
		description:             "/Common/NTP1"
		servers.#:               "1"
		servers.1450813517:      "time.google.com"
		timezone:                "America/Los_Angeles"


	Plan: 6 to add, 0 to change, 0 to destroy.

	Do you want to perform these actions?
	Terraform will perform the actions described above.
	Only 'yes' will be accepted to approve.

	Enter a value: 

Continue terraform apply by typing ``yes`` followed by the enter key...

You should see the following output::

   	bigip_sys_ntp.ntp1: Creating...
   	description:        "" => "/Common/NTP1"
   	servers.#:          "0" => "1"
   	servers.1450813517: "" => "time.google.com"
   	timezone:           "" => "America/Los_Angeles"
   	bigip_net_vlan.vlan1: Creating...
   	interfaces.#:          "0" => "1"
   	interfaces.0.tagged:   "" => "false"
   	interfaces.0.vlanport: "" => "1.2"
   	name:                  "" => "/Common/internal"
   	tag:                   "" => "101"
   	bigip_net_vlan.vlan2: Creating...
   	interfaces.#:          "0" => "1"
   	interfaces.0.tagged:   "" => "false"
   	interfaces.0.vlanport: "" => "1.1"
   	name:                  "" => "/Common/external"
   	tag:                   "" => "102"
   	bigip_sys_dns.dns1: Creating...
   	description:             "" => "/Common/DNS1"
   	name_servers.#:          "0" => "1"
   	name_servers.3817307869: "" => "8.8.8.8"
   	number_of_dots:          "" => "2"
   	search.#:                "0" => "1"
   	search.3719609835:       "" => "f5.com"
   	bigip_sys_ntp.ntp1: Creation complete after 2s (ID: /Common/NTP1)
   	bigip_sys_dns.dns1: Creation complete after 2s (ID: /Common/DNS1)
   	bigip_net_vlan.vlan1: Creation complete after 2s (ID: /Common/internal)
   	bigip_net_selfip.selfip1: Creating...
   	ip:   "" => "10.1.20.246/24"
   	name: "" => "/Common/internalselfIP"
   	vlan: "" => "/Common/internal"
   	bigip_net_vlan.vlan2: Creation complete after 2s (ID: /Common/external)
   	bigip_net_selfip.selfip2: Creating...
   	ip:   "" => "10.1.10.246/24"
   	name: "" => "/Common/externalselfIP"
   	vlan: "" => "/Common/external"
   	bigip_net_selfip.selfip1: Creation complete after 0s (ID: /Common/internalselfIP)
   	bigip_net_selfip.selfip2: Creation complete after 0s (ID: /Common/externalselfIP)

   	Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

.. NOTE::
	 All work for this lab will be performed exclusively from the Windows
	 jumphost. No installation or interaction with your local system is
	 required.


