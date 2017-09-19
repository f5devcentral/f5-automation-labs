.. |labmodule| replace:: 3
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Execute an f5-newman-wrapper for **Teardown**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To get ready for the next module, we're going to execute one last f5-newman-wrapper
directly. This file is designed to delete the framework and service we created in the
last few labs. We used 2 f5-newman-wrapper files to create our service, but for the deletion
we will only use 1.

Task 1 - Execute f5-newman-build-5
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Return to or open a new session to the ``super-netops-container`` user credentials are ``snops`` and ``default``
#. Navigate to the location containing the f5-newman-wrapper files ``cd ~/f5-automation-labs/jenkins/f5-newman-build``
#. On BIG-IP A examine the virtual server ``module_3_vs``, it should be active and Green:

   |image93|

#. On BIGIP-A examine the pool ``module_3_pool``, you should show 2 active members Green:

   |image94|

#. ``f5-newman-build-5`` contains calls to delete all items we've created in the last few modules

   Execute: ``f5-newman-wrapper f5-newman-build-5``

   Output should look like:

   .. code-block:: console
      :linenos:

      $ f5-newman-wrapper f5-newman-build-5
      [f5-newman-build-5-2017-07-26-09-28-13] starting run
      [f5-newman-build-5-2017-07-26-09-28-13] [runCollection][Authenticate to BIG-IP] running...
      newman

      BIGIP_API_Authentication

      ❏ 1_Authenticate
      ↳ Authenticate and Obtain Token
        POST https://10.1.1.4/mgmt/shared/authn/login [200 OK, 1.41KB, 194ms]
        ✓  [POST Response Code]=200
        ✓  [Populate Variable] bigip_token=NGEHHD6ZDJFD2MNF2UL3UXTGVH

      ↳ Verify Authentication Works
        GET https://10.1.1.4/mgmt/shared/authz/tokens/NGEHHD6ZDJFD2MNF2UL3UXTGVH [200 OK, 1.23KB, 16ms]
        ✓  [GET Response Code]=200
        ✓  [Current Value] token=NGEHHD6ZDJFD2MNF2UL3UXTGVH
        ✓  [Check Value] token == NGEHHD6ZDJFD2MNF2UL3UXTGVH

      ↳ Set Authentication Token Timeout
        PATCH https://10.1.1.4/mgmt/shared/authz/tokens/NGEHHD6ZDJFD2MNF2UL3UXTGVH [200 OK, 1.23KB, 17ms]
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
      │ total run duration: 835ms                     │
      ├───────────────────────────────────────────────┤
      │ total data received: 1.71KB (approx)          │
      ├───────────────────────────────────────────────┤
      │ average response time: 75ms                   │
      └───────────────────────────────────────────────┘
      [f5-newman-build-5-2017-07-26-09-28-13] [runCollection][5 - Clean Up Service] running...
      newman

      f5-programmability-class-2

      ❏ 5 - Clean Up Service
      ↳ Step 1: Delete a Virtual Server
        DELETE https://10.1.1.4/mgmt/tm/ltm/virtual/module_3_vs [200 OK, 740B, 57ms]

      ↳ Step 2: Delete a TCP Profile
        DELETE https://10.1.1.4/mgmt/tm/ltm/profile/tcp/module_3_tcp_clientside [200 OK, 740B, 88ms]

      ↳ Step 3: Delete a HTTP Profile
        DELETE https://10.1.1.4/mgmt/tm/ltm/profile/http/module_3_http [200 OK, 740B, 56ms]

      ↳ Step 4: Delete a Pool
        DELETE https://10.1.1.4/mgmt/tm/ltm/pool/module_3_pool [200 OK, 740B, 47ms]

      ↳ Step 5: Delete a HTTP Monitor
        DELETE https://10.1.1.4/mgmt/tm/ltm/monitor/http/module_3_http_monitor [200 OK, 740B, 59ms]

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
      │ total run duration: 445ms                     │
      ├───────────────────────────────────────────────┤
      │ total data received: 0B (approx)              │
      ├───────────────────────────────────────────────┤
      │ average response time: 61ms                   │
      └───────────────────────────────────────────────┘
      [f5-newman-build-5-2017-07-26-09-28-13] run completed in 4s, 267.464 ms


   .. NOTE:: Notice the 200 OK responses, as it completed successfully

#. On BIG-IP A examine Virtual ``module_3_vs`` and Pool ``module_3_pool`` are deleted

.. |image93| image:: /_static/class2/image093.png
   :scale: 70%
.. |image94| image:: /_static/class2/image094.png
   :scale: 70%
