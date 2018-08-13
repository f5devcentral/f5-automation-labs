Create Simple VS, Pool etc using BIG-IP Terraform resources
-----------------------------------------------------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

This class covers the following topics:

- Update master.tf file to include Application Objects like Virtual Server, Pool, nodes etc.

#. Update master file to include http monitoring::

			resource "bigip_ltm_monitor" "monitor" {
				name = "/Common/terraform_monitor"
				parent = "/Common/http"
				send = "GET /some/path\r\n"
				timeout = "999"
				interval = "999"
			}

#. Update master file to include Server Pool:: 

			resource "bigip_ltm_pool"  "pool" {
				name = "/Common/terraform-pool"
				load_balancing_mode = "round-robin"
				monitors = ["/Common/terraform_monitor"]
				allow_snat = "yes"
				allow_nat = "yes"
			}

#. Update master file to Attach Node or include member in Pool::

			resource "bigip_ltm_pool_attachment" "attach_node" {
				pool = "/Common/terraform-pool"
				node = "/Common/10.1.20.252:80"
				depends_on = ["bigip_ltm_pool.pool"]
			}

#. Update master file to Create a Virtual Server using Pool::

			resource "bigip_ltm_virtual_server" "http" {
				pool = "/Common/terraform-pool"
				name = "/Common/terraform_vs_http"
				destination = "10.1.10.100"
				port = 80
				source_address_translation = "automap"
				depends_on = ["bigip_ltm_pool.pool"]
			}

.. NOTE::
	 All work for this lab will be performed exclusively from the Windows
	 jumphost. No installation or interaction with your local system is
	 required.
