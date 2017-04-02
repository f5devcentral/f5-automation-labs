.. |labmodule| replace:: 2
.. |labnum| replace:: 5
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – iWorkflow REST Proxy
--------------------------------------------------

In order to enable Imperative automation use cases, iWorkflow includes a
REST proxy that allows pass-through of REST requests to devices managed
by iWorkflow. The REST proxy feature allows customers to simplify
automation by:

-  Providing a centralized API endpoint for BIG-IP infrastructure

   -  No need to communicate with individual BIG-IP devices, only with
      iWorkflow

-  Simplified authentication

   -  Strong authentication can be implemented at iWorkflow rather than
      on each BIG-IP

-  Simplified RBAC

   -  RBAC can be implemented at iWorkflow for all devices rather on
      individual devices in the environment

The rest proxy works by passing data sent to a specific URL through to
the BIG-IP device. The root URL for a particular devices REST proxy is:

``/mgmt/shared/resolver/device-groups/cm-cloud-managed-devices/devices/<device\_uuid>/rest-proxy/``

Any URL segments included after ``…/rest-proxy/`` are forwarded unaltered
to the BIG-IP device. Query parameters (e.g. ``?expandSubcollections=true``)
are also passed unaltered along with the request type and request body.

Task 1 – Perform REST operations via the REST Proxy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will perform a sample CRUD operation utilizing the REST
Proxy. The intent of this task is to show the basic mechanism use to
perform these tasks. Simply changing the URL to include the iWorkflow
REST Proxy root for that device could easily change all the Imperative
operations we have completed in this lab to use the REST Proxy.

Perform the following steps to complete this task:

#. Expand the “Lab 2.5 – iWorkflow REST Proxy” folder in the Postman
   collection.

#. Click the “Step 1: Create pool on BIGIP-A”. Examine the request
   type, URL and JSON body. Essentially we are performing a POST to
   the ‘/mgmt/tm/ltm/pool’ collection on BIGIP-A. The last part of the
   URL includes this URI path (the part after ‘…./rest-proxy/’). The
   JSON body and all other parameters are passed unaltered. Also,
   notice that we are still using our iWorkflow Token to authenticate,
   not the BIG-IP one.

   |image65|

#. Click the “Send” button and examine the response.

#. Repeat steps 1-3 for the remaining items in the “Lab 2.5 – iWorkflow
   REST Proxy” collection. Examine each request carefully so you
   understand what is happening.

.. |image65| image:: /_static/image065.png
   :scale: 40%
