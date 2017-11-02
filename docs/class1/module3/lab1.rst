Lab 3.1: iWorkflow Onboarding
-----------------------------

.. graphviz::

   digraph breadcrumb {
      rankdir="LR"
      ranksep=.4
      node [fontsize=10,style="rounded,filled",shape=box,color=gray72,margin="0.05,0.05",height=0.1]
      fontsize = 10
      labeljust="l"
      subgraph cluster_provider {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "Service Templates, Catalog and Deployments"
         onboarding [label="Basics",color="steelblue1"]
         templates [label="Templates"]
         catalog [label="Catalog"]
         deployments [label="Deployments"]
         onboarding -> templates -> catalog -> deployments
      }
   }

In this lab we will use the :guilabel:`Runner`, introduced in previous labs to
complete the onboarding of the F5 iWorkflow device.  The onboarding process
creates the initial configuration required to start creation of Service
Catalog Templates.

iWorkflow Overview
~~~~~~~~~~~~~~~~~~

Before looking at the details of the onboarding process, lets discuss the new
components iWorkflow introduces to our toolchain.

Device Discovery
^^^^^^^^^^^^^^^^

In order for iWorkflow to interact with a BIG-IP device it must be
discovered by iWorkflow. The device discovery process leverages the
existing CMI Device Trust infrastructure on BIG-IP. Currently there is a
limitation that a single BIG-IP device can only be ‘discovered’ by ONE
of iWorkflow or BIG-IQ CM at a time. In this lab will we discover the
existing BIG-IP devices from your lab environment.

Tenants & Connectors
^^^^^^^^^^^^^^^^^^^^

iWorkflow implements a Tenant/Provider interface to enable abstracted deployments
of L4-7 Services into various environments.  In conjunction, iWorkflow Connectors
serve as the L1-3 Network and Device Onboarding automation component in the automation
toolchain.  In this lab we will create a ‘BIG-IP Connector’ for the BIG-IP
devices in the lab environment. This connector will then allow you to drive a
fully automated deployment from the iWorkflow Service Catalog.

iApp Templates
^^^^^^^^^^^^^^

iWorkflow serves as an iApp Template Source-of-Truth for discovered BIG-IP
devices.  This allows an F5 administrator to manage iApp templates in a single
place with iWorkflow installing required templates on BIG-IP devices as
required **during** service deployment.

Onboarding Process Overview
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The process implemented in the ``Lab 3.1 - iWorkflow Onboarding`` folder of
the Postman collection is diagrammed below.

.. NOTE:: The diagram below represents environment variables in blue.  You can
   follow the lines on each variable to understand which request populates the
   variable and how they are subsequently used.

.. graphviz:: iwf_onboarding.dot

Task 1 - Onboard iWorkflow using Runner
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will use the :guilabel:`Runner` to execute a series of
requests contained in the ``Lab 3.1 - iWorkflow Onboarding`` folder.

Perform the following steps to build the cluster:

#. Click the :guilabel:`Runner` button at the top left of your Postman window:

   |postman-runner-button|

#. Select the ``F5 Programmability: Class 1`` Collection then the
   ``Lab 3.1 - iWorkflow Onboarding`` folder.  Next, be sure the
   environment is set to ``F5 Programmability: Class 1``:

   |lab-1-1|

#. Click the :guilabel:`Run Lab 3.1 - iWor...` button

#. The results window will now populate.  You will see each request in the
   folder is sent and it's associated test results are displayed on the screen.
   Onboarding iWorkflow can take a few minutes.  You can follow the progress
   by scrolling down the results window.

#. Once the :guilabel:`Run Summary` button appears the folder has finished
   running.  You should have 0 failures and the last item in the request
   list should be named ``Install App Services Template on iWorkflow``

   |lab-1-2|

#. At this point you can log into iWorkflow using Chrome at
   ``https://10.1.1.12`` and ``admin/admin`` credentials.  Click
   :guilabel:`Clouds and Services` at the top of the window:

   |lab-1-3|

#. Browse the various panes to see what was created:

   |lab-1-4|

.. |postman-runner-button| image:: /images/postman-runner-button.png
.. |lab-1-1| image:: images/lab-1-1.png
.. |lab-1-2| image:: images/lab-1-2.png
   :scale: 80%
.. |lab-1-3| image:: images/lab-1-3.png
.. |lab-1-4| image:: images/lab-1-4.png
   :scale: 70%


