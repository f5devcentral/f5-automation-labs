.. |labmodule| replace:: 3
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: iWorkflow Onboarding
--------------------------------------------------

.. graphviz::

   digraph iwf_onboarding {
      rankdir = TB
      fontname = "arial-bold"
      ranksep = .2
      splines = ortho
      node [fontsize=10,style="rounded,filled",shape=box,color=navajowhite,margin="0.05,0.05",height=0.1]  
      edge [arrowsize=0.5,fontsize=8] 

      {
         rank=min 
         start [label="Start iWorkflow Onboarding",color="chartreuse3"]
      }
      
      subgraph cluster1 {
         style = "rounded,filled"
         color = lightgrey

         auth_start [label="Token-Based Authentication",color="navajowhite3"]
         {
            rank=same
            iwf_auth_token [color=cadetblue3]
            auth_gettoken [label="Retrive Authentication Token"]
         }
         auth_verify [label="Verify Authentication Works"]
         auth_settimeout [label="Set Auth Token Timeout"]
      }         
      
      subgraph cluster2 {
         style = "rounded,filled"
         color = lightgrey

         discover_start [label="Discover BIG-IP Devices",color="navajowhite3"]
         {
            rank=same
            discover_bip_a [label="Discover BIG-IP A"]
            iwf_bigip_a_uuid [color=cadetblue3]
         }
         {
            rank=same
            discover_bip_b [label="Discover BIG-IP B"]
            iwf_bigip_b_uuid [color=cadetblue3]
         }
         discover_get [label="Get Discovered Devices"]
         discover_check_state [label="state=ACTIVE",color=orange2]
      }  
      
      subgraph cluster3 {
         style = "rounded,filled"
         color = lightgrey

         create_start [label="Create iWorkflow Tenant",color="navajowhite3"]
         { 
            create_tenant [label="Create iWorkflow Tenant &&#92;nBIG-IP Connector"]
            create_tenant_user [label="Create Tenant User"] 
            create_role [label="Assign User to Tenant Admin Role"]
         }
         {
            rank=same
            create_connector [label="Create a BIG-IP Connector"]
            iwf_connector_uuid [color=cadetblue3]
         }
         create_assign [label="Assign Connector to Tenant"]
      }    
      
      subgraph cluster4 {
         style = "rounded,filled"
         color = lightgrey
         
         iapp_start [label="Install App Services&#92;niApp Template",color="navajowhite3"]
         {
            rank=same
            iapp_install [label="Install App Services&#92;nTemplate on iWorkflow"]
            iwf_appsvcs_name [color=cadetblue3]
         }
      }                    

      {
         rank=max 
         end [label="End iWorkflow Onboarding",color=indianred1]
      }
      
      /* Imperative Process Flow */
      { 
         edge[style=solid]
         start -> auth_start 
         auth_start -> auth_gettoken -> auth_verify -> auth_settimeout -> discover_start
         discover_start -> discover_bip_a -> discover_bip_b -> discover_get -> discover_check_state
         discover_check_state -> create_start [taillabel="Yes "]
         discover_check_state -> discover_get [taillabel="No "] 
         create_start -> create_tenant -> create_tenant_user -> create_role -> create_connector -> create_assign -> iapp_start
         iapp_start -> iapp_install -> end
      }

      /* Conditionals */


      /* Variable Read/Writes */
      {  
         constraint=false 
         edge[style=dashed]
         auth_gettoken -> iwf_auth_token
         iwf_auth_token -> {auth_verify auth_settimeout}
         iwf_auth_token -> {discover_bip_a discover_bip_b discover_get}
         iwf_auth_token -> {create_tenant create_tenant_user create_role create_connector create_assign}
         iwf_auth_token -> {iapp_install}         
         discover_bip_a -> iwf_bigip_a_uuid
         iwf_bigip_a_uuid -> create_connector
         discover_bip_b -> iwf_bigip_b_uuid
         iwf_bigip_b_uuid -> create_connector
         create_connector -> iwf_connector_uuid -> create_assign         
         iapp_install -> iwf_appsvcs_name
      }
   }

iWorkflow Authentication
~~~~~~~~~~~~~~~~~~~~~~~~

iWorkflow supports the same authentication mechanisms as BIG-IP (HTTP
BASIC, Token Based Auth). In this lab we will quickly review TBA on
iWorkflow.

