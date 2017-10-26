Lab 2.3: Create iApp Deployments using the REST API
---------------------------------------------------

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
         templates [label="iApp Templates",color="palegreen"]
         deployments [label="iApp Deployments",color="steelblue1"]
         basics -> templates -> deployments
      }
   }
   
Now that the App Services iApp template is installed, we can deploy a new
Layer 4-7 Service. The service in this lab will go through different iterations,
we'll start with **Creating** a Basic HTTP Service, show **Modifying** the
service by changing the node state, and then **Delete** the whole service.
Once we've seen this first **Mutation** we'll introduce some more
complex deployments options with iRules, Custom Profiles, Certificates,
and an ASM Policy.

.. NOTE:: This lab work will be performed from
   ``Lab 2.3 - Create iApp Deployments using the REST API`` folder in the
   Postman Collection

|image2_8|

Task 1 - View Deployed Services
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. :guilabel:`Send` the ``Step 1: Get Deployed iApp Services``
   request to view current iApp deployments on the BIG-IP device:

   |image2_9|

#. Review the JSON Response :guilabel:`Body`.  The BIG-IP device does not have
   any iApp deployments.  As a result the ``items`` array is empty (``[]``):

   |image2_10|

Task 2 - Deploy Basic HTTP Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. :guilabel:`Send` the ``Step 2: Deploy Service - HTTP`` request to
   **Create** a Basic HTTP Service:

   |image2_11|

#. Review the **Request** JSON :guilabel:`Body`, and the **Response** JSON
   :guilabel:`Body`.  In this task, we deployed our first service. From the
   sent JSON body we can see the input we sent to the iApp template to drive
   the deployment of the service:

   .. NOTE:: We've just progressed into a **Declarative** instantiation, by
      defining the end state and letting the BIG-IP handle the order of
      operations and configuration of the specific objects.  By doing this we
      have drastically reduced the **Domain Specific Knowledge** requirement
      to interact with the device.  In the next module we will combine this
      concept with **Abstraction** to further simplify the interface.

   |image2_12|

#. Now that the service has been deployed, let's review the BIG-IP configuration.
   You can review via REST by sending the ``Step 1: Get Deployed iApp Services``
   request again, or you can login to the BIG-IP A GUI and see the service
   deployment via TMUI:

   - **REST**: :guilabel:`Send` ``Step 1: Get Deployed iApp Services`` request:

     |image2_14|

   - **GUI**: :menuselection:`iApps --> Application Services --> Applications`

     |image2_13|


#. From the TMUI GUI, examine the Virtual Server that was created from
   this deployment by clicking :menuselection:`Local Traffic --> Virtual Servers 
   --> Virtual Server List --> Demo_vs`.  The configuration is simple, but it
   does contain the key components for an HTTP service (Listener, HTTP Profile
   Pool, Monitor and Pool Members):

   |image2_15|

#. The service is available and active, you can connect to the Virtual Server
   using Chrome at ``http://10.1.20.121`` and examine its response:

   |image2_31|

Task 3 - Modify our Deployed Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. :guilabel:`Send` the ``Step 3: Modify Service - HTTP`` request to
   **Modify** the previously deployed Basic HTTP Service:

   |image2_16|

#. Review the **Request** URL and JSON :guilabel:`Body`.  Notice that we
   specified **Resource** URL for our deployment.  Modifying or *Redeploying*
   a service is handled by sending **only** the updated JSON to the specific
   Resource (our service) using a ``PUT`` request method.  We set the state
   of the pool members to ``disabled`` which forces the service offline:

   |image2_17|

#. In the BIG-IP GUI click :menuselection:`Local Traffic --> Network Map` to view the
   new state of the Pool Members (Black indicators reflect the disabled state).
   The state has been updated to reflect the state we declared in our call.
   The Virtual Server is no longer passing traffic at ``http://10.1.20.121``
   because all the Members in the Pool are disabled:

   |image2_18|

