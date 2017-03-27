.. |labmodule| replace:: 2
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Create an L4–7 Service Template & Deployment
--------------------------------------------------------------------------

To drive iApp automation-based L4-7 deployments, iWorkflow includes the
capability to create a Tenant Service Catalog via L4 – L7 Service
Templates. This model of deployment enables Declarative automation of F5
L4-7 services provided the underlying iApp templates are designed with a
declarative presentation layer in mind. To demonstrate this capability
we will create a simple Service Catalog Template and deploy and
application from a tenant on our BIG-IP devices.

Task 1 – Create L4–7 Service Template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An L4-7 Service Deployment on iWorkflow is driven by the creation of an
L4 – L7 Service Template. These templates allow a provider
(administrator) to specify the values of specific fields from an origin
iApp presentation layer. Additionally, the provider also defines the
tenant interface to the service by marking which fields are ‘\ **Tenant
Editable**\ ’ and therefore visible during service deployment from the
tenant. You can think of a Service Catalog Template and a filter that
allows the vast majority of fields to be filled in or defaulted while
only exposing the minimal set of fields required to deploy a service.

In this task we will create a Service Catalog Template that utilizes the
f5.http iApp.

Perform the following steps to complete this task:

#. Expand the “Lab 2.4 – iWorkflow Service Catalog & Service Deployment”
   folder in the Postman collection

#. Click the “Step 1: Create PROVIDER Service Catalog Template” item in
   the collection. This request is pre-built and will create a new
   template using the f5.http iApp. Click the ‘Send’ button to create
   the template.

#. Open a Chrome tab to iWorkflow (https://10.1.1.6) and login with
   admin/admin credentials. Expand the ‘Catalog’ pane and double-click
   the “Lab2.4\_HTTP” template. Notice the cloud connector was
   associated as part of the REST request, various defaults have been
   populated (e.g. port ‘80’ for the pool\_\_port variable) and some
   fields have been marked as ‘Tenant Editable’:

   |image59|

#. Go back to the Postman window and select the “Step 2: Get TENANT
   Service Catalog Template” item in the collection. Click the ‘Send’
   button and examine the response. Notice that the TENANT definition of
   the service only shows fields that were marked ‘Tenant Editable’

Task 2 – Tenant L4-7 Service Deployment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will perform CRUD operations based on a deployment of
the Service Catalog Template created in the previous task.

Perform the following steps to complete this task:

#. Open a new Chrome tab to iWorkflow (https://10.1.1.6) and login with
   the credentials Username: tenant, Password: tenant. Expand the
   ‘Services’ pane.

#. Click the “Step 3: Create TENANT Service Deployment” item in the
   collection. Examine the URL and JSON body. We will be creating a
   new Tenant Service Deployment under ‘MyTenant’ with the properties
   marked as ‘Tenant Editable’ provided:

   |image60|

#. Click the ‘Send’ button to create the Service Deployment. Examine
   the response. The iWorkflow GUI in your Chrome tab will also
   reflect a new item in the Services pane:

   |image61|

#. Open a Chrome tab to BIGIP-A. Click on Application Services ->
   Applications -> Lab2.4\_HTTP\_DEMO to view the config that was
   deployed on BIG-IP:

   |image62|

#. Go back to Postman and click the “Step 4: Get TENANT Service
   Deployment” item in the collection and click ‘Send’. This item is
   example of a GET of the service definition. The response should match
   what you see in the iWorkflow GUI when viewing the properties of a
   deployment.

#. Click the “Step 5: Modify TENANT Service Deployment” item in the
   collection. This request is an example of an Update operation.
   Notice that we are sending a PUT request to the URL representing
   the service deployment. Examine the JSON body and note that in the
   ‘pool\_\_members’ table there is an additional pool member with an IP
   of 10.1.10.12 that will be added. Click the ‘Send’ button to re-deploy the service:

   |image63|

#. Verify that the pool member was added on BIG-IP:

   |image64|

#. Go back to Postman and click the “Step 6: Delete TENANT Service
   Deployment” item. This item will send a DELETE request to the URL for
   the service deployment. Click ‘Send’ and verify that the deployment
   has been removed in the iWorkflow and BIG-IP GUIs.

.. |image59| image:: /_static/image059.png
   :width: 6.00141in
   :height: 5.42733in
.. |image60| image:: /_static/image060.png
   :width: 6.55016in
   :height: 5.67733in
.. |image61| image:: /_static/image061.png
   :width: 5.72952in
   :height: 4.59302in
.. |image62| image:: /_static/image062.png
   :width: 6.39191in
   :height: 3.04651in
.. |image63| image:: /_static/image063.png
   :width: 6.55009in
   :height: 4.12209in
.. |image64| image:: /_static/image064.png
   :width: 3.93505in
   :height: 3.92733in
