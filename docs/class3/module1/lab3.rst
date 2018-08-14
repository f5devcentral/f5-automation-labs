.. |labmodule| replace:: 1
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Module |labmodule|\, Lab \ |labnum|\: Create AFM Policy
========================================================

Overview
--------

In this lab, the iControl REST based API will be used to create a firewall policy that will leverage the previously created address list.

Follow the below steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for reference.

|labmodule|\.\ |labnum|\.1. List all AFM policies
--------------------------------------------------

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET
     
     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/security/firewall/policy
     
     | **Headers**
     
     ::
     
 	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

**Example Response**

.. NOTE::
    - Some response content has been removed for brevity.

::

    {
        "kind": "tm:security:firewall:policy:policycollectionstate",ƒ
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy?ver=13.0.0",
        "items": [
            {
                "kind": "tm:security:firewall:policy:policystate",
                "name": "block_all",
                "partition": "Common",
                "fullPath": "/Common/block_all",
                "generation": 5789,
                "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~block_all?ver=13.0.0",
                "rulesReference": {
                    "link": "https://localhost/mgmt/tm/security/firewall/policy/~Common~block_all/rules?ver=13.0.0",
                    "isSubcollection": true
                }
            }
        ]
    }

|labmodule|\.\ |labnum|\.2. Create an AFM policy
-------------------------------------------------

An HTTP POST to the ``/mgmt/tm/security/firewall/policy`` endpoint with a body containing just a policy name creates a firewall policy.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         POST
     
     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/security/firewall/policy
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
	 
     ::
     
         {
            "name": "global_default_deny"
         }
  2) Copy the full policy name as it appears in the ``"selfLink": "https://localhost/mgmt/tm/security/firewall/policy/``\ **~Common~global_default_deny**\ ``?ver=13.1.0.8"`` line of the response and populate the **{{afm_policy}}** Postman environment variable.  In this case, the name of the policy is **~Common~global_default_deny**.
	 

**Example Response**

.. code-block:: rest
    :emphasize-lines: 3, 7

    {
        "kind": "tm:security:firewall:policy:policystate",
        "name": "global_default_deny",
        "partition": "Common",
        "fullPath": "/Common/global_default_deny",
        "generation": 11451,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny?ver=13.1.0.8",
        "rulesReference": {
            "link": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules?ver=13.1.0.8",
            "isSubcollection": true
        }
    }



|labmodule|\.\ |labnum|\.3. List an AFM policies rules
------------------------------------------------------

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET
     
     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules
     
     | **Headers**
     
     ::
     
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

**Example Response**

.. NOTE:: There will be no rules listed in the newly created policy.  Rules are populated in the ``"items": []`` sub collection.

.. code-block:: rest
    :emphasize-lines: 4

    {
        "kind": "tm:security:firewall:policy:rules:rulescollectionstate",
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules?ver=13.1.0.8",
        "items": []
    }

|labmodule|\.\ |labnum|\.4. Add a default deny rule to a policy
----------------------------------------------------------------

An HTTP POST to the ``/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules`` endpoint with a body containing a new rule will add the rule to the firewall policy.  

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         POST
     
     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
	 
     ::
     
		{
			"name": "global_default_deny",
			"fullPath": "global_default_deny",
			"action": "drop",
			"ipProtocol": "any",
			"iruleSampleRate": 1,
			"log": "no",
			"status": "enabled",
			"destination": { },
			"place-before": "none"
		}
	 
**Example Response**

.. code-block:: rest
    :emphasize-lines: 3-4, 7-12

    {
        "kind": "tm:security:firewall:policy:rules:rulesstate",
        "name": "default_deny",
        "fullPath": "default_deny",
        "generation": 11464,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/default_deny?ver=13.1.0.8",
        "action": "drop",
        "ipProtocol": "any",
        "iruleSampleRate": 1,
        "log": "no",
        "status": "enabled",
        "destination": {},
        "source": {
            "identity": {}
        }
    }

|labmodule|\.\ |labnum|\.5. Add an address list rule to a policy
----------------------------------------------------------------

An HTTP POST to the ``/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules`` endpoint with a body containing a new rule will add the rule to the firewall policy.  The status of the rule can be specified when the POST is made.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         POST
     
     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
	 
     ::
     
		{
			"name": "allow_google-dns",
			"fullPath": "allow_google-dns",
			"action": "accept",
			"ipProtocol": "any",
			"iruleSampleRate": 1,
			"log": "no",
			"status": "enabled",
			"placeBefore": "default_deny",
			"destination": {
				"addressLists": [ 
				"/Common/google-dns_address_list" 
				] 
			}
		}
  2) Copy the newly created rule name **allow_google-dns** and populate the **{{afm_policy_rule}}** Postman environment variable.


**Example Response**

.. code-block:: rest
    :emphasize-lines: 3-4, 7-21

    {
        "kind": "tm:security:firewall:policy:rules:rulesstate",
        "name": "allow_google-dns",
        "fullPath": "allow_google-dns",
        "generation": 13210,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/allow_google-dns?ver=13.1.0.8",
        "action": "accept",
        "ipProtocol": "any",
        "iruleSampleRate": 1,
        "log": "no",
        "status": "enabled",
        "destination": {
            "addressLists": [
            "/Common/google-dns_address_list"
            ],
            "addressListsReference": [
            {
                "link": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~allow_google-dns?ver=13.0.0"
            }
            ]
        },
        "source": {
            "identity": {}
        }
    }

|labmodule|\.\ |labnum|\.6. Disable a Policy rule
-------------------------------------------------

An HTTP PATCH to the ``/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules/{{afm_policy_rule}}`` endpoint with a body containing a name of an existing rule can set the ``"status": "disabled"`` to deactivate a single rule.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         PATCH
     
     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules/{{afm_policy_rule}}
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
	 
     ::
     
		{
			"status": "disabled"
		}

**Example Response**

.. code-block:: rest
    :emphasize-lines: 11

    {
        "kind": "tm:security:firewall:policy:rules:rulesstate",
        "name": "allow_google-dns",
        "fullPath": "allow_google-dns",
        "generation": 11470,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/allow_google-dns?ver=13.1.0.8",
        "action": "accept",
        "ipProtocol": "any",
        "iruleSampleRate": 1,
        "log": "no",
        "status": "disabled",
        "destination": {
            "addressLists": [
                "/Common/google-dns_address_list"
            ],
            "addressListsReference": [
                {
                    "link": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.1.0.8"
                }
            ]
        },
        "source": {
            "identity": {}
        }
    }

.. NOTE::
    - Repeat step 1.3.3 to verify the rule has been disabled.