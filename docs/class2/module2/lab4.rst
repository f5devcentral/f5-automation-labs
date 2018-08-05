.. |labmodule| replace:: 2
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Run a workflow with f5-newman-wrapper
-------------------------------------------------------------------

In this lab we will use the f5-super-netops-container to run the workflow we
reviewed in the previous lab.  The advantage of using the f5-super-netops
Container is that all the tools, collections and frameworks are pre-installed
and ready to use.

Task 1 - Run a f5-newman-wrapper Workflow
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Return to, or open an SSH session as described in the :ref:`previous lab <lab1_3_1>`
#. Run ``cd f5-postman-workflows/local``
#. Run ``cp ../workflows/Wrapper_Demo_1.json .``
#. Edit the ``Wrapper_Demo_1.json`` file with ``vim`` and enter the ``10.1.1.10`` for
   the value of the ``bigip_mgmt`` variable

   .. code:: json

        "globalVars": {
                "bigip_mgmt": "10.1.1.10",
                "bigip_username":"admin",
                "bigip_password":"admin"
        },

#. Run ``f5-newman-wrapper Wrapper_Demo_1.json``
#. Examine the output to see how the workflow was executed.  Notice that
   the same tests that we saw when using Postman are present during this
   run.

   Example output:

   .. code::


        [snops@f5-super-netops] [~/f5-postman-workflows/local] $ f5-newman-wrapper Wrapper_Demo_1.json
        [Wrapper_Demo_1-2017-03-30-04-08-12] starting run
        [Wrapper_Demo_1-2017-03-30-04-08-12] [runCollection][Authenticate to BIG-IP] running...
        newman

        BIGIP_API_Authentication

        ❏ 1_Authenticate
        ↳ Authenticate and Obtain Token
          POST https://10.1.1.10/mgmt/shared/authn/login [200 OK, 1.41KB, 108ms]
          ✓  [POST Response Code]=200
          ✓  [Populate Variable] bigip_token=WYKIVPHCNASNVEC55ZDVNH5OO2

        ↳ Verify Authentication Works
          GET https://10.1.1.10/mgmt/shared/authz/tokens/WYKIVPHCNASNVEC55ZDVNH5OO2 [200 OK, 1.23KB, 8ms]
          ✓  [GET Response Code]=200
          ✓  [Current Value] token=WYKIVPHCNASNVEC55ZDVNH5OO2
          ✓  [Check Value] token == WYKIVPHCNASNVEC55ZDVNH5OO2

        ↳ Set Authentication Token Timeout
          PATCH https://10.1.1.10/mgmt/shared/authz/tokens/WYKIVPHCNASNVEC55ZDVNH5OO2 [200 OK, 1.23KB, 14ms]
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
        │ total run duration: 297ms                     │
        ├───────────────────────────────────────────────┤
        │ total data received: 1.71KB (approx)          │
        ├───────────────────────────────────────────────┤
        │ average response time: 43ms                   │
        └───────────────────────────────────────────────┘
        [Wrapper_Demo_1-2017-03-30-04-08-12] [runCollection][Get BIG-IP Software Version] running...
        newman

        BIGIP_Operational_Workflows

        ❏ 4A_Get_BIGIP_Version
        ↳ Get Software Version
          GET https://10.1.1.10/mgmt/tm/sys/software/volume [200 OK, 1.32KB, 16ms]
          ✓  [GET Response Code]=200
          ✓  [Populate Variable] bigip_version=12.1.1
          ✓  [Populate Variable] bigip_build=1.0.196
        [Wrapper_Demo_1-2017-03-30-04-08-12] run completed

        ┌─────────────────────────┬──────────┬──────────┐
        │                         │ executed │   failed │
        ├─────────────────────────┼──────────┼──────────┤
        │              iterations │        1 │        0 │
        ├─────────────────────────┼──────────┼──────────┤
        │                requests │        1 │        0 │
        ├─────────────────────────┼──────────┼──────────┤
        │            test-scripts │        1 │        0 │
        ├─────────────────────────┼──────────┼──────────┤
        │      prerequest-scripts │        0 │        0 │
        ├─────────────────────────┼──────────┼──────────┤
        │              assertions │        3 │        0 │
        ├─────────────────────────┴──────────┴──────────┤
        │ total run duration: 58ms                      │
        ├───────────────────────────────────────────────┤
        │ total data received: 611B (approx)            │
        ├───────────────────────────────────────────────┤
        │ average response time: 16ms                   │
        └───────────────────────────────────────────────┘
#. Examine the environment variables that were saved at the end of the
   run by executing ``cat Wrapper_Demo_1-env.json``

   Example output:

   .. code-block:: json
      :linenos:
      :emphasize-lines: 29-38

      {
        "id": "c0550892-36d4-4412-bf35-a1d9aa8d2efe",
        "values": [
          {
            "type": "any",
            "value": "10.1.1.10",
            "key": "bigip_mgmt"
          },
          {
            "type": "any",
            "value": "admin",
            "key": "bigip_username"
          },
          {
            "type": "any",
            "value": "admin",
            "key": "bigip_password"
          },
          {
            "type": "any",
            "value": "WYKIVPHCNASNVEC55ZDVNH5OO2",
            "key": "bigip_token"
          },
          {
            "type": "any",
            "value": "1200",
            "key": "bigip_token_timeout"
          },
          {
            "type": "any",
            "value": "13.1.0.8",
            "key": "bigip_version"
          },
          {
            "type": "any",
            "value": "0.0.3",
            "key": "bigip_build"
          }
        ]
      }

Notice that the ``bigip_version`` and ``bigip_build`` variables were
saved, similar to how this was shown in the Postman GUI Environment Variables.
This file is JSON formatted and can easily be used directly
by other tools to drive further automation.
