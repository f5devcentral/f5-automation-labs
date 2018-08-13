Remove All remaining Configuration
----------------------------------


Please follow the instructions provided by the instructor to start your
lab and access your jump host.

#. Remove all configuration::

        terraform destroy

You should see the following output::

	bigip_sys_ntp.ntp1: Refreshing state... (ID: /Common/NTP1)
	bigip_net_vlan.vlan2: Refreshing state... (ID: /Common/external)
	bigip_net_vlan.vlan1: Refreshing state... (ID: /Common/internal)
	bigip_ltm_monitor.monitor: Refreshing state... (ID: /Common/terraform_monitor)
	bigip_sys_dns.dns1: Refreshing state... (ID: /Common/DNS1)
	bigip_net_selfip.selfip2: Refreshing state... (ID: /Common/externalselfIP)
	bigip_net_selfip.selfip1: Refreshing state... (ID: /Common/internalselfIP)

	An execution plan has been generated and is shown below.
	Resource actions are indicated with the following symbols:
  	- destroy

	Terraform will perform the following actions:

  	- bigip_ltm_monitor.monitor

  	- bigip_net_selfip.selfip1

  	- bigip_net_selfip.selfip2

  	- bigip_net_vlan.vlan1

  	- bigip_net_vlan.vlan2

  	- bigip_sys_dns.dns1

  	- bigip_sys_ntp.ntp1


	Plan: 0 to add, 0 to change, 7 to destroy.

	Do you really want to destroy?
  	Terraform will destroy all your managed infrastructure, as shown above.
  	There is no undo. Only 'yes' will be accepted to confirm.

  	Enter a value:

Continue terraform destroy by typing ``yes`` followed by the enter key...

You should see the following output::

	bigip_sys_ntp.ntp1: Destroying... (ID: /Common/NTP1)
	bigip_sys_dns.dns1: Destroying... (ID: /Common/DNS1)
	bigip_net_selfip.selfip1: Destroying... (ID: /Common/internalselfIP)
	bigip_ltm_monitor.monitor: Destroying... (ID: /Common/terraform_monitor)
	bigip_sys_dns.dns1: Destruction complete after 0s
	bigip_net_selfip.selfip2: Destroying... (ID: /Common/externalselfIP)
	bigip_sys_ntp.ntp1: Destruction complete after 0s
	bigip_net_selfip.selfip1: Destruction complete after 0s
	bigip_net_vlan.vlan1: Destroying... (ID: /Common/internal)
	bigip_ltm_monitor.monitor: Destruction complete after 0s
	bigip_net_selfip.selfip2: Destruction complete after 0s
	bigip_net_vlan.vlan2: Destroying... (ID: /Common/external)
	bigip_net_vlan.vlan1: Destruction complete after 0s
	bigip_net_vlan.vlan2: Destruction complete after 0s

	Destroy complete! Resources: 7 destroyed.




.. NOTE::
	 All work for this lab will be performed exclusively from the Windows
	 jumphost. No installation or interaction with your local system is
	 required.
