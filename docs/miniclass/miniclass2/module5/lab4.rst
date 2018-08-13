Terraform Apply to Deploy iApp
------------------------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

#. Add iApp resource to use simple http JSON::

    terraform apply

You should see the following output::

	bigip_sys_dns.dns1: Refreshing state... (ID: /Common/DNS1)
	bigip_net_vlan.vlan2: Refreshing state... (ID: /Common/external)
	bigip_sys_ntp.ntp1: Refreshing state... (ID: /Common/NTP1)
	bigip_net_vlan.vlan1: Refreshing state... (ID: /Common/internal)
	bigip_net_selfip.selfip2: Refreshing state... (ID: /Common/externalselfIP)
	bigip_net_selfip.selfip1: Refreshing state... (ID: /Common/internalselfIP)

	An execution plan has been generated and is shown below.
	Resource actions are indicated with the following symbols:
  	+ create

	Terraform will perform the following actions:

  	+ bigip_sys_iapp.simplehttp
      	id:                      <computed>
      	devicegroup:             "none"
      	inherited_devicegroup:   "true"
      	inherited_traffic_group: "true"
      	jsonfile:                "{\n\n\t\"fullPath\": \"/Common/simplehttp.app/simplehttp\",\n\n\t\"generation\": 222,\n\n\t\"inheritedDevicegroup\": \"true\",\n\n\t\"inheritedTrafficGroup\": \"true\",\n\n\t\"kind\": \"tm:sys:application:service:servicestate\",\n\n\t\"name\": \"simplehttp\",\n\n\t\"partition\": \"Common\",\n\n\t\"selfLink\": \"https://localhost/mgmt/tm/sys/application/service/~Common~simplehttp.app~simplehttp?ver=13.0.0\",\n\n\t\"strictUpdates\": \"enabled\",\n\n\t\"subPath\": \"simplehttp.app\",\n\n\t\"tables\": [{\n\n\t\t\t\"name\": \"basic__snatpool_members\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"name\": \"net__snatpool_members\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"name\": \"optimizations__hosts\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"columnNames\": [\n\n\t\t\t\t\"name\"\n\n\t\t\t],\n\n\t\t\t\"name\": \"pool__hosts\",\n\n\t\t\t\"rows\": [{\n\n\t\t\t\t\"row\": [\n\n\t\t\t\t\t\"f5.cisco.com\"\n\n\t\t\t\t]\n\n\t\t\t}]\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"columnNames\": [\n\n\t\t\t\t\"addr\",\n\n\t\t\t\t\"port\",\n\n\t\t\t\t\"connection_limit\"\n\n\t\t\t],\n\n\t\t\t\"name\": \"pool__members\",\n\n\t\t\t\"rows\": [{\n\n\t\t\t\t\t\"row\": [\n\n\t\t\t\t\t\t\"10.1.20.252\",\n\n\t\t\t\t\t\t\"80\",\n\n\t\t\t\t\t\t\"0\"\n\n\t\t\t\t\t]\n\n\t\t\t\t}\n\n\n\n\t\t\t]\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"name\": \"server_pools__servers\"\n\n\t\t}\n\n\t],\n\n\t\"template\": \"/Common/f5.http\",\n\n\t\"templateModified\": \"no\",\n\n\t\"templateReference\": {\n\n\t\t\"link\": \"https://localhost/mgmt/tm/sys/application/template/~Common~f5.http?ver=13.0.0\"\n\n\t},\n\n\t\"trafficGroup\": \"/Common/traffic-group-1\",\n\n\t\"trafficGroupReference\": {\n\n\t\t\"link\": \"https://localhost/mgmt/tm/cm/traffic-group/~Common~traffic-group-1?ver=13.0.0\"\n\n\t},\n\n\t\"variables\": [{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"client__http_compression\",\n\n\t\t\t\"value\": \"/#create_new#\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"monitor__monitor\",\n\n\t\t\t\"value\": \"/Common/http\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"net__client_mode\",\n\n\t\t\t\"value\": \"wan\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"net__server_mode\",\n\n\t\t\t\"value\": \"lan\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"net__v13_tcp\",\n\n\t\t\t\"value\": \"warn\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"pool__addr\",\n\n\t\t\t\"value\": \"10.1.10.100\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"pool__pool_to_use\",\n\n\t\t\t\"value\": \"/#create_new#\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"pool__port\",\n\n\t\t\t\"value\": \"80\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"ssl__mode\",\n\n\t\t\t\"value\": \"no_ssl\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"ssl_encryption_questions__advanced\",\n\n\t\t\t\"value\": \"no\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"ssl_encryption_questions__help\",\n\n\t\t\t\"value\": \"hide\"\n\n\t\t}\n\n\t]\n\n}\n"
      name:                    "simplehttp"
      partition:               "Common"
      strict_updates:          "enabled"
      template_modified:       "no"
      traffic_group:           "/Common/traffic-group-1"


	Plan: 1 to add, 0 to change, 0 to destroy.

	Do you want to perform these actions?
  	Terraform will perform the actions described above.
  	Only 'yes' will be accepted to approve.

  	Enter a value:

