.. |labmodule| replace:: 4
.. |labnum| replace:: 5
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Building Complex Workflows
--------------------------------------------------------

In the previous lab we reviewed and ran a very simple workflow.  To support
more complex use cases f5-newman-wrapper includes features to help build more
complex workflows.

These features allow users to:

- Create infinately nested items
- Rename/remap variables name pre and post run of an item
- Load variables from a saved environment file
- Define variables in the global (workflow) or local (item) scope

To explore all the available options currently implemented please refer to
https://raw.githubusercontent.com/0xHiteshPatel/f5-postman-workflows/master/framework/f5-newman-wrapper/workflow-schema.json

Task 1 - Explore Nested Workflows & Variable Remapping
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

By using the 'children' array within an item in a workflow you can create 
nested items.  In this task, we will create a more advanced version of the 
workflow we used in the previous lab.  This workflow will perform authentication
to two BIG-IP devices and then retrieve the software version running on each.

We will implement a workflow that is best depicted by the following branch 
diagram:

.. code::

   Start
     |
     |- Authenticate
     |  |- Authenticate to BIG-IP A
     |  |- Authenticate to BIG-IP B
     |
     |- Get BIGIP Version
     |  |- Get BIGIP Version on BIG-IP A
     |  |- Get BIGIP Version on BIG-IP B
     |
   Stop

To implement this workflow we need to consider how Input Variables are passed
to each item in the workflow.  Previously, we saw that the following variables 
are required to the the ``1_Authenticate`` folder in the 
``BIGIP_API_Authentication`` collection:

- ``bigip_mgmt``
- ``bigip_username``
- ``bigip_password``

The issue we encounter when building this workflow is that we, at a minimum, 
have different values for ``bigip_mgmt`` because we are trying to communicate
with two BIG-IP devices.  To address this issue, we could define our input 
variables as follows:

- ``bigip_a_mgmt = 10.1.1.4``
- ``bigip_b_mgmt = 10.1.1.5``
- ``bigip_username = admin``
- ``bigip_password = admin``

This solves the problem of providing both BIG-IP management addresses, however, 
it introduces another issue.  The ``1_Authenticate`` folder requires that the
management IP address be passed in the ``bigip_mgmt`` input variable.  To solve
this issue, we will use variable name remapping to remap a globalVar to a
different name before the ``1_Authenticate`` folder is run for each BIG-IP
device.  To illustrate this, we will add more information to our diagram:

.. code::

   Start
     |
     |- Define globalVars
     |  |- bigip_a_mgmt = 10.1.1.4
     |  |- bigip_b_mgmt = 10.1.1.5
     |  |- bigip_username = admin
     |  |- bigip_password = admin
     |
     |- Authenticate
     |  |- Authenticate to BIG-IP A
     |  |  | Pre-run: Remap bigip_a_mgmt -> bigip_mgmt
     |  |  |     Run: 1_Authenticate folder
     |  |
     |  |- Authenticate to BIG-IP B
     |  |  | Pre-run: Remap bigip_b_mgmt -> bigip_mgmt
     |  |  |     Run: 1_Authenticate folder
     |
     |- Get BIGIP Version
     |  |- Get BIGIP Version on BIG-IP A
     |  |- Get BIGIP Version on BIG-IP B
     |
   Stop

We've now addressed our issues regarding defining and passing the BIG-IP
management address, but have to consider one last problem.  The **output
variable** of the ``1_Authenticate`` folder is ``bigip_token``.  By default
f5-newman-wrapper will store all output variables from one folder and
automatically pass them to the next item.  In this case, an issue occurs because
the ``Authenticate to BIG-IP B`` item will overwrite the ``bigip_token`` 
variable that was outputted by the ``Authenticate to BIG-IP A`` item.  To 
resolve this issue, we can remap variables **AFTER** or post-run of an item.  We 
can modify our diagram to handle this issue like this:

.. code::

   Start
     |
     |- Define globalVars
     |  |- bigip_a_mgmt = 10.1.1.4
     |  |- bigip_b_mgmt = 10.1.1.5
     |  |- bigip_username = admin
     |  |- bigip_password = admin
     |
     |- Authenticate
     |  |- Authenticate to BIG-IP A
     |  |  |  Pre-run: Remap bigip_a_mgmt -> bigip_mgmt
     |  |  |      Run: 1_Authenticate folder
     |  |  | Post-run: Remap bigip_token -> bigip_a_token
     |  |
     |  |- Authenticate to BIG-IP B
     |  |  |  Pre-run: Remap bigip_b_mgmt -> bigip_mgmt
     |  |  |      Run: 1_Authenticate folder
     |  |  | Post-run: Remap bigip_token -> bigip_b_token
     |
     |- Get BIGIP Version
     |  |- Get BIGIP Version on BIG-IP A
     |  |- Get BIGIP Version on BIG-IP B
     |
   Stop

