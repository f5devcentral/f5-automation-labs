Lab Information
===============

.. Warning:: All work for this lab will be performed exclusively from the Jumphost.  No installation or interaction with your local system is required.

Lab Topology
------------

The network topology implemented for this lab is very simple.
Since the focus of the lab is Control Plane programmability
rather that Data Plane traffic flow we can keep the data plane fairly simple.
The following components have been included in your lab environment:

-  2 x BIG-IPs (v13.1.x)
-  1 x Linux Tool Box
-  1 x Windows Jumphost

.. nwdiag:: labtopology.diag
   :width: 800
   :name: lab-topology-diagram
   :scale: 110%

Network Addressing
------------------

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

   * - Windows Jumphost
     - 10.1.1.250
     - **Internal:** 10.1.10.250
     - ``external_user/password``

   * - BIG-IP DEV
     - 10.1.1.5
     - **Internal:** 10.1.10.5
       **External:** 10.1.20.5
     - ``admin/admin``
       ``root/default``

   * - BIG-IP PROD
     - 10.1.1.15
     - **Internal:** 10.1.10.15
       **External:** 10.1.20.15
     - ``admin/admin``
       ``root/default``

   * - Linux Tool Box
     - 10.1.1.10
     - **Internal:** 10.1.20.10
     - ``ubuntu/ubuntu``


.. toctree::
   :maxdepth: 2
   :glob:

