.. |labmodule| replace:: 4
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Manually Execute a Workflow
---------------------------------------------------------

In this lab we will walk through how to obtain two collections that use
the f5-postman-workflows framework and execute a simple workflow using the
Postman GUI client.  The f5-postman-workflows GitHub repository is continually
updated with new collections that can be used as is, or customized, to automate
the F5 platform.  Additionally the f5-super-netops Container automatically
downloads these and other tools so users can rapidly execute workflows in their
environments.

Postman collections also serve as a reference example of how various tasks can
be accomplished using an **Imperative** process.  When executing a collection
you are actually providing a **Declarative** input to an **Imperative** process.

Collections are self-documenting and we will explore how to access the included
documentation to assemble a workflow from start to end.  In the next lab we will
use this base knowledge to create workflows as JSON templates that can be
executed by the f5-newman-wrapper on the f5-super-netops Container image (or
any system that has Newman installed)

Task 1 - Import and Explore BIG-IP Collections
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We will import two collections to Postman using the same steps in the previous
labs.  The collections will allow us to perform REST API Authentication to
BIG-IP devices and then execute Operational actions on the BIG-IP device.

Execute the following steps to complete this task:

#. Click Import -> Import from Link and import these collection URLs:

   - ``https://raw.githubusercontent.com/0xHiteshPatel/f5-postman-workflows/master/collections/BIG_IP/BIGIP_API_Authentication.postman_collection.json``
   - ``https://github.com/0xHiteshPatel/f5-postman-workflows/blob/master/collections/BIG_IP/BIGIP_Operational_Workflows.postman_collection.json``

#. You should now have two additional Collections in the sidebar:

   - BIGIP_API_Authentication
   - BIGIP_Operational_Workflows

#. Expand the ``BIGIP_API_Authentication`` collection.  Within the
   collection you will see one folder named ``1_Authenticate``.  Folders
   are used to organize various workflows within a collection.  In this case
   this collection performs exactly one task, authetication, therefore one
   folder is present.
#. Expand the ``1_Authenticate`` folder.  Notice there are three requests
   in the folder.  These three requests will be executed in a synchronous
   manner (one-after-another).
#. Click the ``...`` icon on the ``1_Authenticate`` folder, then click
   ``Edit``

   |image82|
#. In the following window you will see documentation explaining what the
   requests in this folder accomplish.  Additionally you will see a series
   of Input and Output variables.  Unless marked otherwise it is assumed
   that all Input variables are required.  In this case the
   ``bigip_token_timeout`` variable is optional.

   Folders may also contain output variables that are set to pass data
   between requests in different collections.  In this case the output
   variable is named ``bigip_token`` and contains the authentication token
   that can be sent in the ``X-F5-Auth-Token`` HTTP header to perform
   authentication.
#. Close the window by clicking 'Cancel'
#. Repeat the steps above and explore the ``BIGIP_Operational_Workflows``
   collection, specifically the ``4A_Get_BIGIP_Version`` folder

Task 2 - Manually Chain Folders into a Workflow
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this task we will explore how to chain two folders together and manually
execute a workflow.  This example is simple, but should help illustrate
how we can use folders as building blocks that can be assembled or chained
together to construct a workflow.

We will use the ``1_Authenticate`` folder in the ``BIGIP_API_Authentication``
collection and then pass the authentication token to the
``4A_Get_BIGIP_Version`` folder in the ``BIGIP_Operational_Workflows``
collection.

Execute the following steps to complete this task:

#. Create a new Postman environment by clicking the Gear icon -> Manage
   Environments -> Add.
#. Name the environment ``Lab 4.2`` and populate the following key/value
   pairs:

   - **bigip_mgmt**: 10.1.1.4
   - **bigip_username**: admin
   - **bigip_password**: admin

#. Click the 'Add' button, then close the 'Manage Environments' window.
#. Select the ``Lab 4.2`` environment:

   |image83|

The preceeding steps configured the Input Variables required for all the folders
that comprise our workflow.  We will now manually execute all the requests in
the folders.

#. Expand the ``BIGIP_API_Authentication`` -> ``1_Authenticate`` folder.
#. Select the ``Authenticate and Obtain Token`` item and click ``Send``
#. Examine the ``Tests`` in the response portion of the request.  All the
   tests should be passing.  Additionally you should see a test similar to:

   ``[Populate Variable] bigip_token=....``

   |image85|

   These tests items and there corresponding actions (populating a variable
   in this case) are generated by the f5-postman-workflows framework.
#. Examine your Postman Environment variables and confirm that the
   ``bigip_token`` variable is present and populated.

   |image84|

#. Select the ``Verify Authentication Works`` request in the folder and click
   'Send'.  Examine the Tests and ensure they are all passing
#. Select the ``Set Authentication Token Timeout`` request, click `Send` and
   verify all Tests pass.

At this point we have successfully authenticated to our device and stored the
authentication token in the ``bigip_token`` environment variable.  We will now
execute a request in a different collection and folder that uses the
``bigip_token`` variable value to autheticate and perform it's actions.

#. Expand the ``BIGIP_Operational_Workflows`` -> ``4A_Get_BIGIP_Version``
   folder.
#. Click the ``Get Software Version`` request.
#. Click the 'Headers' tab.  Notice that the value for the
   ``X-F5-Auth-Token`` header is populated with the ``bigip_token`` variable
   value.

   .. NOTE:: Postman uses the ``{{variable_name}}`` syntax to perform
      variable value substitution.

   |image86|

#. Click 'Send' to send the request.  Examine the Tests and ensure all tests
   have passed.
#. Examine your environment variables and note that the ``bigip_version``
   and ``bigip_build`` variables are now populated.

While the example above was simple it should show how we can chain together
different collections and folders to assemble custom workflows.  The key
concepts to understand are:

- The f5-postman-workflows framework and collection test code perform
  unit tests on the response data and verify the request executed
  successfully.
- The framework also populates Output Variables as documented so they can
  be used in subsequent requests as Inputs to assemble a workflow

Next, we will explore how to use this base knowledge to assemble various
collections and folders into workflows using Newman and the f5-newman-wrapper.

.. |image82| image:: /_static/image082.png
   :scale: 100%

.. |image83| image:: /_static/image083.png
   :scale: 100%

.. |image84| image:: /_static/image084.png
   :scale: 100%

.. |image85| image:: /_static/image085.png
   :scale: 100%

.. |image86| image:: /_static/image086.png
   :scale: 100%