The last step is to perform some additional pre-run remaping to pass the correct
token to the ``4A_Get_BIGIP_Version`` folder to get our BIG-IP software version.
Additionally, we will perform some post-run remaps so we can save the output
variables for each device:

.. code::

   Start
     |
     |- Define globalVars
     |  |- bigip_a_mgmt = 10.1.1.4
     |  |- bigip_b_mgmt = 10.1.1.5
     |  |- bigip_username = admin
     |  |- bigip_password = admin
     |
     |- Authenticate
     |  |- Authenticate to BIG-IP A
     |  |  |  Pre-run: Remap bigip_a_mgmt -> bigip_mgmt
     |  |  |      Run: 1_Authenticate folder
     |  |  | Post-run: Remap bigip_token -> bigip_a_token
     |  |
     |  |- Authenticate to BIG-IP B
     |  |  |  Pre-run: Remap bigip_b_mgmt -> bigip_mgmt
     |  |  |      Run: 1_Authenticate folder
     |  |  | Post-run: Remap bigip_token -> bigip_b_token
     |
     |- Get BIGIP Version
     |  |- Get BIGIP Version on BIG-IP A
     |  |  |  Pre-run: Remap bigip_a_mgmt -> bigip_mgmt
     |  |  |  Pre-run: Remap bigip_a_token -> bigip_token
     |  |  |      Run: 4A_Get_BIGIP_Version folder
     |  |  | Post-run: Remap bigip_version -> bigip_a_version
     |  |  | Post-run: Remap bigip_build -> bigip_a_build
     |  |
     |  |- Get BIGIP Version on BIG-IP B
     |  |  |  Pre-run: Remap bigip_b_mgmt -> bigip_mgmt
     |     |  Pre-run: Remap bigip_b_token -> bigip_token
     |     |      Run: 4A_Get_BIGIP_Version folder
     |     | Post-run: Remap bigip_version -> bigip_b_version
     |     | Post-run: Remap bigip_build -> bigip_b_build
     |
     |- Save globarVars to file
     |
   Stop

.. NOTE:: Collections and folders that are designed to act on multiple devices
   are designed to automatically use the ``bigip_a_...`` and ``bigip_b_...``
   syntax to avoid having to remap variables.  In this case the
   ``BIGIP_Operational_Workflows`` collection is designed to perform actions
   on **one** device at a time, thus the need for remapping of the 
   ``bigip_token`` input variables.

.. NOTE:: Another option that is available to solve this issue is to define all
   variables in the local scope for each item.  This method is not preferred 
   because it decreases portability and increases complexity in defining 
   input variables.

Task 2 - Build Complex Workflow JSON
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Define Global Settings & Variables:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: json
   :linenos:

   {
     "name":"Wrapper_Demo_2",
     "description":"Execute a chained workflow that authenticates to two BIG-IPs and retrieves their software version",
     "globalEnvVars":"../framework/f5-postman-workflows.postman_globals.json",
     "globalOptions": {
       "insecure":true,
       "reporters":["cli"]
     },
     "globalVars": {
       "bigip_a_mgmt": "10.1.1.4",
       "bigip_b_mgmt": "10.1.1.5",
       "bigip_username":"admin",
       "bigip_password":"admin"
     },
     "saveEnvVars":true,
     "outputFile":"Wrapper_Demo_2-run.json",
     "envOutputFile":"Wrapper_Demo_2-env.json"
   }

Define Authentication Items
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. NOTE:: As shown below, we can use the ``skip: true`` attribute to signal 
   f5-newman-wrapper to not run that particular item.  The items ``children`` 
   will still be processed.  The ``skip`` attribute can be used to create a 
   container for similar requests.

.. code-block:: json
   :linenos:
   :emphasize-lines: 5

   {
     "workflow": [
       {
         "name":"Authenticate to BIG-IPs",
         "skip":true,
         "children": [
           {
             "name":"Authenticate to BIG-IP A",
             "options": {
               "collection":"../collections/BIG_IP/BIGIP_API_Authentication.postman_collection.json",
               "remapPreRun": {
                 "bigip_a_mgmt": "bigip_mgmt"
               },
               "folder":"1_Authenticate",
               "remapPostRun": {
                 "bigip_token": "bigip_a_token"
               }
             }
           },
           {
             "name":"Authenticate to BIG-IP B",
             "options": {
               "collection":"../collections/BIG_IP/BIGIP_API_Authentication.postman_collection.json",
               "remapPreRun": {
                 "bigip_b_mgmt": "bigip_mgmt"
               },
               "folder":"1_Authenticate",
               "remapPostRun": {
                 "bigip_token": "bigip_b_token"
               }
             }
           }
         ]
       }
     ]
   }