Task 1 - Token Based Authentication
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this task we will demonstrate TBA using the local authentication
database, however, authentication to external providers is fully
supported.

For more information about external authentication providers see the
section titled "\ **About external authentication providers with
iControl REST**\ " in the iControl REST API User Guide available at
https://devcentral.f5.com

Perform the following steps to complete this task:

#. Click the ‘Step 1: Get Authentication Token’ item in the Lab 2.1
   Postman Collection

#. Notice that we are sending a POST request to the
   ``/mgmt/shared/authn/login`` endpoint.

   |image41|

#. Click the ‘Body’ tab and examine the JSON that we will send to
   iWorkflow to provide credentials:

   |image42|

#. Modify the JSON body and add the required credentials (admin/admin).
   Then click the ‘Send’ button.

#. Examine the response status code. If authentication succeeded and a
   token was generated the response will have a 200 OK status code. If
   the status code is 401 then check your credentials:

   **Successful:**

   - |image43|

   **Unsuccessful:**

   - |image44|

#. Once you receive a 200 OK status code examine the response body. The
   various attributes show the parameters assigned to the particular
   token. Find the ‘token’ attribute and copy it into your clipboard
   (Ctrl+c) for use in the next step:

   |image45|

#. Click the ‘Step 2: Verify Authentication Works’ item in the Lab
   2.1 Postman collection. Click the ‘Headers’ tab and paste the
   token value copied above as the VALUE for the ``X-F5-Auth-Token``
   header. This header is required to be sent on all requests when
   using token based authentication.

   |image46|

#. Click the ‘Send’ button. If your request is successful you should
   see a ‘200 OK’ status and a listing of the ‘ltm’ Organizing
   Collection.

#. We will now update your Postman environment to use this auth token
   for the remainder of the lab. Click the Environment menu in the top
   right of the Postman window and click ‘Manage Environments’:

   |image47|

#. Click the ‘INTRO - Automation & Orchestration Lab’ item:

   |image48|

#. Update the value for ‘iwf\_auth\_token’ by Pasting (Ctrl-v)
   in your auth token:

   |image49|

#. Click the ‘Update’ button and then close the ‘Manage Environments’
   window. Your subsequent requests will now automatically include
   the token.

#. Click the ‘Step 3: Set Authentication Token Timeout’ item in the
   Lab 1.2 Postman collection. This request will PATCH your token
   Resource (check the URI) and update the timeout attribute so we
   can complete the lab easily. Examine the request type and JSON
   Body and then click the ‘Send’ button. Verify that the timeout has
   been changed to ‘36000’ in the response:

   |image50|

Discover BIG-IP Devices
~~~~~~~~~~~~~~~~~~~~~~~

In order for iWorkflow to interact with a BIG-IP device it must be
discovered by iWorkflow. The device discovery process leverages the
existing CMI Device Trust infrastructure on BIG-IP. Currently there is a
limitation that a single BIG-IP device can only be ‘discovered’ by ONE
of iWorkflow or BIG-IQ CM at a time. In this lab will we discover the
existing BIG-IP devices from your lab environment.

Task 1 - Discover BIG-IP Devices
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Perform the following steps to complete this task:

#. Expand the "Lab 2.2: Discover & License BIG-IP Devices" folder in the
   Postman collection

