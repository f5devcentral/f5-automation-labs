Getting Started
---------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

.. NOTE::
	All work for this lab will be performed exclusively from the Windows
	jumphost. No installation or interaction with your local system is
	required.

Lab Topology
------------

The network topology implemented for this lab is very simple. Since the
focus of the lab is Control Plane programmability rather that Data Plane
traffic flow we can keep the data plane fairly simple. The following
components have been included in your lab environment:

-  2 x F5 BIG-IP VE (v12.1)

-  1 x F5 iWorkflow VE (v2.1)

-  1 x Linux Webserver

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
      - Administrator/*available in instance details*
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
    * - Linux/Docker Server
      - - **Management:** 10.1.1.7
        - **Internal:** 10.1.10.10-13
      - root/default