The JSON above implements the following part of our branch diagram:

.. code::

    |- Authenticate
       |- Authenticate to BIG-IP A
       |  |  Pre-run: Remap bigip_a_mgmt -> bigip_mgmt
       |  |      Run: 1_Authenticate folder
       |  | Post-run: Remap bigip_token -> bigip_a_token
       |
       |- Run: Authenticate to BIG-IP B
       |  |  Pre-run: Remap bigip_b_mgmt -> bigip_mgmt
       |  |      Run: 1_Authenticate folder
       |  | Post-run: Remap bigip_token -> bigip_b_token
     
Specifically, note the use of the ``skip`` attribute on line 5 to create a 
container to group the items together.

Define Get Software Version Items
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: json
   :linenos:

   {
      "workflow": [
        {
          "name":"Get BIG-IP Software Versions",
          "skip":true,
          "children": [
            {
              "name":"Get BIG-IP A Software Version",
              "options": {
                "collection":"../collections/BIG_IP/BIGIP_Operational_Workflows.postman_collection.json",
                "remapPreRun": {
                  "bigip_a_mgmt": "bigip_mgmt",
                  "bigip_a_token": "bigip_token"
                },
                "folder":"4A_Get_BIGIP_Version",
                "remapPostRun": {
                  "bigip_version": "bigip_a_version",
                  "bigip_build": "bigip_a_build"
                }
              }
            },
            {
              "name":"Get BIG-IP B Software Version",
              "options": {
                "collection":"../collections/BIG_IP/BIGIP_Operational_Workflows.postman_collection.json",
                "remapPreRun": {
                  "bigip_b_mgmt": "bigip_mgmt",
                  "bigip_b_token": "bigip_token"
                },
                "folder":"4A_Get_BIGIP_Version",
                "remapPostRun": {
                  "bigip_version": "bigip_b_version",
                  "bigip_build": "bigip_b_build"
                }
              }
            }
          ]
        }
      ]   
   }

The JSON above implements the following part of our branch diagram:

.. code::

    |- Get BIGIP Version
       |- Get BIGIP Version on BIG-IP A
       |  |  Pre-run: Remap bigip_a_mgmt -> bigip_mgmt
       |  |  Pre-run: Remap bigip_a_token -> bigip_token
       |  |      Run: 4A_Get_BIGIP_Version folder
       |  | Post-run: Remap bigip_version -> bigip_a_version
       |  | Post-run: Remap bigip_build -> bigip_a_build
       |
       |- Get BIGIP Version on BIG-IP B
       |  |  Pre-run: Remap bigip_b_mgmt -> bigip_mgmt
          |  Pre-run: Remap bigip_b_token -> bigip_token
          |      Run: 4A_Get_BIGIP_Version folder
          | Post-run: Remap bigip_version -> bigip_b_version
          | Post-run: Remap bigip_build -> bigip_b_build

Final Workflow JSON
~~~~~~~~~~~~~~~~~~~

