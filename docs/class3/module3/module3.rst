Module 3: Continuous Integration / Continuous Delivery for SecdevOps
=================================================

In this module we will practice some of the below concepts:
 - Breaking down the silos, enable dev to deploy securely with minimum friction
 - Introduce security as early on in the dev chain as possible
 - Automated security tests
 - Roles of SecOps and dev in our lab model and deploy an app to prod with WAF protection.

Initial setup
-------------
1. Access the f5-use-cases container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- From an RDP client open an RDP session to the Window Jumphost
- Open Putty from the Jumphost and connect to the ``f5-use-cases container``
- Password for root is ``default``


2. Edit the global parameters file with your personal information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- Once you have connected to the container, edit the encrypted global parameters file `/home/snops/host_volume/f5-rs-global-vars-vault.yaml` by copying and pasting:

 .. code-block:: terminal

    ansible-vault edit --vault-password-file /var/jenkins_home/.vault_pass.txt /home/snops/host_volume/f5-rs-global-vars-vault.yaml


- Once in edit mode - type ``i`` to activate INSERT mode and configure your personal information by changing the following variable: ``vault_dac_user``
  - ``vault_dac_user`` - is used as a Tenant ID to differentiate between multiple deployments in Splunk
  - ``vault_dac_email`` - is used in this environment for Slack, can be arbitrary
  - ``vault_dac_password`` - is used in this environment for Slack, can be arbitrary


  For example:

  .. code-block:: terminal

   vault_dac_user: "rosenboim"
    vault_dac_email: "rosenboim@f5.com"
    vault_dac_password: "admin"

- Press the ``ESC`` key and save the file by typing: ``:wq``

3. Run the container startup script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Run the container startup script with the following command:
- The script will download the repos again and copy files from the host volume you just populated to the relevant directories

 .. code-block:: terminal

    /snopsboot/start


.. toctree::
   :maxdepth: 1
   :glob:

   lab*
