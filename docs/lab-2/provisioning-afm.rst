LAB 2.0 - Provisioning AFM
===========================

LAB 2.0 Overview
-----------------

In this lab, the iControl REST API will be used to provision a module on the BIG-IP.  More specifically, the Advanced Firewall Manager (AFM) module will be provisioned for use in **LAB 2 - CONFIGURING AFM**.

LAB 2.0 Specific Instructions
------------------------------

Prior to performing the below steps, validate the **{{module}}** Postman environment variable.  The **{{module}}** should be set to **afm**.

Follow the **LAB 2 - CONFIGURING AFM** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for reference.

.. attention:: Some response content has been removed for brevity.

1. Retrieve all module provision states
----------------------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision

**Headers**

:: 

    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

.. note:: The **afm** module is currently provisioned for **none** while the **ltm** module is provisioned for **nominal**.

.. code-block:: rest
    :emphasize-lines: 13, 24

    {
        "kind": "tm:sys:provision:provisioncollectionstate",
        "selfLink": "https://localhost/mgmt/tm/sys/provision?ver=13.0.0",
        "items": [
            {
                "kind": "tm:sys:provision:provisionstate",
                "name": "afm",
                "fullPath": "afm",
                "generation": 5609,
                "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
                "cpuRatio": 0,
                "diskRatio": 0,
                "level": "none",
                "memoryRatio": 0
            },
            {
                "kind": "tm:sys:provision:provisionstate",
                "name": "ltm",
                "fullPath": "ltm",
                "generation": 1,
                "selfLink": "https://localhost/mgmt/tm/sys/provision/ltm?ver=13.0.0",
                "cpuRatio": 0,
                "diskRatio": 0,
                "level": "nominal",
                "memoryRatio": 0
            }
        ]
    }

2. Retrieve single module provision state
------------------------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

.. note:: The **afm** module is currently not provisioned.

.. code-block:: rest
    :emphasize-lines: 9

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "afm",
        "fullPath": "afm",
        "generation": 5609,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "none",
        "memoryRatio": 0
    }

3.1. Provision module
----------------------

The **afm** module is provisioned using an HTTP PATCH with a body containing a provisioning level to the REST endpoint for ``mgmt/tm/sys/provision/{{module}}``.

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

.. code-block:: rest
    :emphasize-lines: 2

    {
        "level":"nominal"
    }

**Example Response**

.. note:: The **afm** module has been provisioned with a **level** of **nominal**.

.. code-block:: rest
    :emphasize-lines: 9

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "afm",
        "fullPath": "afm",
        "generation": 10636,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "nominal",
        "memoryRatio": 0
    }

3.2. Deprovision module
------------------------

This request is will serve as an example of how to deprovision a BIG-IP module.

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "level":"none"
    }

**Example Response**

.. code-block:: rest
    :emphasize-lines: 9

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "afm",
        "fullPath": "afm",
        "generation": 10714,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "none",
        "memoryRatio": 0
    }

3.3. Re-provision module
---------------------------

Re-provision the **afm** module if previously deprovisioned.

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "level":"nominal"
    }

**Example Response**

.. code-block:: rest
    :emphasize-lines: 9

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "afm",
        "fullPath": "afm",
        "generation": 10636,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "nominal",
        "memoryRatio": 0
    }
