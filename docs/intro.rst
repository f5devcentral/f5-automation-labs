Getting Started
---------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

.. NOTE::
	All work for this lab will be performed exclusively from the windows
	jumphost. No installation or interaction with your local system is
	required.

Lab Topology
------------

The network topology implemented for this lab is very simple. Since the
focus of the lab is Control Plane programmability rather that Data Plane
traffic flow we can keep the data plane fairly simple. The following
components have been included in your lab environment:

-  2 x F5 BIG-IP VE (v12.1)

-  1 x F5 iWorkflow VE (v2.0.2)

-  1 x Linux Webserver

-  1 x Windows Jumphost

The following table lists VLANS, IP Addresses and Credentials for all
components:

+--------------------+----------------------------+-------------------+
| **Component**      | **VLAN: IP Address(es)**   | **Credentials**   |
+====================+============================+===================+
| Windows Jumphost   | MGMT: 10.1.1.3             | user/user         |
|                    |                            |                   |
|                    | Internal: 10.1.10.250      |                   |
|                    |                            |                   |
|                    | External: 10.1.20.250      |                   |
+--------------------+----------------------------+-------------------+
| BIG IP A           | MGMT: 10.1.1.4             | root/default      |
|                    |                            |                   |
|                    | Internal: 10.1.10.1        | admin/admin       |
|                    |                            |                   |
|                    | External: 10.1.20.1        |                   |
+--------------------+----------------------------+-------------------+
| BIG-IP B           | MGMT: 10.1.1.5             | root/default      |
|                    |                            |                   |
|                    | Internal: 10.1.10.2        | admin/admin       |
|                    |                            |                   |
|                    | External: 10.1.20.2        |                   |
+--------------------+----------------------------+-------------------+
| iWorkflow          | MGMT: 10.1.1.6             | root/default      |
|                    |                            |                   |
|                    |                            | admin/admin       |
+--------------------+----------------------------+-------------------+
| Linux Webserver    | MGMT: 10.1.1.7             | root/default      |
|                    |                            |                   |
|                    | Internal: 10.1.10.10-13    |                   |
+--------------------+----------------------------+-------------------+
