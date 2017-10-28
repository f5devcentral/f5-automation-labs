Lab 1.4: Basic Network Connectivity
-----------------------------------

.. graphviz::

   digraph breadcrumb {
      rankdir="LR"
      ranksep=.4
      node [fontsize=10,style="rounded,filled",shape=box,color=gray72,margin="0.05,0.05",height=0.1]
      fontname = "arial-bold"
      fontsize = 10
      labeljust="l"
      subgraph cluster_provider {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "BIG-IP"
         basics [label="REST Basics",color="palegreen"]
         authentication [label="Authentication",color="palegreen"]
         globalsettings [label="Global Settings",color="palegreen"]
         networking [label="Networking",color="steelblue1"]
         clustering [label="Clustering"]
         transactions [label="Transactions"]
         basics -> authentication -> globalsettings -> networking -> clustering -> transactions
      }
   }

This lab will focus on configuration of the following items:

-  L1-3 Networking

   -  Physical Interface Settings

   -  L2 Connectivity (**VLAN**, VXLAN, etc.)

   -  L3 Connectivity (**Self IPs, Routing**, etc.)

We will specifically cover the items in **BOLD** above in the following
labs. It should be noted that many permutations of the Device Onboarding
process exist due to the nature of different organizations. This class is
designed to teach enough information so that you can then apply the
knowledge learned and help articulate and/or deliver a specific solution
for your environment.

The following table and diagram lists the L2-3 network information used to
configure connectivity for BIG-IP A:

.. list-table::
   :stub-columns: 1
   :header-rows: 1

   * - **Type**
     - **Name**
     - **Details**
   * - VLAN
     - Internal
     - **Interface**: 1.1

       **Tag:** 10
   * - VLAN
     - External
     - **Interface**: 1.2

       **Tag:** 20
   * - Self IP
     - Self-Internal
     - **Address**: 10.1.10.10/24

       **VLAN:** Internal
   * - Self IP
     - Self-External
     - **Address**: 10.1.20.10/24

       **VLAN:** External
   * - Route
     - Default
     - **Network:** 0.0.0.0/0

       **GW:** 10.1.20.1

|labtopology|

Task 1 - Create VLANs
~~~~~~~~~~~~~~~~~~~~~

.. NOTE::
   This lab shows how to configure VLAN tags, but does not deploy tagged
   interfaces.  To use tagged interfaces the ``tagged`` attribute needs
   to have the value ``true``

Perform the following steps to configure the VLAN objects/resources:

#. Expand the ``Lab 1.4 - Basic Network Connectivity`` folder in the
   Postman collection.

#. Click the ``Step 1: Create a VLAN`` request in the folder. Click
   :guilabel:`Body` and examine the JSON request body; the values for
   creating the Internal VLAN have already been populated.

#. Click the :guilabel:`Send` button to create the VLAN

#. **Repeat Step 1**, however, this time modify the JSON body to create the
   External VLAN using the parameters shown in the table above. In order to do
   so you can replace the following:

   - ``name``: ``Internal`` --> ``External``
   - ``tag``: ``10`` --> ``20``
   - ``interfaces[] --> name``: ``1.1`` --> ``1.2``

   |image111|

#. Click the ``Step 2: Get VLANs`` request in the folder. Click the
   :guilabel:`Send` button to ``GET`` the VLAN collection. Examine the response
   to make sure both VLANs have been created.

Task 2 - Create Self IPs
~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to configure the Self IP objects/resources:

#. Click the ``Step 3: Create Internal Self IP`` request in the folder. Click
   :guilabel:`Body` and examine the JSON body; the values for creating the
   Self-Internal Self IP have already been populated.

   .. NOTE:: The JSON body sets the VLAN to ``/Common/External`` on purpose.
      You will modify this value in the steps below.  Please do not change the
      value.

#. Click the :guilabel:`Send` button to create the Self IP.

#. Click the ``Step 4: Create External Self IP`` request in the folder and
   click :guilabel:`Send`

#. Click the ``Step 5: Get Self-Internal Self IP Attributes`` request in the
   folder and click the :guilabel:`Send` button.  Examine the VLAN settings
   of the Resource.  As noted above the Self IP has been assigned to the **wrong**
   VLAN (intentionally).

   .. NOTE:: Postman has the ability to check the responses for specific values
      to verify if the result of a request is what it is expected to be. The
      :guilabel:`Test Results` for this request will show a failure for the
      ``[Check Value] vlan == /Common/Internal`` value.  This is intentional
      and you should continue to the next section.

   |image92|

Task 3 - Modify Existing Self IP Resource
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In order to modify an existing object via the REST API, the URI path has to
be changed.  In the previous examples we used a ``POST`` to create Resources under
a Collection, therefore, the URI used was that of the Collection itself.
If you wish to update/modify a Resource you must refer to the Resource
directly.

For example, the Collection URI for Self IPs is  ``/mgmt/tm/net/self``.

The Resource URI for the ``Self-Internal`` Self IP is
``/mgmt/tm/net/self/~Common~Self-Internal``.  Notice that the BIG-IP
partition and object name has been added to the Collection URI to for the
Resource URI.

#. On the open ``Step 5: Get Self-Internal Self IP Attributes`` request
   change the request method from ``GET`` to ``PATCH``.  The ``PATCH`` method
   is used to modify the attributes of an existing Resource.

   |image96|

#. Copy ``(Ctrl+c)`` the entire JSON **RESPONSE** from the previous ``GET``
   request.

   |image93|

#. Paste ``(Ctrl+v)`` the text into JSON Request body:

   .. NOTE:: Be sure to highlight any existing text and replace it while
      pasting.

   |image94|

#. In the JSON body change the ``vlan`` attribute to ``/Common/Internal``
   and click ``Send``:

   |image95|

#. Click the ``Step 6: Get Self IPs`` item in the collection. Click the
   ``Send`` button to GET the Self IP collection. Examine the response to
   make sure both Self IPs have been created and associated with the
   appropriate vlan.

Task 4 - Create Routes
~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to configure the Route object/resource:

#. Before creating the route, we double check the content of the routing table.
   Click the ``Step 7: Get Routes`` item in the collection. Click the
   ``Send`` button to ``GET`` the routes collection. Examine the response to
   make sure there is no route.

#. Click the ``Step 8: Create a Route`` item in the collection. Click
   :guilabel:`Body` and examine the JSON body; the values for creating the
   default route have already been populated.

#. Click the ``Send`` button to create the route.

#. Click the ``Step 9: Get Routes`` item in the collection again. Click the
   ``Send`` button to ``GET`` the routes collection. Examine the response to
   make sure the route has been created.

.. |image92| image:: /_static/class1/image092.png
.. |image93| image:: /_static/class1/image093.png
.. |image94| image:: /_static/class1/image094.png
.. |image95| image:: /_static/class1/image095.png
.. |image96| image:: /_static/class1/image096.png
.. |image111| image:: /_static/class1/image111.png
.. |labtopology| image:: /_static/class1/labtopology.png
   :scale: 65%