Task 4 - Delete our Deployed Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. :guilabel:`Send` the ``Step 4: Delete Service - HTTP`` request to
   **Delete** the previously deployed Basic HTTP Service:

   |image2_19|

#. Like modification, the deletion of a service is performed on the **Resource**
   URL. When we created the service we defined a Declarative state to the
   iApp template.  The template then created the configuration and all the
   associated objects.  With a ``DELETE`` request, the BIG-IP will processes
   the removal of all objects linked to the ASO in the correct order. This is
   crucial to Application Lifecycle Management as it provides a mechanism to
   make sure all parts of the service are removed successfully.

   .. NOTE:: There is no JSON body to a ``DELETE`` call, as the HTTP Method
      is defining the action.

   Now that the service has been deleted, let's review the BIG-IP configuration.
   You can review via REST by sending the ``Step 1: Get Deployed iApp Services``
   request again, or you can login to the BIG-IP A GUI and see the service
   deployment via TMUI:

   - **REST**: :guilabel:`Send` ``Step 1: Get Deployed iApp Services`` request:

     |image2_10|

   - **GUI**: :menuselection:`iApps --> Application Services --> Applications`

     |image2_20|

Task 5 - Deploy an HTTP Service with Custom created Profile and a referenced iRule
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. :guilabel:`Send` the ``Step 5: Deploy Service - HTTP w/ iRule and
   Custom Profiles`` request to deploy an HTTP Service with Custom Profiles
   and an iRule:

   |image2_21|

#. The App Services iApp can *Create* or *Reference* various objects.  In this
   deployment we perform two actions:

   #. Create custom profiles on the BIG-IP device with various options
      specified.  These profiles do not exist on the BIG-IP but are created
      dynamically during the deployment.

   #. Create an iRule on the BIG-IP device by using a **URL Reference**.  The
      App Services iApp downloads the iRule resource from the URL and then
      creates a new iRule object on the system.  The iRule object is then
      automatically linked to the Virtual Server

      .. WARNING:: When using URL references it is important to properly secure
         the repository hosting the resource(s).  The example in this lab uses a
         publicly readable repository, however, most environments should use a
         private repository with appropriate access control.

#. Review the **Request** JSON :guilabel:`Body` to see how the desired outcomes
   above were declared:

   - **Custom Profiles:**

     |image2_22|

   - **URL Referenced iRule:**

     |image2_23|

   - **iRule linked to Virtual Server:** (:menuselection:`Local Traffic --> Network Map`)

     |image2_24|

#. Open Chrome and connect to the Virtual Server at ``http://10.1.20.121``. The
   iRule that was attached to the service contains an ``HTTP_RESPOND`` event,
   which responds with a simple Maintenance Page.

   |image2_25|

Task 6 - Deploy an HTTPS Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. :guilabel:`Send` the ``Step 6: Deploy Service - HTTPS`` request to deploy
   an HTTPS Service using **URL Resources** for the SSL/TLS Key, Certificate and
   Certificate Bundle.

   |image2_26|

#. iApps are a Declarative interface, allowing us to modify deployment without
   the need to delete it (this also means we can re-name objects, **if**
   we needed too).  For this service we will:

   - Use the same custom profiles
   - Remove the iRule
   - Change the Listener port to ``443`` (HTTPS)
   - Use URL Resources to obtain the SSL/TLS Key, Certificate and Certificate
     Bundle

     .. WARNING:: When using URL references it is important to properly secure
        the repository hosting the resource(s).  The example in this lab uses a
        publicly readable repository, however, most environments should use a
        private repository with appropriate access control.

   - Create and apply a Client SSL Profile

#. Review the **Request** JSON :guilabel:`Body` to see how the desired outcomes
   above were declared:

   |image2_27|

#. Review the configured Virtual Servers in the TMUI GUI.  The App Services iApp
   created a new Virtual Server to redirect ``TCP/80`` traffic to ``TCP/443``,
   and reconfigured the Virtual Server to listen on ``TCP/443``

   |image2_28|

#. The configuration of the Virtual Server now uses an SSL Client profile
   containing our imported SSL Resources.  The deployment is now providing
   SSL Offload for the backend compute nodes.

   |image2_29|

