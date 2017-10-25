Lab 2.2: Deploying iApp Templates on BIG-IP
-------------------------------------------

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
         label = "iApp Templates & Deployments"
         basics [label="iApp Basics",color="palegreen"]
         templates [label="iApp Templates",color="steelblue1"]
         deployments [label="iApp Deployments"]
         basics -> templates -> deployments
      }
   }

iApps typically come in the form of a ``.tmpl`` file, which contains the content
needed for the BIG-IP to utilize it as a Service framework.
Different toolkits will install iApps in different ways, we'll be using the
REST API in a raw form, so the contents of the file is what
we need. As a result we need to ensure that the contents of the iApp are URL
encoded to make sure the BIG-IP reads the payload correctly. When using other
tools like Ansible, the whole ``.tmpl`` file can be uploaded, removing the need
for encoding.

.. NOTE:: This lab work will be performed from
   ``Lab 2.2 - Deploying iApp Templates on BIG-IP`` folder in the Postman
   Collection

|image2_7|

Task 1 - View Installed iApp Templates
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. :guilabel:`Send` the ``Step 1: Get Installed iApp Templates`` request to view
   iApp templates installed on the BIG-IP device:

   |image2_3|

#. Review the JSON response :guilabel:`Body`.  The JSON payload shows a
   iApp templates that are installed by default on the BIG-IP device:

   |image2_4|

Task 2 - Install the App Services iApp Template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. :guilabel:`Send` the ``Step 2: Install App Svcs v2.0.004 iApp Template``
   request to install the iApp template:

   |image2_5|

#. Review the **Request** JSON :guilabel:`Body`, and the **Response** JSON
   :guilabel:`Body`.  In this task we installed the App Services iApp Template
   and the BIG-IP sent back a response that the iApp was installed with its
   object name.

   .. NOTE:: The JSON body in the **Request** portion is automatically generated
      as part of the build process for the App Services iApp and the request
      in the Postman Collection was copied from a pre-built collection that
      ships with releases of the App Services iApp template.

   |image2_38|

.. |image2_3| image:: /_static/class1/image2_3.png
.. |image2_4| image:: /_static/class1/image2_4.png
.. |image2_5| image:: /_static/class1/image2_5.png
.. |image2_6| image:: /_static/class1/image2_6.png
.. |image2_7| image:: /_static/class1/image2_7.png
.. |image2_38| image:: /_static/class1/image2_38.png
