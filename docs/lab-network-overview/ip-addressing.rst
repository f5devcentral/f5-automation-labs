IP Addressing Objectives
=========================

Each student will have access to a Windows 7 “jumpbox”.  Information required to gain RDP access to the jumpbox will be provided in each session.

Each student will have a BIG-IP VE environment with IP addressing as below:

.. TODO:: Finalize IP addressing scheme

Lab Topology
------------

The network topology implemented for this lab is very simple. Since the focus of the lab is Control Plane programmability rather that Data Plane traffic flow we can keep the data plane fairly simple. The following components have been included in your lab environment:

-  1 x F5 BIG-IP VE (v13.0)

-  1 x Linux LAMP Webserver (ubuntu 16.04)

-  1 x Windows 7 Jumphost

The following table lists VLANS, IP Addresses and Credentials for all components:

.. list-table::
    :widths: 20 40 40
    :header-rows: 1
    :stub-columns: 1

    * - **Component**
      - **VLAN/IP Address(es)**
      - **Credentials**
    * - Windows Jumphost
      - - **Management:** 10.1.1.250
        - **External:** 10.1.10.250
        - **Internal:** 10.1.20.250
      - Administrator/*available in instance details*
    * - BIG-IP A
      - - **Management:** 10.1.1.5
        - **External:** 10.1.10.5
        - **Internal:** 10.1.20.5
      - admin/admin
    * - Linux Server
      - - **Management:** 10.1.1.10
        - **External:** 10.1.10.10
        - **Internal:** 10.1.20.10
      - root/default