#. Open Chrome and access the service with ``http://10.1.20.121``. It should
   redirect you to ``https://10.1.20.121``.

   .. NOTE:: We are using self signed certificates in the lab so an SSL
      warning will be shown

   |image2_30|

Task 7 - Deploy an HTTPS Service with an Web Application Firewall Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. :guilabel:`Send` the ``Step 7: Deploy Service - HTTPS w/ WAF Policy`` request
   to deploy an HTTPS Service using **URL Resources** for a Web Application
   Firewall policy that will be used with the Application Security Manager
   (ASM) module.

   |image2_32|

#. This final iApp deployment will build upon our service by having the iApp
   load a WAF policy Resource from our repository.  The App Services iApp will
   then create a Layer 7 Traffic Policy and apply it to the Virtual Server.

   This deployment recognizes the need for Security from the beginning of the
   application lifecycle.  It lays the ground work for **Continuous
   Improvement** by having the policy reside in a repository.  This allows us
   to treat Resources as Code leading to an Infrastructure as Code (IaC)
   methodology.  As the policy is updated in the repository additional automation
   and orchestration can be enabled to deploy the policy into the environment.
   The end result is an ability to rapidly build, test and iterate Layer 7
   security policies and guarantee deployment into the environment.

#. Review the **Request** JSON :guilabel:`Body` to see how the desired outcomes
   above were declared:

   - **Layer 7 Policy Rules:**

     |image2_35|

   - **Layer 7 Policy Actions:**

     |image2_33|

   - **ASM Policy URL:**

     |image2_34|

#. In the TMUI GUI we can see the Layer 7 policy applied to the Virtual
   Server. In the :guilabel:`Application Security`, we can see the details
   of the policy which was dynamically fetched, applied, and set to Blocking
   mode.

   - **Layer 7 Policy:**

     |image2_39|

   - **Layer 7 Policy attached to Virtual Server:**

     |image2_36|

   - **ASM WAF Policy:**

     |image2_37|


.. |image2_8| image:: /_static/class1/image2_8.png
.. |image2_9| image:: /_static/class1/image2_9.png
.. |image2_10| image:: /_static/class1/image2_10.png
.. |image2_11| image:: /_static/class1/image2_11.png
.. |image2_12| image:: /_static/class1/image2_12.png
.. |image2_13| image:: /_static/class1/image2_13.png
.. |image2_14| image:: /_static/class1/image2_14.png
.. |image2_15| image:: /_static/class1/image2_15.png
.. |image2_16| image:: /_static/class1/image2_16.png
.. |image2_17| image:: /_static/class1/image2_17.png
.. |image2_18| image:: /_static/class1/image2_18.png
.. |image2_19| image:: /_static/class1/image2_19.png
.. |image2_20| image:: /_static/class1/image2_20.png
.. |image2_21| image:: /_static/class1/image2_21.png
.. |image2_22| image:: /_static/class1/image2_22.png
.. |image2_23| image:: /_static/class1/image2_23.png
.. |image2_24| image:: /_static/class1/image2_24.png
.. |image2_25| image:: /_static/class1/image2_25.png
.. |image2_26| image:: /_static/class1/image2_26.png
.. |image2_27| image:: /_static/class1/image2_27.png
.. |image2_28| image:: /_static/class1/image2_28.png
.. |image2_29| image:: /_static/class1/image2_29.png
.. |image2_30| image:: /_static/class1/image2_30.png
.. |image2_31| image:: /_static/class1/image2_31.png
.. |image2_32| image:: /_static/class1/image2_32.png
.. |image2_33| image:: /_static/class1/image2_33.png
.. |image2_34| image:: /_static/class1/image2_34.png
.. |image2_35| image:: /_static/class1/image2_35.png
.. |image2_36| image:: /_static/class1/image2_36.png
.. |image2_37| image:: /_static/class1/image2_37.png
.. |image2_39| image:: /_static/class1/image2_39.png
