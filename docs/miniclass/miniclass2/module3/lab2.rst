Remove Pool attachement  Configuration
--------------------------------------


Please follow the instructions provided by the instructor to start your
lab and access your jump host.

#. Remove Pool attachment configuration::

        terraform destroy -target=bigip_ltm_pool_attachment.attach_node

You should see the following output::

	bigip_ltm_pool.pool: Refreshing state... (ID: /Common/terraform-pool)
	bigip_ltm_pool_attachment.attach_node: Refreshing state... (ID: /Common/terraform-pool-/Common/10.1.20.252:80)

	An execution plan has been generated and is shown below.
	Resource actions are indicated with the following symbols:
  	- destroy

	Terraform will perform the following actions:

  	- bigip_ltm_pool_attachment.attach_node


	Plan: 0 to add, 0 to change, 1 to destroy.

	Do you really want to destroy?
  	Terraform will destroy all your managed infrastructure, as shown above.
  	There is no undo. Only 'yes' will be accepted to confirm.

  	Enter a value:

Continue terraform destroy by typing ``yes`` followed by the enter key...

You should see the following output::

	bigip_ltm_pool_attachment.attach_node: Destroying... (ID: /Common/terraform-pool-/Common/10.1.20.252:80)
	bigip_ltm_pool_attachment.attach_node: Destruction complete after 0s

	Destroy complete! Resources: 1 destroyed.
 



.. NOTE::
	 All work for this lab will be performed exclusively from the Windows
	 jumphost. No installation or interaction with your local system is
	 required.
