Lab 3.3: Deploy L4-7 Services
-----------------------------

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
         label = "Service Templates, Catalog and Deployments"
         onboarding [label="Basics",color="palegreen"]
         templates [label="Templates",color="palegreen"]
         catalog [label="Catalog",color="steelblue1"]
         deployments [label="Deployments",color="steelblue1"]
         onboarding -> templates -> catalog -> deployments
      }
   }

Up to this point we have spent a lot of time building our toolchain to create 
a Declarative Service Catalog.  We are now at the point where we can perform 
a Declarative, Abstracted Service Deployment using the iWorkflow Tenant Service
Catalog, Tenant API and optionally the built-in Tenant GUI.

As we did in the previous lab we will explore the first deployment in depth
so you can implement a full Service Lifecycle Create, Read, Update and Delete 
(CRUD) operations.  For the remaining deployments you can just repeat the steps 
used with the first example.

Tenant Overview
^^^^^^^^^^^^^^^

iWorkflow Tenants allow Consumers to perform Service Lifecycle operations in a 
isolated environment.  All actions performed prior to this lab have been in
whats called the ``Provider`` space and, by nature, are masked from Tenants
unless specifically exposed.  As a result of the Tenant isolation, each Tenant 
maintains its own set of Users and Roles associated with those users, allowing
each Tenant full control of the actions Tenant Users can perform.

During our iWorkflow Onboarding process in Lab 3.1 we created a 
:guilabel:`Tenant` name ``MyTenant`` and an associated :guilabel:`Tenant User`
with a username of ``tenant``.  Additionally we gave ``MyTenant`` access to
the :guilabel:`BIG-IP Connector` named ``BIG-IP A&B Connector``:

|image54|

This gives the ``tenant`` user the ability to perform CRUD operations on 
Service Deployments.

.. NOTE:: Service Templates can also be assigned to specific Cloud Connectors,
   allowing you to restrict the use of Templates to a specific Tenant and set
   of BIG-IP resources.

Task 1 - Login to the iWorkflow Tenant UI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

iWorkflow provides a Tenant UI that can act as a simple self-service portal 
for Tenants.  In this lab we'll use the Tenant UI to monitor the results of
various actions we take via the iWorkflow Tenant API.

Perform the following steps to complete this task:

#. Open a new Chrome window/tab and connect to ``https://10.1.1.12``

#. Use the ``MyTenant`` Tenant User credentials to login:

   - Username: ``tenant``
   - Password: ``tenant``

#. You will see a user interface that looks similar to the Provider UI, however,
   the access is limited to Tenant specific objects.  You can see a list of 
   available :guilabel:`Service Templates` and :guilabel:`Clouds` with their
   associated Connectors:

   |image55|

Task 2 - Authenticate to the iWorkflow Tenant API
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As described above, the Tenant interfaces to iWorkflow maintain their own 
access control mechanisms.  As a result, when performed operations via the 
Tenant API you must authenticate with a Tenant User (``tenant`` in this case).

Perform the following steps to complete this task:

#. In Postman expand the ``Lab 3.3 - Deploy L4-7 Services`` folder in the
   collection

#. Click the ``Authenticate and Obtain Token for Tenant User`` request and 
   examine the JSON request :guilabel:`Body`.  Notice that we are sending the
   credentials for the Tenant User (``tenant``).  This request will 
   automatically populate the ``iwf_tenant_auth_token`` variable in the Postman
   environment so it can be used by subsequent requests.

#. Click the :guilabel:`Send` button on the 
   ``Authenticate and Obtain Token for Tenant User`` request.  Check the 
   :guilabel:`Test Results` tab to ensure the token was populated.

#. Click the ``Set Tenant Authentication Token Timeout`` request and click the
   :guilabel:`Send` button.  This request will increase the timeout value for 
   the token so we can complete the lab without having to re-authenticate.

Task 3 - Perform Service Lifecycle Operations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will perform CRUD operations on Service Deployments 
demonstrating a full Service Lifecycle for a Tenant Service.

Create
^^^^^^

Perform the following steps to complete this task:

#. Click the ``Deploy example-f5-http-lb Service`` request in the folder. 

#. Examine the URI.  Notice that the variable ``iwf_tenant_name`` is used to 
   specify the Tenant we are performing the operation on.  In this case 
   ``iwf_tenant_name`` is set to ``MyTenant`` in the Postman environment:

   |image56|

