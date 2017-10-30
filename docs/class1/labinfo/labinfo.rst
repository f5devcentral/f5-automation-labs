Lab Topology & Environments
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. WARNING:: All work for this lab will be performed exclusively from the Linux
   Jumphost. No installation or interaction with your local system is
   required.

All pre-built environments implement the Lab Topology shown below.  Please
review the topology first, then find the section matching the lab environment
you are using for connection instructions.

.. _lab-topology:

Lab Topology
------------

The network topology implemented for this lab is very simple. Since the
focus of the lab is Control Plane programmability rather than Data Plane
traffic flow we can keep the data plane fairly simple. The following
components have been included in your lab environment:

-  2 x F5 BIG-IP VE (v12.1.x)
-  1 x F5 iWorkflow VE (v2.3)
-  1 x Linux Server
-  1 x Linux Jumphost

.. nwdiag:: labtopology.diag
   :width: 800
   :caption: Lab Topology
   :name: lab-topology-diagram
   :scale: 110%

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

       **External (VIPs):** 10.1.20.120-130

     - admin/admin

       root/default
   * - BIG-IP B
     - 10.1.1.11
     - **Internal:** 10.1.10.11

       **Internal (Float):** 10.1.10.13

       **External:** 10.1.20.11

       **External (VIPs):** 10.1.20.120-130

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

Lab Environments
----------------

In order to complete this class you will need to utilize a specific
**Lab Environment**.  You can consume this training in a couple of
ways:

- Pre-built Environment using a Ravello Blueprint

  - Used at official F5 events such as F5 Agility, F5 Agility Roadshows,
    User Groups, MeetUps, etc.

  - Access can be provided by your F5 Account Team

- Pre-built Environment using an Amazon AWS CloudFormation Template (CFT)

  - Access is on-demand and uses *your* AWS account

- Pre-built Environment using the F5 Unified Demo Framework (UDF)

  - This environment is currently available for F5 employees only

- Self-built Environment on your own infrastructure

  - Review the Topology and Guide below for prerequisites

Select the Environment from the list below to get started:

.. toctree::
   :maxdepth: 1
   :glob:

   aws
   ravello
   udf
   self_built

