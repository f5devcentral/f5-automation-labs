Lab Topology
=============

The network topology implemented for this lab is very simple. Since the focus of the lab is Control Plane programmability rather that Data Plane traffic flow we can keep the data plane fairly simple. The following components have been included in your lab environment:

-  1 x F5 BIG-IP (v13.0)

-  1 x Linux webserver (Ubuntu 16.04)

-  1 x Windows 7 jump box

The following table lists VLANS, IP Addresses and Credentials for all components:

.. list-table::
    :widths: 20 40 40
    :header-rows: 1
    :stub-columns: 1

    * - **Component**
      - **VLAN/IP Address(es)**
      - **Credentials**
    * - Windows Jump Box
      - - **Management:** 10.1.1.250
        - **External:** 10.1.10.250
      - external_user/*available in instance details*
    * - BIG-IP
      - - **Management:** 10.1.1.5
        - **External:** 10.1.10.5
        - **Internal:** 10.1.20.5
      - admin/admin
    * - Linux Server
      - - **Management:** 10.1.1.10
        - **Internal:** 10.1.20.10
      - ubuntu/ubuntu
