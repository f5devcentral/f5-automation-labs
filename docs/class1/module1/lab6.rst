Lab 1.6: Build a BIG-IP Cluster using a Collection
--------------------------------------------------

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
         networking [label="Networking",color="palegreen"]
         clustering [label="Clustering",color="steelblue1"]
         transactions [label="Transactions"]
         basics -> authentication -> globalsettings -> networking -> clustering -> transactions
      }
   }

In this lab, we will build an active-standby cluster between BIG-IP-A and
BIG-IP-B using REST API. As mentioned previously, to save time, BIG-IP-B is
already licensed and has its device-level settings configured. This lab will
use the Postman Runner functionality introduced in the previous lab.
We will run the requests in a Collection Folder to build the cluster.
If you examine the ``Lab 1.6 - Build a Cluster`` folder in the Collection you
can see how complex **Imperative** processes can become.
Clustering is one of the *transition* points for most customers to move into the
**Declarative** model (if not already done) due to the need to abstract
device/vendor level specifics from Automation consumers.

The high-level procedure required to create the cluster is:

#. Obtain Authentication Tokens for BIG-IP A & B

#. Check that both devices are licensed and ready to configure

#. Configure Device Level settings on both devices

#. Configure Networking on BIG-IP-B (remember this was already done in Lab 1.4
   for BIG-IP-A)

#. Set BIG-IP-A & BIG-IP-B CMI Parameters (Config Sync IP, Failover
   IPs, Mirroring IP)

#. Add BIG-IP-B as a trusted peer on BIG-IP-A

#. Check the status of the Sync Groups

#. Create a sync-failover Device Group

#. Check the status of the created Device Group

#. Perform initial sync of the Device Group

#. Check status (again)

#. Change the Traffic Group to use HA Order failover

#. Create Floating Self IPs

#. Failover the Traffic Group to make BIG-IP-A the Active device

Task 1 - Build a Cluster using Runner
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will use the :guilabel:`Runner` to execute a series of
requests contained in the ``Lab 1.6 - Build a Cluster`` folder.  As mentioned
previously this folder contains a large number of REST requests required to
build an Active/Standby cluster.  Additionally, we will make use of a JavaScript
framework called ``f5-postman-workflows`` that extends the Postman client to
include common test and polling functions.

Perform the following steps to build the cluster:

#. Click the :guilabel:`Runner` button at the top right of your Postman window:

   |image97|

#. Select the ``F5 Programmability: Class 1`` Collection then the
   ``Lab 1.6 - Build a Cluster`` folder.  Next, be sure the
   environment is set to ``F5 Programmability: Class 1``:

   |image28|

   Your Runner window should look like:

   |image29|

#. Click the :guilabel:`Run Lab 1.6 - Buil...` button

#. The results window will now populate.  You will see each request in the
   folder is sent and its associated test results are displayed on the screen.
   Building the cluster can take a few minutes.  You can follow the progress
   by scrolling down the results window.

#. Once the :guilabel:`Run Summary` button appears, the folder has completed
   running.  You should have 0 failures and the last item in the request
   list should be named ``Cleanup Environment``

   |image30|

#. At this point you can log into BIG-IP-A using Chrome at ``https://10.1.1.10``.
   Verify that the cluster was built by navigating to :menuselection:`Device Management --> Overview` 
   using the menu in the  BIG-IP GUI. Verify that the
   cluster and failover status indicators are all Green.

   |image31|


.. |image28| image:: /_static/class1/image028.png
.. |image29| image:: /_static/class1/image029.png
.. |image30| image:: /_static/class1/image030.png
   :scale: 80%
.. |image31| image:: /_static/class1/image031.png
   :scale: 80%
.. |image97| image:: /_static/class1/image097.png
