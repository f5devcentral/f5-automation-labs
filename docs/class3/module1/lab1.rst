.. |labmodule| replace:: 1
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Module |labmodule|\, Lab \ |labnum|\: Provisioning AFM
======================================================

Overview
--------

In this lab, the iControl REST API will be used to provision a module on the BIG-IP.  More specifically, the Advanced Firewall Manager (AFM) module will be provisioned for use in **Module 1, Lab 2: Configuring AFM (Advanced Firewall Module)**.

.. NOTE::
    - Use Postman collection to complete this lab.
    - Some response content has been removed for brevity.

|labmodule|\.\ |labnum|\.1. Determine the license state
------------------------------------------------------------------

Before a module on a BIG-IP can be configured, it must be licensed.  Using the newly generated Authentication Token, check the license state for all modules.  This is done using an HTTP GET to the REST endpoint for ``/mgmt/tm/sys/license``.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/sys/license
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

.. NOTE::
    - The **afm** module is currently provisioned for **none** while the **ltm** module is provisioned for **nominal**.

**Example Response**

.. code-block:: rest
    :emphasize-lines: 7-15 

	},
	"https://localhost/mgmt/tm/sys/license/0/active-modules/
		%22Best%20Bundle,%20VE-10G%22": {
		"nestedStats": {
			"entries": {
				"featureModules": {
					"description": "{ \"Rate Shaping\" \"ASM, VE\" 
						\"DNS-GTM, Base, 10Gbps\" \"SSL, VE\" \"Max 
						Compression, VE\" \"AFM, VE\" \"DNSSEC\" 
						\"GTM Licensed Objects, Unlimited\" \"DNS 
						Licensed Objects, Unlimited\" \"DNS Rate 
						Fallback, 250K\" \"GTM Rate Fallback, 250K\" 
						\"GTM Rate, 250K\" \"DNS Rate Limit, 250K QPS\" 
						\"CGN, BIG-IP VE, AFM ONLY\" \"Routing 
						Bundle, VE\" \"PSM, VE\" }"
				},
				"key": {
					"description": "KYQKGYX-EPPNOGV"
				}


|labmodule|\.\ |labnum|\.2. Retrieve all module provision states
------------------------------------------------------------------

Before a module on a BIG-IP can be configured, it also must be and provisioned.  Check the provisioning state for all modules.  This is done using an HTTP GET to the REST endpoint for ``/mgmt/tm/sys/provision``.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/sys/provision
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

.. NOTE::
    - The **afm** module is currently provisioned for **none** while the **ltm** module is provisioned for **nominal**.

**Example Response**

.. code-block:: rest
    :emphasize-lines: 13, 24 

    {
        "kind": "tm:sys:provision:provisioncollectionstate",
        "selfLink": "https://localhost/mgmt/tm/sys/provision?ver=13.1.0.8",
        "items": [
            {
                "kind": "tm:sys:provision:provisionstate",
                "name": "afm",
                "fullPath": "afm",
                "generation": 5609,
                "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.1.0.8",
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
                "selfLink": "https://localhost/mgmt/tm/sys/provision/ltm?ver=13.1.0.8",
                "cpuRatio": 0,
                "diskRatio": 0,
                "level": "nominal",
                "memoryRatio": 0
            }
        ]
    }

|labmodule|\.\ |labnum|\.3. Retrieve single module provision state
--------------------------------------------------------------------

To retrieve the provisioning state for a single module, send a HTTP GET to the REST endpoint for ``/mgmt/tm/sys/provision`` and include the name of the module.  For example, ``/mgmt/tm/sys/provision/afm``

.. Hint::  
  1) Prior to performing the below steps, validate the **{{module}}** Postman environment variable is set to **afm**.
  2) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/sys/provision/{{module}}
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**


**Example Response**

.. code-block:: rest
    :emphasize-lines: 9 

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "afm",
        "fullPath": "afm",
        "generation": 5609,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.1.0.8",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "none",
        "memoryRatio": 0
    }


|labmodule|\.\ |labnum|\.4.1. Provision module
----------------------------------------------

The **afm** module is provisioned using an HTTP PATCH with a body containing a provisioning level to the REST endpoint for ``mgmt/tm/sys/provision/{{module}}``.

.. WARNING:: 
   - This step is optional and should only be performed if **afm** is **not** provisioned.
   - Performing a provision/deprovision operation takes some time to complete.  If the original request is still being processed, the below error may be encountered.

.. code-block:: rest

    {
        "code": 400,
        "message": "01071003:3: A previous provisioning operation is in progress. Try again when the BIGIP is active.",
        "errorStack": [],
        "apiError": 3
    }

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         PATCH

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/sys/provision/{{module}}
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
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
        "name": "afm",
        "fullPath": "afm",
        "generation": 10636,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.1.0.8",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "nominal",
        "memoryRatio": 0
    }


|labmodule|\.\ |labnum|\.4.2. Deprovision module
--------------------------------------------------

To deprovision a BIG-IP module, repeat step |labmodule|\.\ |labnum|\.4.1 and set the level to "none" for the selected module.


|labmodule|\.\ |labnum|\.4.3. Re-provision module
--------------------------------------------------

Repeat steps |labmodule|\.\ |labnum|\.4.1 to re-provision the **afm** module to nominal if previously deprovisioned.

.. NOTE:: 
    - The **afm** module should be provisioned to **nominal** after performing the steps in this Lab.