#. Open a Google Chrome window/tab to your iWorkflow device
   (https://10.1.1.6) and login with default credentials (admin/admin).
   You can use this window to monitor actions while they are being
   performed in Postman. Find the ‘Devices’ pane and make if viewable if
   it isn’t already.

#. Click the "Step 1: Discover BIGIP-A Device" item in the Postman
   collection. This will request will perform a POST to the
   ``/mgmt/shared/resolver/device-groups/cm-cloud-managed-devices/devices``
   worker to perform the device discovery process. Examine the JSON body
   so you understand what data is sent to perform the discovery process:

   |image51|

#. Click the ‘Send’ button. Examine the response and monitor the
   iWorkflow Chrome window you opened previously.

   |image52|

#. Copy the ‘uuid’ attribute for BIGIP-A and populate the
   ‘iwf\_bigip\_a\_uuid’ Postman environment variable with the
   value:

   |image53|
   |image54|

#. Click the "Step 2: Discover BIGIP-B Device" item in
   the collection.

#. Click the "Step 3: Get Discovered Devices" item in the collection.
   We will GET the devices collection and verify that both BIG-IP
   devices show a ‘state’ of ‘ACTIVE’:

   |image55|

Create Tenant & BIG-IP Connector
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

iWorkflow implements a Tenant/Provider interface to enable abstracted deployment
of L4-7 into various environment.  In conjuction iWorkflow Connectors serve as
the L1-3 Network and Device Onboarding automation component in the automation
toolchain. iWorkflow supports Connectors for various vendor integrations
(F5 vCMP, F5 BIG-IP, Cisco APIC, vmWare NSX, etc.) In this lab we will create a
‘BIG-IP Connector’ for the BIG-IP devices in the lab deployment. This
connector will then allow you to drive a fully automated deployment from
the iWorkflow Service Catalog.

Task 1 - Create a Tenant and Tenant User
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this task we will create a Local Connector that is linked to our
BIG-IP devices. The Local Cloud Connector is DSC aware and will
automatically detect that the BIG-IP devices are clustered and configure
itself accordingly.

Perform the following steps to complete this task:

#. Expand the "Lab 2.3 - Create Tenant & Local Connector" folder in the Postman
   collection.

#. Click the "Step 1: Create iWorkflow Tenant" item in the collection and click
   'Send'.  This request will create a tenant named ``MyTenant``.

#. Click the "Step 2: Create Tenant User" item in the collection and click
   'Send'.  This request will create a **tenant** user.

#. Click the "Step 3: Assign User to Tenant Admin Role" item in the collection
   and click 'Send'.  This request will assign the Admin role for the
   ``MyTenant`` tenant to the ``tenant`` user.

Task 2 - Create a Local Connector
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Click the "Step 4: Create a Local Connector" item in the
   collection. We will create a new connector by performing a POST to
   the local connector collection. If you examine the JSON body you
   can see we are providing a reference to the URL for the BIG-IP-A
   device (using the UUID environment variable we populated earlier):

   |image56|

#. Click the ‘Send’ button to create the connector.

#. Click the "Step 5: Get Local Connectors" item in the collection and
   click ‘Send’. Examine the output to see how the connector was
   configured. Take note of the reference to the ‘device-group’. This
   is how the connector determines the HA state of the underlying
   BIG-IP devices. Find the ‘connectorId’ of the connector and update
   your Postman environment to include the ‘connectorId’ as the value
   of the ‘iwf\_connector\_uuid’ variable:

   |image57|
   |image58|

#. Click the "Step 6: Assign Connector to Tenant" item in the
   collection. This request will assign this connector to
   to the ‘MyTenant’ tenant allowing service deployments from that
   tenant. Click the ‘Send’ button and examine the response.


.. |image41| image:: /_static/class1/image041.png
   :scale: 40%
.. |image42| image:: /_static/class1/image042.png
   :scale: 40%
.. |image43| image:: /_static/class1/image043.png
   :width: 6.21017in
   :height: 0.79167in
.. |image44| image:: /_static/class1/image044.png
   :width: 6.25278in
   :height: 0.79268in
.. |image45| image:: /_static/class1/image045.png
   :width: 5.16635in
   :height: 2.88907in
.. |image46| image:: /_static/class1/image046.png
   :scale: 40%
.. |image47| image:: /_static/class1/image047.png
   :scale: 40%
.. |image48| image:: /_static/class1/image048.png
   :width: 4.67051in
   :height: 1.23217in
.. |image49| image:: /_static/class1/image049.png
   :scale: 40%
.. |image50| image:: /_static/class1/image050.png
   :scale: 40%
.. |image51| image:: /_static/class1/image051.png
   :scale: 40%
.. |image52| image:: /_static/class1/image052.png
   :width: 5.21233in
   :height: 2.73647in
.. |image53| image:: /_static/class1/image053.png
   :scale: 40%
.. |image54| image:: /_static/class1/image054.png
   :scale: 40%
.. |image55| image:: /_static/class1/image055.png
   :scale: 40%


.. |image56| image:: /_static/class1/image056.png
   :scale: 40%
.. |image57| image:: /_static/class1/image057.png
   :width: 5.24968in
   :height: 2.77172in
.. |image58| image:: /_static/class1/image058.png
   :scale: 40%

