Lab Environments & Topology
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. NOTE:: All work for this lab will be performed exclusively from the Linux
   jumphost. No installation or interaction with your local system is
   required.

In order to complete this class you will need to utilize a specific 
**Lab Environment**.  You can consume this training in a couple of
ways:

- Pre-built Environment using an Ravello Blueprint

  - Used at official F5 events such as F5 Agility, F5 Agility Roadshows,
    User Groups, MeetUps, etc.

  - Access can be provided by your F5 Account Team

- Pre-built Environment using an Amazon AWS CloudFormation Template (CFT)

  - Access is on-demand and uses *your* AWS account

- Self-built Environment on your own infrastructure

  - Review the Topology below for details

All pre-built environments implement the :ref:`lab-topology` shown below.

Ravello Blueprint
^^^^^^^^^^^^^^^^^

Please follow the instructions provided by your lab instructor to access your
lab environment.

Amazon AWS CloudFormation Template
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. WARNING:: The AWS CFT will run in your account.  The template includes
   components and instances that will incur a charge.  This charge will be
   billed to your account.

Click the link below to start a pre-built lab environment using a CloudFormation
template in Amazon AWS:

.. TODO:: Complete AWS CFT instructions

:ref:`amazon-aws-lab-environment-guide`

.. _lab-topology:

Lab Topology
^^^^^^^^^^^^

The network topology implemented for this lab is very simple. Since the
focus of the lab is Control Plane programmability rather that Data Plane
traffic flow we can keep the data plane fairly simple. The following
components have been included in your lab environment:

-  2 x F5 BIG-IP VE (v12.1.x)

-  1 x F5 iWorkflow VE (v2.3)

-  1 x Linux Webserver

-  1 x Linux Jumphost

.. TODO:: Add logical diagram of topology

The following table lists VLANS, IP Addresses and Credentials for all
components:

.. list-table::
    :widths: 15 30 30 30
    :header-rows: 1
    :stub-columns: 1

    * - **Component**
      - **Management IP**
      - **VLAN/IP Address(es)**
      - **Credentials**
    * - Linux Jumphost
      - 10.1.1.20
      - **Internal:** 10.1.10.20

        **External:** 10.1.20.20
      - ubuntu/supernetops
    * - BIG-IP A
      - 10.1.1.10
      - **Internal:** 10.1.10.10
        
        **Internal (Float):** 10.1.10.13
        
        **External:** 10.1.20.10
      - admin/admin

        root/default
    * - BIG-IP B
      - 10.1.1.11
      - **Internal:** 10.1.10.11
        
        **Internal (Float):** 10.1.10.13
        
        **External:** 10.1.20.11
      - admin/admin

        root/default
    * - iWorkflow
      - 10.1.1.12
      - N/A
      - admin/admin

        root/default
    * - Linux Server
      - 10.1.1.15
      - **Internal:** 10.1.10.100-103
      - root/default
