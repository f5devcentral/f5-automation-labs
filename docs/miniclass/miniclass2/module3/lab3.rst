Remove Pool  Configuration
------------------------------------


Please follow the instructions provided by the instructor to start your
lab and access your jump host.

#. Remove Pool configuration::

        terraform destroy -target=bigip_ltm_pool.pool

You should see the following output::

	bigip_ltm_pool.pool: Refreshing state... (ID: /Common/terraform-pool)

	An execution plan has been generated and is shown below.
	Resource actions are indicated with the following symbols:
  	- destroy

	Terraform will perform the following actions:

  	- bigip_ltm_pool.pool


	Plan: 0 to add, 0 to change, 1 to destroy.

	Do you really want to destroy?
  	Terraform will destroy all your managed infrastructure, as shown above.
  	There is no undo. Only 'yes' will be accepted to confirm.

  	Enter a value:

Continue terraform destroy by typing ``yes`` followed by the enter key...

You should see the following output::

	bigip_ltm_pool.pool: Destroying... (ID: /Common/terraform-pool)
	bigip_ltm_pool.pool: Destruction complete after 0s

	Destroy complete! Resources: 1 destroyed.

.. NOTE::
	 All work for this lab will be performed exclusively from the Windows
	 jumphost. No installation or interaction with your local system is
	 required.