.. code-block:: json
   :linenos:

    {
      "name":"Wrapper_Demo_2",
      "description":"Execute a chained workflow that authenticates to two BIG-IPs and retrieves their software version",
      "globalEnvVars":"../framework/f5-postman-workflows.postman_globals.json",
      "globalOptions": {
        "insecure":true,
        "reporters":["cli"]
      },
      "globalVars": {
        "bigip_a_mgmt": "",
        "bigip_b_mgmt": "",
        "bigip_username":"admin",
        "bigip_password":"admin"
      },
      "saveEnvVars":true,
      "outputFile":"Wrapper_Demo_2-run.json",
      "envOutputFile":"Wrapper_Demo_2-env.json",
      "workflow": [
        {
          "name":"Authenticate to BIG-IPs",
          "skip":true,
          "children": [
            {
              "name":"Authenticate to BIG-IP A",
              "options": {
                "collection":"../collections/BIG_IP/BIGIP_API_Authentication.postman_collection.json",
                "remapPreRun": {
                  "bigip_a_mgmt": "bigip_mgmt"
                },
                "folder":"1_Authenticate",
                "remapPostRun": {
                  "bigip_token": "bigip_a_token"
                }
              }
            },
            {
              "name":"Authenticate to BIG-IP B",
              "options": {
                "collection":"../collections/BIG_IP/BIGIP_API_Authentication.postman_collection.json",
                "remapPreRun": {
                  "bigip_b_mgmt": "bigip_mgmt"
                },
                "folder":"1_Authenticate",
                "remapPostRun": {
                  "bigip_token": "bigip_b_token"
                }
              }
            }
          ]
        },
        {
          "name":"Get BIG-IP Software Versions",
          "skip":true,
          "children": [
            {
              "name":"Get BIG-IP A Software Version",
              "options": {
                "collection":"../collections/BIG_IP/BIGIP_Operational_Workflows.postman_collection.json",
                "remapPreRun": {
                  "bigip_a_mgmt": "bigip_mgmt",
                  "bigip_a_token": "bigip_token"
                },
                "folder":"4A_Get_BIGIP_Version",
                "remapPostRun": {
                  "bigip_version": "bigip_a_version",
                  "bigip_build": "bigip_a_build"
                }
              }
            },
            {
              "name":"Get BIG-IP B Software Version",
              "options": {
                "collection":"../collections/BIG_IP/BIGIP_Operational_Workflows.postman_collection.json",
                "remapPreRun": {
                  "bigip_b_mgmt": "bigip_mgmt",
                  "bigip_b_token": "bigip_token"
                },
                "folder":"4A_Get_BIGIP_Version",
                "remapPostRun": {
                  "bigip_version": "bigip_b_version",
                  "bigip_build": "bigip_b_build"
                }
              }
            }
          ]
        }
      ]
    }

Task 3 - Run the Workflow
^^^^^^^^^^^^^^^^^^^^^^^^^

#. Open an SSH session as described in the :ref:`previous lab <lab3_3_1>`
#. Run ``cd f5-postman-workflows/local``
#. Run ``cp ../workflows/Wrapper_Demo_2.json .``
#. Edit the ``Wrapper_Demo_2.json`` file and enter you BIG-IP managment 
   addresses

   .. code-block:: json
      :linenos:

      {
        "globalVars": {
                "bigip_a_mgmt": "10.1.1.4",
                "bigip_b_mgmt": "10.1.1.5",
                "bigip_username":"admin",
                "bigip_password":"admin"
        }
      }

