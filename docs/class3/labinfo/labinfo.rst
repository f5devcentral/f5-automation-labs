Lab Topology
=============

The network topology implemented for this lab is very simple. Since the focus of the lab is Control Plane programmability rather that Data Plane traffic flow we can keep the data plane fairly simple. The following components have been included in your lab environment:

-  2 x F5 BIG-IP VE (v13.1.x)
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
     - ``ubuntu/supernetops``

   * - BIG-IP A
     - 10.1.1.10
     - **Internal:** 10.1.10.10
       **Internal (Float):** 10.1.10.13
       **External:** 10.1.20.10
       **External (VIPs):** 10.1.20.120-130
     - ``admin/admin``
       ``root/default``

   * - BIG-IP B
     - 10.1.1.11
     - **Internal:** 10.1.10.11
       **Internal (Float):** 10.1.10.13
       **External:** 10.1.20.11
       **External (VIPs):** 10.1.20.120-130
     - ``admin/admin``
       ``root/default``

   * - Linux Server
     - 10.1.1.15
     - **Internal:** 10.1.10.100-103
     - ``root/default``


.. toctree::
   :maxdepth: 2
   :glob:

   labinfo/postman
   module*/module*
