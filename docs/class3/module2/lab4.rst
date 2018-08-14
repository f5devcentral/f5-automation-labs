.. |labmodule| replace:: 2
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Module |labmodule|\, Lab\ |labnum|\: Apply ASM Policy to VS
=============================================================

Overview
---------

In this lab, the previously created **ASM Child policy** will be applied to a virtual server using the iControl REST API.

.. NOTE::
    - Use Postman collection to complete this lab.
    - Some response content has been removed for brevity.

|labmodule|\.\ |labnum|\.1. Apply ASM Policy to VS
---------------------------------------------------

An HTTP PATCH to the ``/mgmt/tm/asm/policies/{{asm_policy_hash}}`` endpoint with a body containing the name of a virtual server(s), in this case ``"virtualServers":["/Common/hackazon_vs"]``, will apply the ASM policy.

.. Hint::  
  1) Ensure the policy hash for the previously created **Child Policy** has been copied to the Postman environmental variable {{asm_policy_hash}}.
  2) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         PATCH

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies/{{asm_policy_hash}}
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

     ::

        {
            "virtualServers":["/Common/hackazon_vs"]
        }

**Example Response**

::

    {
        "plainTextProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/plain-text-profiles?ver=13.1.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/data-guard?ver=13.1.0"
        },
        "createdDatetime": "2017-05-30T15:45:59Z",
        "cookieSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookie-settings?ver=13.1.0"
        },
        "versionLastChange": " Security Policy /Common/API_ASM_POLICY_CHILD_TEST [add]: Parent Policy was set to /Common/API_ASM_POLICY_TEST.\nType was set to Security.\nEncoding Selected was set to true.\nApplication Language was set to utf-8.\nCase Sensitivity was set to Case Sensitive.\nSecurity Policy Description was set to Fundamental Policy.\nLearning Mode was set to Automatic.\nActive was set to false.\nDifferentiate between HTTP and HTTPS URLs was set to Protocol Specific.\nPolicy Name was set to /Common/API_ASM_POLICY_CHILD_TEST.\nEnforcement Mode was set to Blocking. { audit: policy = /Common/API_ASM_POLICY_CHILD_TEST, username = admin, client IP = 192.168.2.112 }",
        "name": "API_ASM_POLICY_CHILD_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/header-settings?ver=13.1.0"
        },
        "sectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/sections?ver=13.1.0",
            "isSubCollection": true
        },
        "loginPageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/login-pages?ver=13.1.0",
            "isSubCollection": true
        },
        "description": "Test ASM policy",
        "fullPath": "/Common/API_ASM_POLICY_CHILD_TEST",
        "policyBuilderParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-parameter?ver=13.1.0"
        },
        "hasParent": true,
        "partition": "Common",
        "parentPolicyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q?ver=13.1.0"
        },
    }

|labmodule|\.\ |labnum|\.2. Retrieve ASM policy
------------------------------------------------

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies/{{asm_policy_hash}}
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

**Example Response**

::

    {
        "plainTextProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/plain-text-profiles?ver=13.1.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/data-guard?ver=13.1.0"
        },
        "createdDatetime": "2017-05-30T15:45:59Z",
        "cookieSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookie-settings?ver=13.1.0"
        },
        "versionLastChange": "Policy Building Settings Policy Building Settings [update]: Internal Statistics have been updated { audit: policy = /Common/API_ASM_POLICY_CHILD_TEST, component = Policy Builder }",
        "name": "API_ASM_POLICY_CHILD_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/header-settings?ver=13.1.0"
        }
    }

|labmodule|\.\ |labnum|\.3. Remove ASM Policy from VS
-------------------------------------------------------

An HTTP PATCH to the ``/mgmt/tm/asm/policies/{{asm_policy_hash}}`` endpoint with a body removing the name of a virtual server(s), in this case ``"virtualServers":[""]``, will remove the ASM policy from the absent virtual serves.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         PATCH

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies/{{asm_policy_hash}}
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

     ::

        {
            "virtualServers":[""]
        }

**Example Response**

::

    {
        "plainTextProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/plain-text-profiles?ver=13.1.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/data-guard?ver=13.1.0"
        },
        "createdDatetime": "2017-05-30T15:45:59Z",
        "cookieSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookie-settings?ver=13.1.0"
        },
        "versionLastChange": "Policy Building Settings Policy Building Settings [update]: Internal Statistics have been updated { audit: policy = /Common/API_ASM_POLICY_CHILD_TEST, component = Policy Builder }",
        "name": "API_ASM_POLICY_CHILD_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/header-settings?ver=13.1.0"
        },
        "sectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/sections?ver=13.1.0",
            "isSubCollection": true
        },
        "loginPageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/login-pages?ver=13.1.0",
            "isSubCollection": true
        },
        "description": "Test ASM policy",
        "fullPath": "/Common/API_ASM_POLICY_CHILD_TEST",
        "policyBuilderParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-parameter?ver=13.1.0"
        },
        "hasParent": true,
        "partition": "Common",
        "parentPolicyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q?ver=13.1.0"
        }
    }

|labmodule|\.\ |labnum|\.4. Delete ASM policy
-----------------------------------------------

An HTTP DELETE to the ``/mgmt/tm/asm/policies/{{asm_policy_hash}}`` endpoint will delete the ASM policy from the BIG-IP.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         DELETE

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies/{{asm_policy_hash}}
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

**Example Response**

::

    {
        "plainTextProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/plain-text-profiles?ver=13.1.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/data-guard?ver=13.1.0"
        },
        "createdDatetime": "2017-05-30T15:45:59Z",
        "cookieSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookie-settings?ver=13.1.0"
        },
        "versionLastChange": "Policy Building Settings Policy Building Settings [update]: Internal Statistics have been updated { audit: policy = /Common/API_ASM_POLICY_CHILD_TEST, component = Policy Builder }",
        "name": "API_ASM_POLICY_CHILD_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/header-settings?ver=13.1.0"
        }
    }
