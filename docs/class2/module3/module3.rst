Module 3: Stitching Workflows from Class 1 into new Orchestratable Collections
==============================================================================

In the previous module we saw the example of stitching together the authentication
folder and some facts gathering. We will now start to stitch together the Postman
Collection from Class 1 and the Authentication Collection from Module 2. Once we
validate the new file we'll use f5-newman-wrapper to execute.


In order to assist users with automating the F5 BIG-IP platform we have
developed a Collection of calls that can be used with the Postman REST Client
(http://getpostman.com).  The purpose of the tools are:

- f5-postman-workflows

  - Provide re-usable JavaScript functions that ease testing of API responses
    and populating environment variables
  - Implement a delay-based polling mechanism

- F5_Automation_Orchestration_Intro (Class 1)

  - F5's training collection for **Onboarding** BIG-IP
  - F5's training collection for **Operating** BIG-IP

Stitching together the collections and workflows allows Super-NetOps engineers
the ability to start quickly Orchestrating calls to run Automation workflows.

Using this structure also allow you to build your own solutions, to manage BIG-IP
quickly as native REST calls are used.

From the previous labs you should already have your Super-NetOps-Container already
running, if it's not please refer to Module 1.3 on starting your service.

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
