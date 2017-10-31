.. _lab-self-built:

Self-Built Environment
----------------------

.. NOTE:: Due to the variability of self-built environments we cannot guarantee
   that you will be able to complete the class successfully.

If you are building your own lab environment please complete the following
steps and pre-requisites first:

#. Your network configuration matches the topology in the :ref:`lab-topology`

#. Ensure your BIG-IP devices are licensed and have the following modules
   provisioned:

   - LTM
   - ASM

#. Your server instance can be built two ways:

   #. Build or reuse your own instance.  If should have the following services
      installed and running:

      - HTTP Server - TCP/80
      - DNS Server - UDP/53

   #. Use our server image build script located at the url below to configure
      an Ubuntu 16.04 base installation automatically.

      .. NOTE:: Please ensure that HTTP & DNS services are not installed on the
         base image

	   :raw_github_url:`/lab_environments/AWS/snops_server_setup.sh`

#. Your host should have the following applications installed:

   - Postman v5.3.0 - https://getpostman.com
   - Google Chrome - https://google.com/chrome

#. You will need to install the ``f5-postman-workflows`` framework into
   Postman:

   #. Open Postman

   #. Click the 'Import' button

   #. Select 'Import from Link'

   #. Enter ``https://raw.githubusercontent.com/0xHiteshPatel/f5-postman-workflows/master/F5_Postman_Workflows.postman_collection.json``
      in the field

   #. Click the 'Import' button

   #. Navigate to your Postman Collections

   #. Expand the 'F5_Postman_Workflows' collection

   #. Expand the 'Install' folder

   #. Click the 'Install/Upgrade f5-postman-workflows' items

   #. Click the 'Send' button

   #. Verify the installation was successful by:

      #. Examine the response tests and ensure the 'Install Successful' test passed

      #. Examine your Postman Global Environment and look for a _f5_workflow_functions item populated with JavaScript code

#. Select how you would like to continue:

   - Review: :ref:`bigipbasics`
   - Start: :ref:`module1`
