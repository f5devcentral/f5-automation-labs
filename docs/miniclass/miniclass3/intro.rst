Getting Started
---------------
Please follow the instructions provided by the instructor to start your
lab and access your jump host.

.. NOTE::
  All work for this lab will be performed exclusively from the Linux
  jumphost. No installation or interaction with your local system is
  required.

Use Blueprint *"Puppet_lab_Agility2018-bp-FINAL"*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Lab Topology
~~~~~~~~~~~~

The following components have been included in your lab environment:

- 1 x Jumphost
- 1 x F5 BIG-IP VE (v13.1.0.3)
- 1 x Puppet Master (ubuntu 14.04)
- 1 x Linux LAMP Webserver (xubuntu 14.04)


Lab Components
^^^^^^^^^^^^^^

.. list-table::
    :widths: 20 40 40
    :header-rows: 1

    * - **Component**
      - **VLAN/IP Address(es)**
      - **Credentials**
    * - Jump Box RDP
      - - **Management:** 10.1.1.10
        - **External:** 10.1.10.51
      - ``f5student``/``f5DEMOs4u``
    * - BIG-IP Access 
      - - **Management:** https://10.1.1.246
        - **External:** 10.1.10.246
        - **Internal:** 10.1.20.246
      - ``admin``/``admin``
    * - Puppet Master 
      - - **Management:** 10.1.1.101
      - ``scs``/``cisco123``
    * - Linux LAMP Webserver
      - - **Management:** 10.1.1.252
        - **Internal:** 10.1.10.252
        - **External:** 10.1.20.252
      - ``root``/``default``




