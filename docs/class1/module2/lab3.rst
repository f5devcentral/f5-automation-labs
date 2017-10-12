.. |labmodule| replace:: 2
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Deploy iApp Services using the REST API
---------------------------------------------------------------------

Now that the App Services iApp is installed on BIG-IP A, we
can deploy a Service. The Service in this Lab will go through
different iterations, we'll start with a `Basic HTTP Service`, `Modify` the
Services Node states and then `Delete` the whole Service. Once we've
seen the first `Mutation` of the Service we'll introduce some more complex
Services deployments with iRules, Custom Profiles, Certificates and an ASM Policy.

.. NOTE:: This lab work will be performed from the Lab 2.3 Postman Collection

|image2_8|

Task 1 - View Deployed Services
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Execute Step 1 to show Services Deployed on BIG-IP A

   |image2_9|

#. Review the JSON response. In this task, we have requested a list of deployed
   services from the BIG-IP and it has responded empty as nothing is installed yet.

   |image2_10|

Task 2 - Deploy Basic HTTP Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 2 to Deploy the Basic HTTP Service on BIG-IP A

   |image2_11|

#. Review the JSON Body that was sent, and the JSON Body that responded.
   In this task, we deployed our first Service. From the JSON body that was
   sent we can see the variables we're requesting inserted into the iApp
   template. Note that  `we've just progressed to ``Declarative`` instantiation`, 
   defining the end state and letting the BIG-IP handle the order of operations and
   configuration.

   |image2_12|

#. Now that the Service is deployed, let's look on the BIG-IP for the new deployment.
   You can either repeat Task 1 Step 1 via of this Lab and view via REST or you can
   login to the BIG-IP A GUI and see the service deployed.

   |image2_13|

   |image2_14|

#. From the GUI examine the Virtual Server that was created from this deployment.
   It's very generic, but it does contain all the needed pieces to create an
   active HTTP service: HTTP profile, VIP address, and a Pool with
   members in an Active state.

   |image2_15|

#. This service is up and Active, you can go to the VIP address of
   ``http://10.1.20.120`` and see it working.

   |image2_31|

Task 3 - Modify our Deployed Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 3 to Modify the Basic HTTP Service on BIG-IP A

   |image2_16|

#. Modifying or "Reconfiguring" a Service is handled by only sending the pieces
   of the JSON that needs updating. This is sent to the deployed Service Name. 
   In the last two steps, we were deploying Services as a whole to the BIG-IP.
   In a modify call, you are modifying only parts of the singular endpoint (the Service). 
   Review the specific REST endpoint and the JSON body. This is all we need 
   to send the new "State" Attributes and Values.

   |image2_17|

#. Back on the BIG-IP GUI, after the Service is modified we can see the new state of
   the Pool Members reflecting the state we declared in the REST call. Now the VIP
   is also no longer passing traffic to ``http://10.1.20.120`` 

   |image2_18|

Task 4 - Delete our Deployed Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 4 to Delete the Basic HTTP Service on BIG-IP A

   |image2_19|

#. Like Modification, the deletion of the Service happens to the REST endpoint
   of the Service itself. When we created the Service, we made a Declarative 
   instantiation to build all the objects. The BIG-IP then handled the operation of 
   creating all the objects requested in the correct order. For Deletion 
   we request the Delete operation and the BIG-IP processes all the removal of the 
   linked objects (ASO's) in the correct order too. This is crucial to 
   Application Lifecycle Management as it provides the mechanism to make sure 
   all parts of the Service are deleted without leaving behind unneeded items. 
   Note there is no JSON body to a Delete call as the HTTP Method is defining the Action. 
   Verify on the BIP-IP either by the REST call in Step 1 or by checking the 
   GUI iApps > Application Services.

   |image2_10|

   |image2_20|

Task 5 - Deploy an HTTP Service with Custom created Profile and a referenced iRule
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 5 Deploy the HTTP Service with Custom Profiles and an iRule on BIG-IP A

   |image2_21|

#. Review the JSON body, in this task we created a new Service, but it's different
   from the original one created earlier. The App Service Integration iApp
   contains the mechanisms within itself to Create items, and reference items
   via a URL path. This new Service we created also created some new profiles
   for us (Protocol, Compression, HTTP and OneConnect). We have also attached a
   new iRule to the Virtual Server, which did not previously exist on the BIG-IP. 
   It was fetched during the instantiation of the Service from the GitHub Repository 
   that is housing our Lab.

   - Created Profiles:

     |image2_22|

   - URL Reference iRule:

     |image2_23|

   - GUI of iRule applied to Virtual Server

     |image2_24|

#. Try and connect to the VIP at ``http://10.1.20.120``. The iRule that was attached 
   to the Service contains an HTTP RESPOND, typically used for Maintenance Page
   solutions. This can be used instead of having to configure each of the backend 
   service Nodes.

   |image2_25|

Task 6 - Deploy an HTTPS Service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 6 Deploy the HTTPS Service on BIG-IP A

   |image2_26|

#. Because iApps are a Declarative Interface, we can modify the whole deployment
   without the need to Destroy it. This also means we can re-name objects, `if`
   we needed too. In the above call we Declared a new state of the Service.
   We requested that it continue to use the Created Profiles, but we removed
   the iRule, and we had the BIG-IP fetch some SSL objects (Certs, Key and Chain).
   Because we are moving to an SSL Service, we've also changed the Listener Port to
   443 and applied the needed Client SSL Profile.

   |image2_27|

#. In the BIG-IP GUI, the Virtual Server has changed and the App Services Integration
   iApp has created a Port 80 > 443 remap, as well as the 443 VIP.

   |image2_28|

#. The configuration of the VIP now uses our new SSL Client profile, meaning this VIP 
   is providing SSL Offload for the backend service Node.

   |image2_29|

#. Try accessing the Service with ``http://10.1.20.120``. It should redirect
   you to ``https://10.1.20.120``.

   .. NOTE:: We are using self signed certificates in the lab so an ssl warning will
      still be shown

   |image2_30|

Task 7 - Deploy an HTTPS Service with an ASM Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Execute Step 7 Deploy the HTTPS Service with an ASM Policy on BIG-IP A

   |image2_32|

#. To build on the deployment of the Service in the last Task, this deployment
   will grab an ASM policy from our GitHub repository and apply it to the
   Virtual Server as a Policy item. This deployment recognizes the need for
   the Security team's Policy in our environment, and lays the ground work for
   `Continuous Improvement` as the ASM policy needs to be updated as Code. 
   We can deploy that right back onto the Virtual Server by reconfiguring the Service.

   - ASM Policy URL:

     |image2_34|

   - Layer 7 Policy Rules:

     |image2_35|

   - Layer 7 Policy Actions:

     |image2_33|

#. From the BIG-IP A GUI we can see the Layer 7 Policy Applied to the Virtual
   Server, and from the Application Security Manager Module we can see the applied
   policy, which is set to Blocking mode.

   |image2_36|

   |image2_37|

Task 8 - Module 2 Clean Up
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. In preparation for the next lab, please run Task 4 and Delete your Service.

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
