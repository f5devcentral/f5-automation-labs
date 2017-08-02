.. |labmodule| replace:: 3
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Execute an f5-newman-wrapper for **Operations**
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the last lab we walked through creating an Application Service Framework, and then updating
the service framework in a separate call. This lab has 2 f5-newman-files also, one file used to
user-down a pool member, and another to user-up the same member. These could be used
as individual calls from another toolkit (which we'll see later) or run independently
as a single commands.

Task 1 - Execute f5-newman-build-3
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Open Putty and connect to the ``super-netops-container`` user credentials are ``snops`` and ``default``
#. Navigate to the location containing the f5-newman-wrapper files ``cd ~/f5-automation-labs/jenkins/f5-newman-operation``
#. On BIGIP-A examine the pool ``module_3_pool``, you should see 2 active (Green) pool members:

   |image95|

#. ``f5-newman-build-3`` contains calls to change the node state to ``user-down`` for ``"bigip_pool_member":"75.67.228.133:80"``, both of these are specified as variables in the f5-newman-wrapper files.

   Execute: ``f5-newman-wrapper f5-newman-build-3``

   Output should look like:

   .. code-block:: console
      :linenos:

      $ f5-newman-wrapper f5-newman-build-3
      [f5-newman-build-3-2017-07-26-09-06-53] starting run
      [f5-newman-build-3-2017-07-26-09-06-53] [runCollection][Authenticate to BIG-IP] running...
      newman

      BIGIP_API_Authentication

      ❏ 1_Authenticate
      ↳ Authenticate and Obtain Token
        POST https://10.1.1.4/mgmt/shared/authn/login [200 OK, 1.41KB, 267ms]
        ✓  [POST Response Code]=200
        ✓  [Populate Variable] bigip_token=JFN6TNIRAWEKNR5QPM26VT4QFE

      ↳ Verify Authentication Works
        GET https://10.1.1.4/mgmt/shared/authz/tokens/JFN6TNIRAWEKNR5QPM26VT4QFE [200 OK, 1.23KB, 22ms]
        ✓  [GET Response Code]=200
        ✓  [Current Value] token=JFN6TNIRAWEKNR5QPM26VT4QFE
        ✓  [Check Value] token == JFN6TNIRAWEKNR5QPM26VT4QFE

      ↳ Set Authentication Token Timeout
        PATCH https://10.1.1.4/mgmt/shared/authz/tokens/JFN6TNIRAWEKNR5QPM26VT4QFE [200 OK, 1.23KB, 26ms]
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
      │ total run duration: 1243ms                    │
      ├───────────────────────────────────────────────┤
      │ total data received: 1.71KB (approx)          │
      ├───────────────────────────────────────────────┤
      │ average response time: 105ms                  │
      └───────────────────────────────────────────────┘
      [f5-newman-build-3-2017-07-26-09-06-53] [runCollection][3 - Disable Node] running...
      newman

      f5-programmability-class-2

      ❏ 3 - Disable Node
      ↳ Step 1: Check Pool Exists
        GET https://10.1.1.4/mgmt/tm/ltm/pool/~Common~module_3_pool [200 OK, 1.56KB, 39ms]
        ✓  [GET Response Code]=200

      ↳ Step 2: Check Pool Member Exists
        GET https://10.1.1.4/mgmt/tm/ltm/pool/~Common~module_3_pool/members/~Common~75.67.228.133:80 [200 OK, 1.25KB, 33ms]
        ✓  [GET Response Code]=200

      ↳ Step 3: Change Pool Member State
        PUT https://10.1.1.4/mgmt/tm/ltm/pool/~Common~module_3_pool/members/~Common~75.67.228.133:80 [200 OK, 1.25KB, 298ms]
        ✓  [PUT Response Code]=200

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
      │              assertions │        3 │        0 │
      ├─────────────────────────┴──────────┴──────────┤
      │ total run duration: 1092ms                    │
      ├───────────────────────────────────────────────┤
      │ total data received: 1.89KB (approx)          │
      ├───────────────────────────────────────────────┤
      │ average response time: 123ms                  │
      └───────────────────────────────────────────────┘
      [f5-newman-build-3-2017-07-26-09-06-53] run completed in 6s, 564.868 ms


   .. NOTE:: Notice the 200 OK responses, as it completed successfully

#. Log back into BIG-IP A examine the pool ``module_3_pool`` status page:

   |image96|

Task 2 - Execute f5-newman-build-4
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Open Putty and connect to the ``super-netops-container`` user credentials are ``snops`` and ``default``
#. Navigate to the location containing the f5-newman-wrapper files ``cd ~/f5-automation-labs/jenkins/f5-newman-operation``
#. On BIG-IP A examine the pool ``module_3_pool``, you should show only 1 Active and Green:

   |image96|

#. ``f5-newman-build-3`` contains calls to user-up variable node ``"bigip_pool_member":"75.67.228.133:80"``

   Execute: ``f5-newman-wrapper f5-newman-build-4``

   Output should look like:

   .. code-block:: console
       :linenos:

       $ f5-newman-wrapper f5-newman-build-4
       [f5-newman-build-4-2017-07-26-09-12-47] starting run
       [f5-newman-build-4-2017-07-26-09-12-47] [runCollection][Authenticate to BIG-IP] running...
       newman

       BIGIP_API_Authentication

       ❏ 1_Authenticate
       ↳ Authenticate and Obtain Token
         POST https://10.1.1.4/mgmt/shared/authn/login [200 OK, 1.41KB, 240ms]
         ✓  [POST Response Code]=200
         ✓  [Populate Variable] bigip_token=LN5IEBCKW5TTNXZLX5VYRUTOW5

       ↳ Verify Authentication Works
         GET https://10.1.1.4/mgmt/shared/authz/tokens/LN5IEBCKW5TTNXZLX5VYRUTOW5 [200 OK, 1.23KB, 15ms]
         ✓  [GET Response Code]=200
         ✓  [Current Value] token=LN5IEBCKW5TTNXZLX5VYRUTOW5
         ✓  [Check Value] token == LN5IEBCKW5TTNXZLX5VYRUTOW5

       ↳ Set Authentication Token Timeout
         PATCH https://10.1.1.4/mgmt/shared/authz/tokens/LN5IEBCKW5TTNXZLX5VYRUTOW5 [200 OK, 1.23KB, 27ms]
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
       │ total run duration: 922ms                     │
       ├───────────────────────────────────────────────┤
       │ total data received: 1.71KB (approx)          │
       ├───────────────────────────────────────────────┤
       │ average response time: 94ms                   │
       └───────────────────────────────────────────────┘
       [f5-newman-build-4-2017-07-26-09-12-47] [runCollection][4 - Enable Node] running...
       newman

       f5-programmability-class-2

       ❏ 4 - Enable Node
       ↳ Step 1: Check Pool Exists
         GET https://10.1.1.4/mgmt/tm/ltm/pool/~Common~module_3_pool [200 OK, 1.56KB, 31ms]
         ✓  [GET Response Code]=200

       ↳ Step 2: Check Pool Member Exists
         GET https://10.1.1.4/mgmt/tm/ltm/pool/~Common~module_3_pool/members/~Common~75.67.228.133:80 [200 OK, 1.25KB, 28ms]
         ✓  [GET Response Code]=200

       ↳ Step 3: Change Pool Member State
         PUT https://10.1.1.4/mgmt/tm/ltm/pool/~Common~module_3_pool/members/~Common~75.67.228.133:80 [200 OK, 1.25KB, 62ms]
         ✓  [PUT Response Code]=200

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
       │              assertions │        3 │        0 │
       ├─────────────────────────┴──────────┴──────────┤
       │ total run duration: 519ms                     │
       ├───────────────────────────────────────────────┤
       │ total data received: 1.89KB (approx)          │
       ├───────────────────────────────────────────────┤
       │ average response time: 40ms                   │
       └───────────────────────────────────────────────┘
       [f5-newman-build-4-2017-07-26-09-12-47] run completed in 4s, 510.429 ms

   .. NOTE:: Notice the 200 OK responses, as it completed successfully

#. On BIG-IP A examine Pool ``module_3_pool``:

   |image95|

.. |image95| image:: /_static/class2/image095.png
   :scale: 70%
.. |image96| image:: /_static/class2/image096.png
   :scale: 70%
