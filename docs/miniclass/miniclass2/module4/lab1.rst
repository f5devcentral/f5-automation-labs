Create JSON Payload for HTTP
----------------------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

#. Change the directory to where the JSON file will be created::

        cd $GOPATH/src/github.com/f5devcentral/terraform-provider-bigip/

#. Remove existing **simplehttp.json** file and create new one:: 

        rm simplehttp.json
        nano simplehttp.json

#. Add the following content to the **simplehttp.json** file::
   

	{
		"fullPath": "/Common/simplehttp.app/simplehttp",
		"generation": 222,
		"inheritedDevicegroup": "true",
		"inheritedTrafficGroup": "true",
		"kind": "tm:sys:application:service:servicestate",
		"name": "simplehttp",
		"partition": "Common",
		"selfLink": "https://localhost/mgmt/tm/sys/application/service/~Common~simplehttp.app~simplehttp?ver=13.0.0",
		"strictUpdates": "enabled",
		"subPath": "simplehttp.app",
		"tables": [
			{
				"name": "basic__snatpool_members"
			},
			{
				"name": "net__snatpool_members"
			},
			{
				"name": "optimizations__hosts"
			},
			{
				"columnNames": [
					"name"
				],
				"name": "pool__hosts",
				"rows": [
					{
						"row": [
							"f5.cisco.com"
						]
					}
				]
			},
			{
				"columnNames": [
					"addr",
					"port",
					"connection_limit"
				],
				"name": "pool__members",
				"rows": [
					{
						"row": [
							"10.1.20.252",
							"80",
							"0"
						]
					}
				]
			},
			{
				"name": "server_pools__servers"
			}
		],
		"template": "/Common/f5.http",
		"templateModified": "no",
		"templateReference": {
			"link": "https://localhost/mgmt/tm/sys/application/template/~Common~f5.http?ver=13.0.0"
		},
		"trafficGroup": "/Common/traffic-group-1",
		"trafficGroupReference": {
			"link": "https://localhost/mgmt/tm/cm/traffic-group/~Common~traffic-group-1?ver=13.0.0"
		},
		"variables": [
			{
				"encrypted": "no",
				"name": "client__http_compression",
				"value": "/#create_new#"
			},
			{
				"encrypted": "no",
				"name": "monitor__monitor",
				"value": "/Common/http"
			},
			{
				"encrypted": "no",
				"name": "net__client_mode",
				"value": "wan"
			},
			{
				"encrypted": "no",
				"name": "net__server_mode",
				"value": "lan"
			},
			{
				"encrypted": "no",
				"name": "net__v13_tcp",
				"value": "warn"
			},
			{
				"encrypted": "no",
				"name": "pool__addr",
				"value": "10.1.10.100"
			},
			{
				"encrypted": "no",
				"name": "pool__pool_to_use",
				"value": "/#create_new#"
			},
			{
				"encrypted": "no",
				"name": "pool__port",
				"value": "80"
			},
			{
				"encrypted": "no",
				"name": "ssl__mode",
				"value": "no_ssl"
			},
			{
				"encrypted": "no",
				"name": "ssl_encryption_questions__advanced",
				"value": "no"
			},
			{
				"encrypted": "no",
				"name": "ssl_encryption_questions__help",
				"value": "hide"
			}
		]
	}



.. NOTE::
	 All work for this lab will be performed exclusively from the Windows
	 jumphost. No installation or interaction with your local system is
	 required.
