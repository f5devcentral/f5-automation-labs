Modify the master.tf file to include iApp resource
--------------------------------------------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

#. Using a text editor, modify the **master.tf** file to configure the iApp resource to use simple http JSON file::

	resource "bigip_sys_iapp" "simplehttp" {
		name = "simplehttp"
		jsonfile = "${file("simplehttp.json")}"
	}


.. NOTE::
	 All work for this lab will be performed exclusively from the Windows
	 jumphost. No installation or interaction with your local system is
	 required.
