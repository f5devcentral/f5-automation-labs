.. |labmodule| replace:: 1
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Basic Network Connectivity
--------------------------------------------------------

This lab will focus on configuration of the following items:

-  L1-3 Networking

   -  Physical Interface Settings

   -  L2 Connectivity (**VLAN**, VXLAN, etc.)

   -  L3 Connectivity (**Self IPs, Routing**, etc.)

We will specifically cover the items in **BOLD** above in the following
labs. It should be noted that many permutations of the Device Onboarding
process exist due to the nature of customer environments. This class is
designed to teach enough information so that you can then apply the
knowledge learned and help articulate and/or deliver a specific solution
to your customer.

The following table lists the L2-3 network information used to configure
connectivity for BIG-IP-A:

+-----------+-----------------+-------------------------+
| Type      | Name            | Details                 |
+===========+=================+=========================+
| VLAN      | Internal        | Interface: 1.1          |
|           |                 |                         |
|           |                 | Tag: 10                 |
+-----------+-----------------+-------------------------+
| VLAN      | External        | Interface: 1.2          |
|           |                 |                         |
|           |                 | Tag: 20                 |
+-----------+-----------------+-------------------------+
| Self IP   | Self-Internal   | Address: 10.1.10.1/24   |
|           |                 |                         |
|           |                 | VLAN: Internal          |
+-----------+-----------------+-------------------------+
| Self IP   | Self-External   | Address: 10.1.20.1/24   |
|           |                 |                         |
|           |                 | VLAN: External          |
+-----------+-----------------+-------------------------+
| Route     | Default         | Network: 0.0.0.0/0      |
|           |                 |                         |
|           |                 | GW: 10.1.20.254         |
+-----------+-----------------+-------------------------+

Task 1 – Create VLANs
~~~~~~~~~~~~~~~~~~~~~

.. NOTE::
   This lab shows how to configure VLAN tags, but does not deploy tagged
   interfaces.  To use tagged interfaces the ``tagged`` attribute needs
   to have the value ``true``

Perform the following steps to configure the VLAN objects/resources:

#. Expand the “Lab 1.4 – Basic Network Connectivity” folder in the
   Postman collection.

#. Click the “Step 1: Create a VLAN” item in the collection. Examine the
   JSON body; the values for creating the Internal VLAN have already
   been populated.

#. Click the ‘Send’ button to create the VLAN

#. Repeat Step 1, however, this time modify the JSON body to create the
   External VLAN using the parameters in the table above.

#. Click the “Step 2: Get VLANs” item in the collection. Click the
   ‘Send’ button to GET the VLAN collection. Examine the response to
   make sure both VLANs have been created.

Task 2 – Create Self IPs
~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to configure the Self IP objects/resources:

#. Click the “Step 3: Create a Self IP” item in the collection. Examine
   the JSON body; the values for creating the Self-Internal Self IP have
   already been populated.

#. Click the ‘Send’ button to create the Self IP

#. Repeat Step 1, however, this time modify the JSON body to create the
   Self-External Self IP using the parameters in the table above.

#. Click the “Step 4: Get Self IPs” item in the collection. Click the
   ‘Send’ button to GET the Self IP collection. Examine the response to
   make sure both Self IPs have been created.

Task 3 – Create Routes
~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to configure the Route object/resource:

#. Click the “Step 5: Create a Route” item in the collection. Examine
   the JSON body; the values for creating the Default Route have already
   been populated.

#. Click the ‘Send’ button to create the Route

#. Click the “Step 6: Get Routes” item in the collection. Click the
   ‘Send’ button to GET the routes collection. Examine the response to
   make sure the route has been created.
