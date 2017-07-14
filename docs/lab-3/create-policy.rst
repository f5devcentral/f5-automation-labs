LAB 3.2 - Create ASM Policy
============================

LAB 3.2 Overview
-----------------

In this lab, the iControl REST based API will be used to create both an ASM parent and child policy.

LAB 3.2 Specific Instructions
------------------------------

Follow the **LAB 3.2 - Create ASM Policy** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for reference.

.. attention:: Some response content has been removed for brevity.

1. Retrieve ASM policy
-------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies

**Headers**

:: 

    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

::

    {
        "kind": "tm:asm:policies:policycollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/policies?ver=13.0.0",
        "totalItems": 1,
        "items": [
            {
            "plainTextProfileReference": {
                "link": "https://localhost/mgmt/tm/asm/policies/8JuF2s3Lb26BYwLXpaHLIg/plain-text-profiles?ver=13.0.0",
                "isSubCollection": true
            },
            "dataGuardReference": {
                "link": "https://localhost/mgmt/tm/asm/policies/8JuF2s3Lb26BYwLXpaHLIg/data-guard?ver=13.0.0"
            }
        ]
    }

2.0. Create ASM parent policy
-----------------------------

An HTTP POST to the ``/mgmt/tm/asm/policies`` endpoint with a body containing basic policy configuration including ``"type":"parent"`` will create a new ASM parent policy which can then be used for inheritance when a child policy is created.

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

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

**Example Response**

.. note:: Copy the ASM policy hash for the newly created policy and populate the {{asm_policy_hash}} Postman environment variable.
The hash in the example below is JEQPVWeJcdso_rEC7Xxo6Q

::

    {
        "historyRevisionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/history-revisions?ver=13.0.0",
            "isSubCollection": true
        },
        "childPolicyCount": 0,
        "responsePageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/response-pages?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/policy-builder?ver=13.0.0"
        },
        "serverTechnologyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/server-technologies?ver=13.0.0",
            "isSubCollection": true
        },
        "blockingSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/blocking-settings?ver=13.0.0",
            "isSubCollection": true
        },
        "hostNameReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/host-names?ver=13.0.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/data-guard?ver=13.0.0"
        },
        "selfLink": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q?ver=13.0.0",
        "signatureReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/signatures?ver=13.0.0",
            "isSubCollection": true
        },
        "filetypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/filetypes?ver=13.0.0",
            "isSubCollection": true
        },
        "createdDatetime": "2017-05-30T15:02:11Z",
        "modifierName": "",
        "id": "JEQPVWeJcdso_rEC7Xxo6Q",
        "subPath": "/Common",
        "name": "API_ASM_POLICY_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/header-settings?ver=13.0.0"
        }
    }

2.1. Retrieve ASM parent policy
--------------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}

**Headers**

:: 

    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

::

    {
        "historyRevisionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/history-revisions?ver=13.0.0",
            "isSubCollection": true
        },
        "childPolicyCount": 0,
        "responsePageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/response-pages?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/policy-builder?ver=13.0.0"
        },
        "serverTechnologyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q/server-technologies?ver=13.0.0",
            "isSubCollection": true
        }
    }

3.0. Create ASM child policy
-----------------------------

An HTTP POST to the ``/mgmt/tm/asm/policies`` endpoint with a body containing basic policy configuration including ``"parentPolicyName": "/Common/API_ASM_POLICY_TEST"`` will create a new child policy which inherits a base configuration from the specified parent.

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "name":"API_ASM_POLICY_CHILD_TEST",
        "description":"Test ASM policy",
        "applicationLanguage":"utf-8",
        "parentPolicyName": "/Common/API_ASM_POLICY_TEST",
        "enforcementMode":"transparent",
        "protocolIndependent":"true",
        "learningMode":"automatic",
        "learningSpeed":"slow",
        "serverTechnologyName": "Apache Tomcat"
    }

**Example Response**

.. note:: Take note of the ASM policy hash for the newly created policy.  Copy this value into your Postman's collection environmental variable for {{asm_policy_hash}}
The hash in the example below is zD8sehzULw6Ni7GJG2XwJQ

::

    {
        "plainTextProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/plain-text-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/data-guard?ver=13.0.0"
        },
        "createdDatetime": "2017-05-30T15:45:59Z",
        "cookieSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookie-settings?ver=13.0.0"
        },
        "name": "API_ASM_POLICY_CHILD_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/header-settings?ver=13.0.0"
        },
        "sectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/sections?ver=13.0.0",
            "isSubCollection": true
        },
        "loginPageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/login-pages?ver=13.0.0",
            "isSubCollection": true
        },
        "description": "Test ASM policy",
        "fullPath": "/Common/API_ASM_POLICY_CHILD_TEST",
        "policyBuilderParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-parameter?ver=13.0.0"
        },
        "hasParent": true,
        "partition": "Common",
        "parentPolicyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q?ver=13.0.0"
        }
    }

3.1. Retrieve ASM child policy
-------------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}

**Headers**

:: 

    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

::

    {
        "plainTextProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/plain-text-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/data-guard?ver=13.0.0"
        },
        "createdDatetime": "2017-05-30T15:45:59Z",
        "cookieSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookie-settings?ver=13.0.0"
        },
        "versionLastChange": " Security Policy /Common/API_ASM_POLICY_CHILD_TEST [add]: Parent Policy was set to /Common/API_ASM_POLICY_TEST.\nType was set to Security.\nEncoding Selected was set to true.\nApplication Language was set to utf-8.\nCase Sensitivity was set to Case Sensitive.\nSecurity Policy Description was set to Fundamental Policy.\nLearning Mode was set to Automatic.\nActive was set to false.\nDifferentiate between HTTP and HTTPS URLs was set to Protocol Specific.\nPolicy Name was set to /Common/API_ASM_POLICY_CHILD_TEST.\nEnforcement Mode was set to Blocking. { audit: policy = /Common/API_ASM_POLICY_CHILD_TEST, username = admin, client IP = 192.168.2.112 }",
        "name": "API_ASM_POLICY_CHILD_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/header-settings?ver=13.0.0"
        },
        "sectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/sections?ver=13.0.0",
            "isSubCollection": true
        },
        "loginPageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/login-pages?ver=13.0.0",
            "isSubCollection": true
        },
        "description": "Test ASM policy",
        "fullPath": "/Common/API_ASM_POLICY_CHILD_TEST",
        "policyBuilderParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-parameter?ver=13.0.0"
        },
        "hasParent": true,
        "partition": "Common",
        "parentPolicyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/JEQPVWeJcdso_rEC7Xxo6Q?ver=13.0.0"
        },
        "webScrapingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/web-scraping?ver=13.0.0"
        },
        "csrfProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/csrf-protection?ver=13.0.0"
        },
        "policyAntivirusReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/antivirus?ver=13.0.0"
        },
        "kind": "tm:asm:policies:policystate",
        "virtualServers": [],
        "policyBuilderCookieReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-cookie?ver=13.0.0"
        }
    }

