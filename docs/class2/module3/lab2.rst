.. |labmodule| replace:: 3
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Execute an f5-newman-wrapper for **Build**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Your environment has already been seeded with 5 ``f5-newman-wrapper`` files, these
files will execute against the collections noted in the previous lab. This lab
will cover the **Build** aspect, creating a Virtual Server Framework containing all
the pieces required for this demo service.


..NOTE:: This is a Postman Collection, and can be imported into the client for viewing


For a visual reference of what f5-programmability-class-2.postman_collection.json looks like:

|image90|

.. NOTE:: You do not need to have all these operations individually broken out, it is shown this way to educate that Workflows can be as small (update a pool member) or as large (deploy a whole service) as needed

Task 1 - Examine f5-newman-build-1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. NOTE:: The contents of this folder contain files for this lab and upcoming labs in this class

#. Open Putty and connect to the ``super-netops-container`` user credentials are ``snops`` and ``default``
#. Navigate to the location containing the f5-newman-wrapper files ``cd ~/f5-automation-labs/jenkins/f5-newman-build``
#. Let's examine the contents of the first f5-newman-wrapper file ``cat f5-newman-build-1``

   .. code-block:: json
     :linenos:

     {
            "name":"f5-newman-build-1",
            "description":"Execute a chained workflow that authenticates to a BIG-IP and builds configuration",
            "globalEnvVars":"/home/snops/f5-postman-workflows/framework/f5-postman-workflows.postman_globals.json",
            "globalOptions": {
                    "insecure":true,
                    "reporters":["cli"]
            },
            "globalVars": {
                    "bigip_mgmt": "10.1.1.4",
                    "bigip_username":"admin",
                    "bigip_password":"admin",
                    "bigip_partition":"Common",
                    "bigip_pool_name":"module_3_pool",
                    "bigip_pool_member":"75.67.228.133:80",
                    "bigip_object_state":"user-up",
                    "bigip_object_session":"user-enabled",
                    "bigip_vs_name":"module_3_vs",
                    "bigip_vs_destination":"10.1.20.129:80",
                    "bigip_node_name":"75.67.228.133",
                    "bigip_http_monitor":"module_3_http_monitor",
                    "bigip_http_profile":"module_3_http",
                    "bigip_tcp_profile":"module_3_tcp_clientside"
            },
            "workflow": [
                    {
                            "name":"Authenticate to BIG-IP",
                            "options": {
                                    "collection":"/home/snops/f5-postman-workflows/collections/BIG_IP/BIGIP_API_Authentication.postman_collection.json",
                                    "folder":"1_Authenticate"
                            }
                    }, (REMOVE THIS TEXT AND ADD YOUR CODE BELOW)

                }
            ]
      }


