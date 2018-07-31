.. |labmodule| replace:: 1
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Provisioning AFM
==============================================

Overview
--------

In this lab, the iControl REST API will be used to provision a module on the BIG-IP.  More specifically, the Advanced Firewall Manager (AFM) module will be provisioned for use in **Module 2: Configuring AFM (Advanced Firewall Module)**.

Specific Instructions
---------------------

Prior to performing the below steps, validate the **{{module}}** Postman environment variable.  The **{{module}}** should be set to **afm**.

Follow the below steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for reference.

.. ATTENTION:: Some response content has been removed for brevity.

|labmodule|\.\ |labnum|\.1. Retrieve all module provision states
---------------------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision

**Headers**

:: 

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Example Response**

.. NOTE:: The **afm** module is currently provisioned for **none** while the **ltm** module is provisioned for **nominal**.

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

|labmodule|\.\ |labnum|\.2. Retrieve single module provision state
-----------------------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Example Response**

.. NOTE:: The **afm** module should still be provisioned after performing the steps in Lab 1.

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

|labmodule|\.\ |labnum|\.3.1. Provision module
--------------------------------


.. WARNING:: This step is optional and should only be performed if **afm** is not provisioned.

The **afm** module is provisioned using an HTTP PATCH with a body containing a provisioning level to the REST endpoint for ``mgmt/tm/sys/provision/{{module}}``.  Edit the body to add the provisioned level.

.. NOTE:: Performing a provision/deprovision operation takes some time to complete.  If the original request is still being processed, the below error may be encountered.

.. code-block:: rest

    {
        "code": 400,
        "message": "01071003:3: A previous provisioning operation is in progress. Try again when the BIGIP is active.",
        "errorStack": [],
        "apiError": 3
    }

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

.. code-block:: rest
    :emphasize-lines: 2

    {
        "level":""
    }

**Example Response**

.. NOTE:: The **afm** module has been provisioned with a **level** of **nominal**.

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

|labmodule|\.\ |labnum|\.3.2. Deprovision module
-----------------------

This request will serve as an example of how to deprovision a BIG-IP module.  Edit the body to change the provisioned level to "none".

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

::

    {
        "level":""
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

|labmodule|\.\ |labnum|\.3.3. Re-provision module
------------------------

Re-provision the **afm** module to nominal if previously deprovisioned.

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

::

    {
        "level":""
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