Continue terraform apply by typing ``yes`` followed by the enter key...

You should see the following output::

	bigip_sys_iapp.simplehttp: Creating...
  	devicegroup:             "" => "none"
  	inherited_devicegroup:   "" => "true"
  	inherited_traffic_group: "" => "true"
  	jsonfile:                "" => "{\n\n\t\"fullPath\": \"/Common/simplehttp.app/simplehttp\",\n\n\t\"generation\": 222,\n\n\t\"inheritedDevicegroup\": \"true\",\n\n\t\"inheritedTrafficGroup\": \"true\",\n\n\t\"kind\": \"tm:sys:application:service:servicestate\",\n\n\t\"name\": \"simplehttp\",\n\n\t\"partition\": \"Common\",\n\n\t\"selfLink\": \"https://localhost/mgmt/tm/sys/application/service/~Common~simplehttp.app~simplehttp?ver=13.0.0\",\n\n\t\"strictUpdates\": \"enabled\",\n\n\t\"subPath\": \"simplehttp.app\",\n\n\t\"tables\": [{\n\n\t\t\t\"name\": \"basic__snatpool_members\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"name\": \"net__snatpool_members\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"name\": \"optimizations__hosts\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"columnNames\": [\n\n\t\t\t\t\"name\"\n\n\t\t\t],\n\n\t\t\t\"name\": \"pool__hosts\",\n\n\t\t\t\"rows\": [{\n\n\t\t\t\t\"row\": [\n\n\t\t\t\t\t\"f5.cisco.com\"\n\n\t\t\t\t]\n\n\t\t\t}]\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"columnNames\": [\n\n\t\t\t\t\"addr\",\n\n\t\t\t\t\"port\",\n\n\t\t\t\t\"connection_limit\"\n\n\t\t\t],\n\n\t\t\t\"name\": \"pool__members\",\n\n\t\t\t\"rows\": [{\n\n\t\t\t\t\t\"row\": [\n\n\t\t\t\t\t\t\"10.1.20.252\",\n\n\t\t\t\t\t\t\"80\",\n\n\t\t\t\t\t\t\"0\"\n\n\t\t\t\t\t]\n\n\t\t\t\t}\n\n\n\n\t\t\t]\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"name\": \"server_pools__servers\"\n\n\t\t}\n\n\t],\n\n\t\"template\": \"/Common/f5.http\",\n\n\t\"templateModified\": \"no\",\n\n\t\"templateReference\": {\n\n\t\t\"link\": \"https://localhost/mgmt/tm/sys/application/template/~Common~f5.http?ver=13.0.0\"\n\n\t},\n\n\t\"trafficGroup\": \"/Common/traffic-group-1\",\n\n\t\"trafficGroupReference\": {\n\n\t\t\"link\": \"https://localhost/mgmt/tm/cm/traffic-group/~Common~traffic-group-1?ver=13.0.0\"\n\n\t},\n\n\t\"variables\": [{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"client__http_compression\",\n\n\t\t\t\"value\": \"/#create_new#\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"monitor__monitor\",\n\n\t\t\t\"value\": \"/Common/http\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"net__client_mode\",\n\n\t\t\t\"value\": \"wan\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"net__server_mode\",\n\n\t\t\t\"value\": \"lan\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"net__v13_tcp\",\n\n\t\t\t\"value\": \"warn\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"pool__addr\",\n\n\t\t\t\"value\": \"10.1.10.100\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"pool__pool_to_use\",\n\n\t\t\t\"value\": \"/#create_new#\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"pool__port\",\n\n\t\t\t\"value\": \"80\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"ssl__mode\",\n\n\t\t\t\"value\": \"no_ssl\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"ssl_encryption_questions__advanced\",\n\n\t\t\t\"value\": \"no\"\n\n\t\t},\n\n\t\t{\n\n\t\t\t\"encrypted\": \"no\",\n\n\t\t\t\"name\": \"ssl_encryption_questions__help\",\n\n\t\t\t\"value\": \"hide\"\n\n\t\t}\n\n\t]\n\n}\n"
  	name:                    "" => "simplehttp"
  	partition:               "" => "Common"
  	strict_updates:          "" => "enabled"
  	template_modified:       "" => "no"
  	traffic_group:           "" => "/Common/traffic-group-1"
	bigip_sys_iapp.simplehttp: Creation complete after 1s (ID: simplehttp)

	Apply complete! Resources: 1 added, 0 changed, 0 destroyed.


.. NOTE::
	 All work for this lab will be performed exclusively from the Windows
	 jumphost. No installation or interaction with your local system is
	 required.