#. The above f5-newman-wrapper file only has the ``Authenticate to BIG-IP`` Collection/Folder referenced, we will now add in another collection. You are going to add this code snippet after the last ``},``. This shows the method for chaining together multiple calls from multiple sources.

  .. code-block:: json
   :linenos:

   {
        "name":"1 - Build a Basic LTM Config",
        "skip":false,
        "options": {
                "collection":"/home/snops/f5-automation-labs/postman_collections/f5-programmability-class-2.   postman_collection.json",
                "folder":"1 - Build a Basic LTM Config"
        }




.. NOTE:: Now that you have the full file you can see what it will look like. The environment variables will float into both Collections, and the returned Global Variables will persist during the whole run.

Task 2 - Execute the first f5-newman-wrapper file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Login to your BIG-IP lab machine and verify you do not have any Virtual Servers or Pools

   .. NOTE:: If you are using the F5 lab systems there are already shortcuts in your Chrome browser called ``BIG-IP A GUI``, if you receive a certificate warning accept and add exception (the BIG-IP has a self-signed cert which violates Chrome's security). BIG-IP A Login credentials are ``admin\admin``

#. ``f5-newman-build-1`` now contains the needed calls to build the Framework of an Application Service (Virtual Server, Pool and needed Profiles), it doesn't however include any pool members.

   Execute: ``f5-newman-wrapper f5-newman-build-1``

   Output should look like:

   .. code-block:: console
      :linenos:

      $ f5-newman-wrapper f5-newman-build-1
      [f5-newman-build-1-2017-07-26-08-23-00] starting run
      [f5-newman-build-1-2017-07-26-08-23-00] [runCollection][Authenticate to BIG-IP]   running...
      newman

      BIGIP_API_Authentication

      ❏ 1_Authenticate
      ↳ Authenticate and Obtain Token
        POST https://10.1.1.4/mgmt/shared/authn/login [200 OK, 1.41KB, 505ms]
        ✓  [POST Response Code]=200
        ✓  [Populate Variable] bigip_token=MB4YMPICV3XEZ3B47LJRQKGHTJ

      ↳ Verify Authentication Works
       GET https://10.1.1.4/mgmt/shared/authz/tokens/MB4YMPICV3XEZ3B47LJRQKGHTJ [200   OK, 1.23KB, 17ms]
       ✓  [GET Response Code]=200
       ✓  [Current Value] token=MB4YMPICV3XEZ3B47LJRQKGHTJ
       ✓  [Check Value] token == MB4YMPICV3XEZ3B47LJRQKGHTJ

      ↳ Set Authentication Token Timeout
       PATCH https://10.1.1.4/mgmt/shared/authz/tokens/MB4YMPICV3XEZ3B47LJRQKGHTJ [  200 OK, 1.23KB, 50ms]
       ✓  [PATCH Response Code]=200
       ✓  [Current Value] timeout=1200
       ✓  [Check Value] timeout == 1200

      ┌─────────────────────────┬──────────┬──────────┐
      │                         │ executed │   failed │
      ├─────────────────────────┼──────────┼──────────┤
      │              iterations │        1 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │                requests │        3 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │            test-scripts │        3 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │      prerequest-scripts │        1 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │              assertions │        8 │        0 │
      ├─────────────────────────┴──────────┴──────────┤
      │ total run duration: 1197ms                    │
      ├───────────────────────────────────────────────┤
      │ total data received: 1.71KB (approx)          │
      ├───────────────────────────────────────────────┤
      │ average response time: 190ms                  │
      └───────────────────────────────────────────────┘
      [f5-newman-build-1-2017-07-26-08-23-00] [runCollection][1 - Build a Basic LTM   Config] running...
      newman

      f5-programmability-class-2

      ❏ 1 - Build a Basic LTM Config
      ↳ Step 1: Create a HTTP Monitor
       POST https://10.1.1.4/mgmt/tm/ltm/monitor/http [200 OK, 1.32KB, 625ms]

      ↳ Step 2: Create a Pool
       POST https://10.1.1.4/mgmt/tm/ltm/pool [200 OK, 1.56KB, 157ms]

      ↳ Step 3: Create a HTTP Profile
       POST https://10.1.1.4/mgmt/tm/ltm/profile/http [200 OK, 1.96KB, 183ms]

      ↳ Step 4: Create a TCP Profile
       POST https://10.1.1.4/mgmt/tm/ltm/profile/tcp [200 OK, 2.68KB, 64ms]

      ↳ Step 5: Create a Virtual Server
       POST https://10.1.1.4/mgmt/tm/ltm/virtual [200 OK, 1.9KB, 230ms]

      ┌─────────────────────────┬──────────┬──────────┐
      │                         │ executed │   failed │
      ├─────────────────────────┼──────────┼──────────┤
      │              iterations │        1 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │                requests │        5 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │            test-scripts │        0 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │      prerequest-scripts │        0 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │              assertions │        0 │        0 │
      ├─────────────────────────┴──────────┴──────────┤
      │ total run duration: 1406ms                    │
      ├───────────────────────────────────────────────┤
      │ total data received: 5.79KB (approx)          │
      ├───────────────────────────────────────────────┤
      │ average response time: 251ms                  │
      └───────────────────────────────────────────────┘
      [f5-newman-build-1-2017-07-26-08-23-00] run completed in 6s, 90.207 ms

   .. NOTE:: Notice the 200 OK responses, the number of requests ect, we're building in testing and logging, at this point look back at ``BIGIP-A`` for the newly created framework

#. On BIG-IP A, examine Virtual Server ``module_3_vs``:

   |image91|

#. On BIG-IP A, examine Pool ``module_3_pool``:

   |image92|

Task 3 - Execute the second f5-newman-wrapper file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. ``f5-newman-build-2`` contains calls to add pool members to the Framework of the Application Service created above; this is done independently of the build, to show staging as a possible use case.

   Execute: ``f5-newman-wrapper f5-newman-build-2``

   Output should look like:

   .. code-block:: console
      :linenos:

      $ f5-newman-wrapper f5-newman-build-2
      [f5-newman-build-2-2017-07-26-08-40-52] starting run
      [f5-newman-build-2-2017-07-26-08-40-52] [runCollection][Authenticate to BIG-IP] running...
      newman

      BIGIP_API_Authentication

      ❏ 1_Authenticate
      ↳ Authenticate and Obtain Token
       POST https://10.1.1.4/mgmt/shared/authn/login [200 OK, 1.41KB, 272ms]
       ✓  [POST Response Code]=200
       ✓  [Populate Variable] bigip_token=WSNAXWTCWNZGJG7MDBVF6CRXTB

      ↳ Verify Authentication Works
       GET https://10.1.1.4/mgmt/shared/authz/tokens/WSNAXWTCWNZGJG7MDBVF6CRXTB [200 OK, 1.23KB, 15ms]
       ✓  [GET Response Code]=200
       ✓  [Current Value] token=WSNAXWTCWNZGJG7MDBVF6CRXTB
       ✓  [Check Value] token == WSNAXWTCWNZGJG7MDBVF6CRXTB

      ↳ Set Authentication Token Timeout
       PATCH https://10.1.1.4/mgmt/shared/authz/tokens/WSNAXWTCWNZGJG7MDBVF6CRXTB [200 OK, 1.23KB, 61ms]
       ✓  [PATCH Response Code]=200
       ✓  [Current Value] timeout=1200
       ✓  [Check Value] timeout == 1200

      ┌─────────────────────────┬──────────┬──────────┐
      │                         │ executed │   failed │
      ├─────────────────────────┼──────────┼──────────┤
      │              iterations │        1 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │                requests │        3 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │            test-scripts │        3 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │      prerequest-scripts │        1 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │              assertions │        8 │        0 │
      ├─────────────────────────┴──────────┴──────────┤
      │ total run duration: 1034ms                    │
      ├───────────────────────────────────────────────┤
      │ total data received: 1.71KB (approx)          │
      ├───────────────────────────────────────────────┤
      │ average response time: 116ms                  │
      └───────────────────────────────────────────────┘
      [f5-newman-build-2-2017-07-26-08-40-52] [runCollection][2 - Add Members to LTM Config] running...
      newman

      f5-programmability-class-2

      ❏ 2 - Add Members to LTM Config
      ↳ Step 1: Add Members to  Pool
       PATCH https://10.1.1.4/mgmt/tm/ltm/pool/module_3_pool [200 OK, 1.52KB, 143ms]

      ┌─────────────────────────┬──────────┬──────────┐
      │                         │ executed │   failed │
      ├─────────────────────────┼──────────┼──────────┤
      │              iterations │        1 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │                requests │        1 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │            test-scripts │        0 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │      prerequest-scripts │        0 │        0 │
      ├─────────────────────────┼──────────┼──────────┤
      │              assertions │        0 │        0 │
      ├─────────────────────────┴──────────┴──────────┤
      │ total run duration: 182ms                     │
      ├───────────────────────────────────────────────┤
      │ total data received: 818B (approx)            │
      ├───────────────────────────────────────────────┤
      │ average response time: 143ms                  │
      └───────────────────────────────────────────────┘
      [f5-newman-build-2-2017-07-26-08-40-52] run completed in 4s, 328.497 ms

#. On BIG-IP A examine Virtual Server ``module_3_vs``, the Virtual Server should be healthy and Green:

   |image93|

#. On BIG-IP A examine Pool ``module_3_pool``:

   |image94|

.. |image90| image:: /_static/class2/image090.png
   :scale: 70%
.. |image91| image:: /_static/class2/image091.png
   :scale: 70%
.. |image92| image:: /_static/class2/image092.png
   :scale: 70%
.. |image93| image:: /_static/class2/image093.png
   :scale: 70%
.. |image94| image:: /_static/class2/image094.png
   :scale: 70%
