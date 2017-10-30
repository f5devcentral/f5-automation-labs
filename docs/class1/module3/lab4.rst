Lab 3.4: iWorkflow REST Proxy
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
         templates [label="Templates",color="gray72"]
         catalog [label="Catalog",color="gray72"]
         deployments [label="Deployments",color="steelblue1"]
         onboarding -> templates -> catalog -> deployments
      }
   }

While the focus so far has been on building **Declarative Interfaces**
with iWorkflow, it's important to note iWorkflow can also help simplify
**Imperative** operations to BIG-IP devices when needed.

iWorkflow includes a REST proxy that allows pass-through of REST requests to
devices discovered on iWorkflow. The REST proxy feature allows customers to
simplify **Imperative** Automation by:

-  Providing a centralized API endpoint for BIG-IP infrastructure

   -  No need to communicate with individual BIG-IP devices, only with
      iWorkflow

-  Simplified authentication

   -  Strong authentication can be implemented at iWorkflow rather than
      on each BIG-IP

-  Simplified Role Based Access Control (RBAC)

   -  RBAC can be implemented at iWorkflow for all devices rather than on
      individual devices in the environment

The REST proxy works by passing data sent to a specific URL through to
the BIG-IP device. The root URL for a particular devices REST proxy is:

``/mgmt/shared/resolver/device-groups/cm-cloud-managed-devices/devices/<device\_uuid>/rest-proxy/``

Any URL segments included after ``.../rest-proxy/`` are forwarded unaltered
to the BIG-IP device. Query parameters (e.g. ``?expandSubcollections=true``)
are also passed unaltered along with the request type and request body.

Task 1 - Perform REST operations via the REST Proxy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will perform a sample CRUD operation utilizing the REST
Proxy. The intent of this task is to show the basic mechanism used to
perform these tasks. Simply changing the URL to include the iWorkflow
REST Proxy root for that device could easily change all the **Imperative**
operations we have completed in this lab to use the REST Proxy.

Perform the following steps to complete this task:

#. Expand the ``Lab 3.4 - iWorkflow REST Proxy`` folder in the Postman
   collection.

#. Click the ``Step 1: Create pool on BIG-IP A``. Examine the request
   type, URL and JSON body. Essentially we are performing a POST to
   the ‘/mgmt/tm/ltm/pool’ collection on BIG-IP A. The last part of the
   URL includes this URI path (the part after ``.../rest-proxy/``). The
   JSON body and all other parameters are passed unaltered. Also,
   notice that we are still using our iWorkflow Token to Authenticate,
   not the BIG-IP one in the :guilabel:`Headers` tab.

   |lab-4-1|

#. Click the :guilabel:`Send` button and examine the response.

#. Complete Steps 2-5 for the remaining items in the
   ``Lab 3.4 - iWorkflow REST Proxy`` collection. Examine each request
   carefully so you understand what is happening.

.. |lab-4-1| image:: images/lab-4-1.png