#. Examine the JSON Request :guilabel:`Body`; it contains the following data:

   - Deployment ``name``
   - A URI Reference to the Service Template ``f5-http-lb-v1.0``
   - The input ``vars`` and ``tables`` for the deployment.  These 
     fields were marked ``Tenant Editable`` in the Service Template
   - A URI Reference to the Connector to use for deployment.  This specifies
     which BIG-IP devices will be used for this deployment

   The data in the list above is higlighted below:
   
   |image57|

#. Click the :guilabel:`Send` button to **Create** the Service Deployment

#. Switch to the Chrome iWorkflow Tenant UI window.  The ``example-f5-http-lb`` 
   Service is now present in the :guilabel:`L4-L7 Services` pane.  Double
   click the Service and examine its properties.  You can compare the 
   values in the UI to the JSON Request :guilabel:`Body` from the step above.

   |image58|

#. Open a Chrome window/tab to the BIG-IP A GUI at ``https://10.1.1.10`` and
   login with ``admin/admin`` credentials. Navigate to 
   :menuselection:`iApps --> Application Services`.  Select 
   ``example-f5-http-lb`` from the list of deployed services and examine the 
   :guilabel:`Components` of the deployed service:

   |image59|

Update
^^^^^^

Perform the following steps to complete this task:

#. Click the ``Modify example-f5-http-lb Service`` request in the folder.

#. We will send a ``PUT`` request to the Resource URI for the existing 
   deployment and add a Pool Member as shown in the JSON Request 
   :guilabel:`Body`:

   |image60|

#. Click the :guilabel:`Send` button to **Update** the Service Deployment

#. Update the iWorkflow Tenant UI and notice that the Service has been updated:

   |image61|

#. Update the BIG-IP GUI and notice that the :guilabel:`Components` tree has 
   been updated:

   |image62|

Read
^^^^

Perform the following steps to complete this task:

#. Click the ``Get example-f5-http-lb Service`` request in the folder.

#. We will send a ``GET`` request to the Resource URI for the existing 
   deployment.

#. Click the :guilabel:`Send` button to **Read** the Service Deployment

#. Examine the JSON Response :guilabel:`Body` to see the state of the current
   Service Deployment:

   |image63|

Delete
^^^^^^

Perform the following steps to complete this task:

#. Click the ``Delete example-f5-http-lb Service`` request in the folder.

#. We will send a ``DELETE`` request to the Resource URI for the existing 
   deployment.

#. Click the :guilabel:`Send` button to **Delete** the Service Deployment

#. Update the iWorkflow Tenant UI and verify that the Service has been deleted:

   |image64|

#. In the BIG-IP GUI navigate to 
   :menuselection:`iApps --> Application Services` and verify the service was
   deleted.

   |image65|

Task 3 - Deploy Additional Services
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Examples **Create** requests are included in the 
``Lab 3.3 - Deploy L4-7 Services`` folder.  For the remaining services 
refer to the table below to see which ones apply most to your specific use
cases.  You can repeat the steps in Task 2 for the additional services by 
modifying the requests as needed.

.. list-table::
    :widths: 30 70
    :header-rows: 1
    :stub-columns: 1

    * - **Service Name**
      - **Description**
    * - ``f5-http-lb``
      - HTTP Load Balancing to a Single Pool
    * - ``f5-https-offload``
      - HTTPS Offload and Load Balancing to a Single Pool
    * - ``f5-fasthttp-lb``
      - Performance-enhanced HTTP Load Balancing to a Single Pool
    * - ``f5-fastl4-udp-lb``
      - Generic L4 TCP Load Balancing to a Single Pool
    * - ``f5-fastl4-udp-lb``
      - Generic L4 UDP Load Balancing to a Single Pool
    * - ``f5-http-url-routing-lb``
      - HTTP Load Balancing with URL Based Content Routing to Multiple Pools
    * - ``f5-https-waf-lb``
      - HTTPS Offload, Web Application Firewall Protection and Load Balancing
        to a Single Pool 

.. |image54| image:: /_static/class1/image054.png
.. |image55| image:: /_static/class1/image055.png
   :scale: 80%
.. |image56| image:: /_static/class1/image056.png
   :scale: 80%
.. |image57| image:: /_static/class1/image057.png
.. |image58| image:: /_static/class1/image058.png
   :scale: 80%
.. |image59| image:: /_static/class1/image059.png
.. |image60| image:: /_static/class1/image060.png
.. |image61| image:: /_static/class1/image061.png
.. |image62| image:: /_static/class1/image062.png
.. |image63| image:: /_static/class1/image063.png
.. |image64| image:: /_static/class1/image064.png
.. |image65| image:: /_static/class1/image065.png
