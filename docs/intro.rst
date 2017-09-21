Welcome
-------

Welcome to F5's Automation, Orchestration and Programmability Training series.
The intended audience for these labs are Super NetOps and DevOps engineers that
would like to leverage the various programmability tools offered by the F5
platform.  If you require a pre-built lab environment please contact your F5
account team and they can provide access to environments on an as-needed basis.

The content contained here leverages a full DevOps CI/CD pipeline and is
sourced from the following GitHub repository:

https://github.com/f5devcentral/f5-automation-labs/

Bugs and Requests for enhancements can be made using by opening an
`Issue <https://github.com/f5devcentral/f5-automation-labs/issues>`_ within
the repository.

Getting Started
---------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

.. NOTE::
	All work for this lab will be performed exclusively from the Windows
	jumphost. No installation or interaction with your local system is
	required.

Lab Environments
----------------

In order to complete this series of training classes you will need to utilize
a specific **Lab Environment**.  You can consume this training in a couple of
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
~~~~~~~~~~~~~~~~~

Please follow the instructions provided by your lab instructor to access your
lab environment.

Amazon AWS CloudFormation Template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. WARNING:: The AWS CFT will run in your account.  The template includes
   components and instances that will incur a charge.  This charge will be
   billed to your account.

Click the link below to start a pre-built lab environment using a CloudFormation
template in Amazon AWS:

 :ref:`amazon-aws-lab-environment-guide`

.. _lab-topology:

Lab Topology
------------

The network topology implemented for this lab is very simple. Since the
focus of the lab is Control Plane programmability rather that Data Plane
traffic flow we can keep the data plane fairly simple. The following
components have been included in your lab environment:

-  2 x F5 BIG-IP VE (v12.1)

-  1 x F5 iWorkflow VE (v2.1)

-  1 x Linux LAMP Webserver (xubuntu 14.04)

-  1 x Linux Docker Server (CentOS 7)

-  1 x Windows Jumphost

The following table lists VLANS, IP Addresses and Credentials for all
components:

.. list-table::
    :widths: 20 40 40
    :header-rows: 1
    :stub-columns: 1

    * - **Component**
      - **VLAN/IP Address(es)**
      - **Credentials**
    * - Windows Jumphost
      - - **Management:** 10.1.1.250
        - **Internal:** 10.1.10.250
        - **External:** 10.1.20.250
      	- Credentials user/user
    * - BIG-IP A
      - - **Management:** 10.1.1.4
        - **Internal:** 10.1.10.1
        - **Internal (Float):** 10.1.10.3
        - **External:** 10.1.20.1
      - admin/admin
    * - BIG-IP B
      - - **Management:** 10.1.1.5
        - **Internal:** 10.1.10.2
        - **Internal (Float):** 10.1.10.3
        - **External:** 10.1.20.2
      - admin/admin
    * - iWorkflow
      - - **Management:** 10.1.1.6
      - admin/admin
    * - Linux Server
      - - **Management:** 10.1.1.7
        - **Internal:** 10.1.10.10-13
      - root/default
    * - Docker Server
      - - **Management:** 10.1.1.8
      - root/default
