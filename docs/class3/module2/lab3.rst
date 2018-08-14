.. |labmodule| replace:: 2
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Module |labmodule|\, Lab\ |labnum|\: Create ASM Policy
========================================================

Overview
----------

In this lab, the iControl REST based API will be used to create both an ASM parent and child policy.

.. NOTE::
    - Use Postman collection to complete this lab.
    - Some response content has been removed for brevity.

|labmodule|\.\ |labnum|\.1.0. Retrieve ASM Policies
-----------------------------------------------------

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

**Example Response**

::

    {
        "kind": "tm:asm:policies:policycollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/policies?ver=13.1.0",
        "totalItems": 1,
        "items": [
            {
            "plainTextProfileReference": {
                "link": "https://localhost/mgmt/tm/asm/policies/8JuF2s3Lb26BYwLXpaHLIg/plain-text-profiles?ver=13.1.0",
                "isSubCollection": true
            },
            "dataGuardReference": {
                "link": "https://localhost/mgmt/tm/asm/policies/8JuF2s3Lb26BYwLXpaHLIg/data-guard?ver=13.1.0"
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.1. Retrieve LTM ASM Profile Web Security
---------------------------------------------------------------------

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/ltm/profile/web-security
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

**Example Response**

::

	{
		"kind": "tm:ltm:profile:web-security:web-securitycollectionstate",
		"selfLink": "https://localhost/mgmt/tm/ltm/profile/web-security?ver=13.1.0.8",
		"items": [
			{
				"kind": "tm:ltm:profile:web-security:web-securitystate",
				"name": "websecurity",
				"partition": "Common",
				"fullPath": "/Common/websecurity",
				"generation": 1,
				"selfLink": "https://localhost/mgmt/tm/ltm/profile/web-security/~Common~websecurity?ver=13.1.0.8",
				"defaultsFrom": "none"
			}
		]
	}

|labmodule|\.\ |labnum|\.2.0. Create an ASM Parent Policy
------------------------------------------------------------

An HTTP POST to the ``/mgmt/tm/asm/policies`` endpoint with a body containing basic policy configuration including ``"type":"parent"`` will create a new ASM parent policy which can then be used for inheritance when a child policy is created.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         POST

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

     ::

        {
            "name":"API_ASM_POLICY_TEST",
            "description":"Test ASM policy",
            "applicationLanguage":"utf-8",
            "type":"parent",
            "enforcementMode":"transparent",
            "protocolIndependent":"true",
            "learningMode":"disabled",
            "serverTechnologyName": "Unix/Linux"
        }
        
  2) Copy the ASM policy hash for the newly created policy and populate the **{{asm_policy_hash}}** Postman environment variable.  The hash in the example below is **JEQPVWeJcdso_rEC7Xxo6Q**

**Example Response**

::

    {
        "historyRevisionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/history-revisions?ver=13.1.0",
            "isSubCollection": true
        },
        "childPolicyCount": 0,
        "responsePageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/response-pages?ver=13.1.0",
            "isSubCollection": true
        },
        "policyBuilderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/policy-builder?ver=13.1.0"
        },
        "serverTechnologyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/server-technologies?ver=13.1.0",
            "isSubCollection": true
        },
        "blockingSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/blocking-settings?ver=13.1.0",
            "isSubCollection": true
        },
        "hostNameReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/host-names?ver=13.1.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/data-guard?ver=13.1.0"
        },
        "selfLink": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q?ver=13.1.0",
        "signatureReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/signatures?ver=13.1.0",
            "isSubCollection": true
        },
        "filetypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/filetypes?ver=13.1.0",
            "isSubCollection": true
        },
        "createdDatetime": "2017-05-30T15:02:11Z",
        "modifierName": "",
        "id": "JEQPVWeJcdso_rEC7Xxo6Q",
        "subPath": "/Common",
        "name": "API_ASM_POLICY_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/header-settings?ver=13.1.0"
        }
    }

|labmodule|\.\ |labnum|\.2.1. Retrieve an ASM Parent Policy
------------------------------------------------------------

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
        "historyRevisionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/history-revisions?ver=13.1.0",
            "isSubCollection": true
        },
        "childPolicyCount": 0,
        "responsePageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/response-pages?ver=13.1.0",
            "isSubCollection": true
        },
        "policyBuilderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/policy-builder?ver=13.1.0"
        },
        "serverTechnologyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/server-technologies?ver=13.1.0",
            "isSubCollection": true
        }
    }

|labmodule|\.\ |labnum|\.3.0. Create ASM child policy
-------------------------------------------------------

An HTTP POST to the ``/mgmt/tm/asm/policies`` endpoint with a body containing basic policy configuration including ``"parentPolicyName": "/Common/API_ASM_POLICY_TEST"`` will create a new child policy which inherits a base configuration from the specified parent.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         POST

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

     ::

        {
            "name":"API_ASM_POLICY_CHILD_TEST",
            "description":"Test ASM policy",
            "applicationLanguage":"utf-8",
            "parentPolicyName": "/Common/API_ASM_POLICY_TEST",
            "enforcementMode":"transparent",
            "protocolIndependent":"true",
            "learningMode":"slow",
            "serverTechnologyName": "Apache Tomcat"
        }
        
  2) Copy the ASM policy hash for the newly created policy and populate the **{{asm_policy_hash}}** Postman environment variable.  The hash in the example below is **zD8sehzULw6Ni7GJG2XwJQ**

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

|labmodule|\.\ |labnum|\.3.1. Retrieve ASM child policy
-----------------------------------------------------------

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
        "webScrapingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/web-scraping?ver=13.1.0"
        },
        "csrfProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/csrf-protection?ver=13.1.0"
        },
        "policyAntivirusReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/antivirus?ver=13.1.0"
        },
        "kind": "tm:asm:policies:policystate",
        "virtualServers": [],
        "policyBuilderCookieReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-cookie?ver=13.1.0"
        }
    }