#. Run ``f5-newman-wrapper Wrapper_Demo_2.json``
#. Examine the output to see how the workflow was executed.  

   Example output:



   .. code::

      [snops@f5-super-netops] [~/f5-postman-workflows/local] $ f5-newman-wrapper Wrapper_Demo_2.json
      [Wrapper_Demo_2-2017-03-30-19-22-52] starting run
      [Wrapper_Demo_2-2017-03-30-19-22-52] [runCollection][Authenticate to BIG-IP A] running...
      newman
      
      BIGIP_API_Authentication
      
      ❏ 1_Authenticate
      ↳ Authenticate and Obtain Token
        POST https://10.1.1.4/mgmt/shared/authn/login [200 OK, 1.41KB, 570ms]
        ✓  [POST Response Code]=200
        ✓  [Populate Variable] bigip_token=UE7W5CXWM5SJ6SZEV5A7KTAI5Q
      
      ↳ Verify Authentication Works
        GET https://10.1.1.4/mgmt/shared/authz/tokens/UE7W5CXWM5SJ6SZEV5A7KTAI5Q [200 OK, 1.23KB, 9ms]
        ✓  [GET Response Code]=200
        ✓  [Current Value] token=UE7W5CXWM5SJ6SZEV5A7KTAI5Q
        ✓  [Check Value] token == UE7W5CXWM5SJ6SZEV5A7KTAI5Q
      
      ↳ Set Authentication Token Timeout
        PATCH https://10.1.1.4/mgmt/shared/authz/tokens/UE7W5CXWM5SJ6SZEV5A7KTAI5Q [200 OK, 1.23KB, 13ms]
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
      │ total run duration: 740ms                     │
      ├───────────────────────────────────────────────┤
      │ total data received: 1.71KB (approx)          │
      ├───────────────────────────────────────────────┤
      │ average response time: 197ms                  │
      └───────────────────────────────────────────────┘
      [Wrapper_Demo_2-2017-03-30-19-22-52] [runCollection][Authenticate to BIG-IP B] running...
      newman
      
      BIGIP_API_Authentication
      
      ❏ 1_Authenticate
      ↳ Authenticate and Obtain Token
        POST https://10.1.1.5/mgmt/shared/authn/login [200 OK, 1.41KB, 350ms]
        ✓  [POST Response Code]=200
        ✓  [Populate Variable] bigip_token=ONQXOQPNCVOHZELKIFSPHETL3I
      
      ↳ Verify Authentication Works
        GET https://10.1.1.5/mgmt/shared/authz/tokens/ONQXOQPNCVOHZELKIFSPHETL3I [200 OK, 1.23KB, 9ms]
        ✓  [GET Response Code]=200
        ✓  [Current Value] token=ONQXOQPNCVOHZELKIFSPHETL3I
        ✓  [Check Value] token == ONQXOQPNCVOHZELKIFSPHETL3I
      
      ↳ Set Authentication Token Timeout
        PATCH https://10.1.1.5/mgmt/shared/authz/tokens/ONQXOQPNCVOHZELKIFSPHETL3I [200 OK, 1.23KB, 12ms]
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
      │ total run duration: 472ms                     │
      ├───────────────────────────────────────────────┤
      │ total data received: 1.71KB (approx)          │
      ├───────────────────────────────────────────────┤
      │ average response time: 123ms                  │
      └───────────────────────────────────────────────┘
      [Wrapper_Demo_2-2017-03-30-19-22-52] [runCollection][Get BIG-IP A Software Version] running...
      newman
      
      BIGIP_Operational_Workflows
      
      ❏ 4A_Get_BIGIP_Version
      ↳ Get Software Version
        GET https://10.1.1.4/mgmt/tm/sys/software/volume [200 OK, 1.32KB, 207ms]
        ✓  [GET Response Code]=200
        ✓  [Populate Variable] bigip_version=12.1.1
        ✓  [Populate Variable] bigip_build=1.0.196
      
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
      │ total run duration: 250ms                     │
      ├───────────────────────────────────────────────┤
      │ total data received: 611B (approx)            │
      ├───────────────────────────────────────────────┤
      │ average response time: 207ms                  │
      └───────────────────────────────────────────────┘
      [Wrapper_Demo_2-2017-03-30-19-22-52] [runCollection][Get BIG-IP B Software Version] running...
      newman
      
      BIGIP_Operational_Workflows
      
      ❏ 4A_Get_BIGIP_Version
      ↳ Get Software Version
        GET https://10.1.1.5/mgmt/tm/sys/software/volume [200 OK, 1.32KB, 191ms]
        ✓  [GET Response Code]=200
        ✓  [Populate Variable] bigip_version=12.1.1
        ✓  [Populate Variable] bigip_build=1.0.196
      
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
      │ total run duration: 230ms                     │
      ├───────────────────────────────────────────────┤
      │ total data received: 611B (approx)            │
      ├───────────────────────────────────────────────┤
      │ average response time: 191ms                  │
      └───────────────────────────────────────────────┘
      [Wrapper_Demo_2-2017-03-30-19-22-52] run completed in 3s, 316.921 ms

#. Examine the environment variables that were saved at the end of the
   run by executing ``cat Wrapper_Demo_2-env.json``. The resulting BIG-IP
   software versions are now present and have been highlighted below.

   Example output:

   .. code-block:: json
      :linenos:
      :emphasize-lines: 44-53,59-68

      {
        "id": "d459e491-4936-4be7-a910-567f711a636a",
        "values": [
          {
            "type": "any",
            "value": "10.1.1.4",
            "key": "bigip_a_mgmt"
          },
          {
            "type": "any",
            "value": "10.1.1.5",
            "key": "bigip_b_mgmt"
          },
          {
            "type": "any",
            "value": "10.1.1.5",
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
            "value": "UE7W5CXWM5SJ6SZEV5A7KTAI5Q",
            "key": "bigip_a_token"
          },
          {
            "type": "any",
            "value": "ONQXOQPNCVOHZELKIFSPHETL3I",
            "key": "bigip_b_token"
          },
          {
            "type": "any",
            "value": "ONQXOQPNCVOHZELKIFSPHETL3I",
            "key": "bigip_token"
          },
          {
            "type": "any",
            "value": "12.1.1",
            "key": "bigip_a_version"
          },
          {
            "type": "any",
            "value": "1.0.196",
            "key": "bigip_a_build"
          },
          {
            "type": "any",
            "value": "1200",
            "key": "bigip_token_timeout"
          },
          {
            "type": "any",
            "value": "12.1.1",
            "key": "bigip_b_version"
          },
          {
            "type": "any",
            "value": "1.0.196",
            "key": "bigip_b_build"
          }
        ]
      }

