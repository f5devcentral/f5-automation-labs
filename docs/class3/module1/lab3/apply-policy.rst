Lab 3.3: Apply ASM Policy to VS
===============================

Overview
--------

In this lab, the previously created ASM policy will be applied to a virtual server using the iControl REST API.

Specific Instructions
---------------------

Follow the **Lab 3.3 - Apply ASM Policy to Virtual Server** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for reference.

.. ATTENTION:: Some response content has been removed for brevity.

1. Apply ASM Policy to VS
--------------------------

An HTTP PATCH to the ``/mgmt/tm/asm/policies/{{asm_policy_hash}}`` endpoint with a body containing the name of a virtual server(s), in this case ``"virtualServers":["/Common/hackazon_vs"]``, will apply the ASM policy.

**Request**

::

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}
    
**Body**

::

    {
        "virtualServers":["/Common/hackazon_vs"]
    }

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
    }

2. Retrieve ASM policy
-----------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}

**Headers**

::

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

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
        "versionLastChange": "Policy Building Settings Policy Building Settings [update]: Internal Statistics have been updated { audit: policy = /Common/API_ASM_POLICY_CHILD_TEST, component = Policy Builder }",
        "name": "API_ASM_POLICY_CHILD_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/header-settings?ver=13.0.0"
        }
    }

3. Remove ASM Policy from VS
-----------------------------

An HTTP PATCH to the ``/mgmt/tm/asm/policies/{{asm_policy_hash}}`` endpoint with a body removing the name of a virtual server(s), in this case ``"virtualServers":[""]``, will remove the ASM policy from the absent virtual serves.

**Request**

::

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}
    
**Body**

::

    {
        "virtualServers":[""]
    }

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
        "versionLastChange": "Policy Building Settings Policy Building Settings [update]: Internal Statistics have been updated { audit: policy = /Common/API_ASM_POLICY_CHILD_TEST, component = Policy Builder }",
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

4. Delete ASM policy
---------------------

An HTTP DELETE to the ``/mgmt/tm/asm/policies/{{asm_policy_hash}}`` endpoint will delete the ASM policy from the BIG-IP.

**Request**

::

    DELETE https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}

**Headers**

:: 

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

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
        "versionLastChange": "Policy Building Settings Policy Building Settings [update]: Internal Statistics have been updated { audit: policy = /Common/API_ASM_POLICY_CHILD_TEST, component = Policy Builder }",
        "name": "API_ASM_POLICY_CHILD_TEST",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/header-settings?ver=13.0.0"
        }
    }
