.. |labmodule| replace:: 2
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Module |labmodule|\, Lab \ |labnum|\: Provisioning ASM
========================================================

Overview
---------

In this lab, the iControl REST API will be used to provision a module on the BIG-IP.  More specifically, the Application Security Manager (ASM) module will be provisioned for use in **Module 2: Programmatic WAF (Application Security Module) Configuration**.

.. NOTE::
    - Use Postman collection to complete this lab.
    - Some response content has been removed for brevity.

|labmodule|\.\ |labnum|\.1. Retrieve single module provision state
--------------------------------------------------------------------

To retrieve the provisioning state for a single module, send a HTTP GET to the REST endpoint for ``/mgmt/tm/sys/provision`` and include the name of the module.  For example, ``/mgmt/tm/sys/provision/afm``

.. Hint::  
  1) Prior to performing the below steps, validate the **{{module}}** Postman environment variable is set to **asm**.
  2) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{big_ip_a_auth_token}}
     
     | **Body**

**Example Response**

.. code-block:: rest
    :emphasize-lines: 9 

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "asm",
        "fullPath": "asm",
        "generation": 5609,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.1.0.8",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "nominal",
        "memoryRatio": 0
    }

|labmodule|\.\ |labnum|\.2. Provision ASM module
------------------------

The **asm** module is provisioned using an HTTP PATCH with a body containing a provisioning level to the REST endpoint for ``mgmt/tm/sys/provision/{{module}}``.

.. WARNING:: 
   - This step is optional and should only be performed if **asm** is **not** provisioned.
   - Performing a provision/deprovision operation takes some time to complete.  If the original request is still being processed, the below error may be encountered.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         PATCH

     | **URL**
     
     ::
     
         https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{big_ip_a_auth_token}}
     
     | **Body**
	 
     ::
     
         {
             "level":"nominal"
         }


**Example Response**

.. code-block:: rest
    :emphasize-lines: 9

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "asm",
        "fullPath": "asm",
        "generation": 10636,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.1.0.8",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "nominal",
        "memoryRatio": 0
    }
