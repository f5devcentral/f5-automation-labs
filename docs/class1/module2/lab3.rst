.. |labmodule| replace:: 2
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Deploy iApp Services using the REST API
---------------------------------------------------------------------

Now that the App Services iApp is installed on BIG-IP A, we
can deploy a new service. The service in this lab will go through
different iterations, we'll start with **Creating** a Basic HTTP Service, show
**Modifying** the service by changing the node state, and then **Delete** the
whole service. Once we've seen this first **Mutation** we'll introduce some more
complex deployments options with iRules, Custom Profiles, Certificates,
and an ASM Policy.

.. NOTE:: This lab work will be performed from ``Lab 2.3`` in the Postman Collection

|image2_8|

Task 1 - View Deployed Services
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Execute Step 1 to show any services deployed on BIG-IP A

   |image2_9|

#. Review the JSON response. In this task, we have requested a list of deployed
   services from the BIG-IP, it has responded empty as nothing is installed yet.

   |image2_10|

Task 2 - Deploy Basic HTTP Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 2 to **Create** the Basic HTTP Service on BIG-IP A

   |image2_11|

#. Review the JSON body that was sent, and the JSON body that responded.
   In this task, we deployed our first service. From the sent JSON body
   we can see the variables we inserted into the iApp template.
   Note, we've just progressed to a **Declarative** instantiation,
   by defining the end state and letting the BIG-IP handle the order of
   operations and configuration.

   |image2_12|

#. Now that the service is deployed, let's look on the BIG-IP for the configuration.
   You can either repeat Task 1 Step 1 of this Lab, and view via REST, or you can
   login to the BIG-IP A GUI and see the service deployed.

   - **GUI**:

   |image2_13|

   - **REST**:

   |image2_14|

#. From the GUI, examine the Virtual Server that was created from this deployment.
   It's very generic, but it does contain all the needed pieces to create an
   active HTTP service (HTTP profile, VIP address, and a Pool with
   members in an Active state).

   |image2_15|

#. The service is available and active, you can go to the VIP address of
   ``http://10.1.20.120`` and see it respond.

   |image2_31|

Task 3 - Modify our Deployed Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 3 to **Modify** the Basic HTTP Service on BIG-IP A

   |image2_16|

#. Review how we specified a specific REST endpoint, and our sent JSON body.
   In the last two steps we viewed and deployed services against the whole BIG-IP.
   Modifying or "Reconfiguring" a service is handled by sending **only** the
   modified JSON that needs updating, to the specific endpoint (the service).
   What we sent was the new values for all our pool members to "disabled",
   which forces the service offline.

   |image2_17|

#. In the BIG-IP A GUI, after the service is modified we can see the new state of
   the Pool Members reflecting the state we declared in our above call. The VIP
   is no longer passing traffic at ``http://10.1.20.120``

   |image2_18|

Task 4 - Delete our Deployed Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 4 to **Delete** the Basic HTTP Service from BIG-IP A

   |image2_19|

#. Like modification, the deletion of a service happens to specific REST
   endpoint. When we created the service we defined a Declarative
   state to the BIG-IP, the BIG-IP then handled the operation of
   creating all objects requested in the correct order. With a deletion
   request, the BIG-IP will processes the removal of all linked objects (ASO's)
   also in the correct order. This is crucial to Application Lifecycle Management,
   as it provides the mechanism to make sure all parts of the service are
   deleted successfully.

   .. NOTE:: There is no JSON body to a Delete call, as the HTTP Method is defining the action.

   Verify on BIP-IP A either by repeating Task 1 Step 1, or by checking in the
   GUI under iApps > Application Services.

   - **GUI**:

   |image2_20|

   - **REST**:

   |image2_10|

Task 5 - Deploy an HTTP Service with Custom created Profile and a referenced iRule
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 5 Deploy an HTTP Service with Custom Profiles and an iRule to BIG-IP A

   |image2_21|

#. Review the JSON body, in this task we created a new service, but it's different
   from the one created earlier. The App Service Integration iApp contains
   the mechanisms within itself to **create** items, and reference items
   via a **URL** path. This new service we created **also** created some custom
   profiles (Protocol, Compression, HTTP and OneConnect). We then attached an
   iRule to the Virtual Server, which did not previously exist on the BIG-IP.
   The iRule was fetched during the instantiation of the service from the
   GitHub Repository of this lab.

   - Created Profiles:

     |image2_22|

   - URL Reference iRule:

     |image2_23|

   - GUI of iRule applied to Virtual Server:

     |image2_24|

#. Try and connect to the service at ``http://10.1.20.120``. The iRule that was attached
   to the service contains an HTTP RESPOND, typically used for a Maintenance Page
   solution. This can be used instead of having to configure each of the backend
   service Nodes.

   |image2_25|

Task 6 - Deploy an HTTPS Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 6 Deploy an HTTPS Service to BIG-IP A

   |image2_26|

#. Because iApps are a declarative interface, we can modify the whole deployment
   without the need to destroy it (this also means we can re-name objects, **if**
   we needed too). We requested our service continue to use the custom profiles,
   but we removed the iRule and we had the BIG-IP fetch some SSL objects
   (Certs, Key and Chain). Our HTTP service was moved to an HTTPS service,
   so we've changed the service port to 443 and applied the needed Client SSL Profile.

   |image2_27|

#. In the BIG-IP GUI, the Virtual Server has changed, the App Service Integration
   iApp has created a Port 80 > 443 remap, as well as configured our defined 443 port.

   |image2_28|

#. The configuration of the Virtual Server now uses a SSL Client profile containing
   our imported SSL objects, meaning this VIP is providing SSL Offload
   for the backend service nodes.

   |image2_29|

#. Try accessing the service with ``http://10.1.20.120``. It should redirect
   you to ``https://10.1.20.120``.

   .. NOTE:: We are using self signed certificates in the lab so an ssl warning will still be shown

   |image2_30|

Task 7 - Deploy an HTTPS Service with an ASM Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 7 Deploy an HTTPS Service with an ASM Policy on BIG-IP A

   |image2_32|

#. This final deployment will build upon our service by fetching an ASM policy
   from our GitHub repository, then apply it to the Virtual Server as a Policy
   item. This deployment recognizes the need for a Security team's presence,
   and lays the ground work for **Continuous Improvement**
   as the ASM policy would be updated as Code (Infrastructure as Code).

   - ASM Policy URL:

     |image2_34|

   - Layer 7 Policy Rules:

     |image2_35|

   - Layer 7 Policy Actions:

     |image2_33|

#. From the BIG-IP A GUI we can see the Layer 7 policy applied to the Virtual
   Server. From the ASM Module section, we can see the details of the policy
   which was dynamically fetched, applied, and set to Blocking mode.

   |image2_36|

   |image2_37|

Task 8 - Module 2 Clean Up
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. In preparation for the next lab, please run Task 4 Step 1 to delete your service.

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
