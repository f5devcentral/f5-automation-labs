.. |labmodule| replace:: 2
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Module |labmodule|\, Lab \ |labnum|\: Interact with ASM
========================================================

Overview
--------

In this lab, the iControl REST based API will be used to explore some of the ASM related endpoints.

.. NOTE::
    - Use Postman collection to complete this lab.
    - Some response content has been removed for brevity.

|labmodule|\.\ |labnum|\.1.0. Retrieve ASM Resources
----------------------------------------------------

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

**Example Response**

::

    {
        "kind": "tm:asm:asmcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm?ver=13.1.0",
        "items": [
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/policies?ver=13.1.0"
                }
            },
                {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/server-technologies?ver=13.1.0"
                }
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.1. Retrieve ASM Server Technologies
---------------------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/server-technologies
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**

**Example Response**

::

    {
        "kind": "tm:asm:server-technologies:server-technologycollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/server-technologies?ver=13.1.0",
        "totalItems": 40,
        "items": [
            {
                "serverTechnologyDisplayName": "jQuery",
                "serverTechnologyName": "jQuery",
                "logoFileName": "jquery.png",
                "lastUpdateMicros": 1476919661000000,
                "description": "jQuery is a cross-platform JavaScript library designed to simplify the client-side scripting of HTML.",
                "kind": "tm:asm:server-technologies:server-technologystate",
                "serverTechnologyReferences": [],
                "selfLink": "https://localhost/mgmt/tm/asm/server-technologies/9ZC0_aLDC-KN08jDyvXHew?ver=13.1.0",
                "id": "9ZC0_aLDC-KN08jDyvXHew"
            },
            {
                "serverTechnologyDisplayName": "Java Servlets/JSP",
                "serverTechnologyName": "Java Servlets/JSP",
                "logoFileName": "java.png",
                "lastUpdateMicros": 1476919661000000,
                "description": "A Java servlet is a Java program that extends the capabilities of a server.",
                "kind": "tm:asm:server-technologies:server-technologystate",
                "serverTechnologyReferences": [],
                "selfLink": "https://localhost/mgmt/tm/asm/server-technologies/9ySigIBMpBbYU4r8FNAt4g?ver=13.1.0",
                "id": "9ySigIBMpBbYU4r8FNAt4g"
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.2. Retrieve ASM Policies
----------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
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
     |

  2) Copy the ASM policy hash as it appears in the ``"link": "https://localhost/mgmt/tm/asm/policies/``\ **W-w3q351kYbr1A9OEaUOag**\ ``/plain-text-profiles?ver=13.1.0",`` line of the response and populate the **{{asm_policy_hash}}** Postman environment variable.
	

**Example Response**

.. NOTE:: A test policy named ``test_asm_policy`` has already been created on the BIG-IP for demonstration purposes.

::

    {
        "kind": "tm:asm:policies:policycollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/policies?ver=13.1.0",
        "totalItems": 1,
        "items": [
            {
            "plainTextProfileReference": {
                "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/plain-text-profiles?ver=13.1.0",
                "isSubCollection": true
            },
            "dataGuardReference": {
                "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/data-guard?ver=13.1.0"
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.3. Retrieve an ASM Policy
-----------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
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
     |

**Example Response**

::

    {
        "plainTextProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/plain-text-profiles?ver=13.1.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/data-guard?ver=13.1.0"
        },
        "createdDatetime": "2017-06-02T04:37:22Z",
        "cookieSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/cookie-settings?ver=13.1.0"
        },
        "versionLastChange": " Security Policy /Common/test_asm_policy [add]: Type was set to Security.\nEncoding Selected was set to false.\nApplication Language was set to utf-8.\nCase Sensitivity was set to Case Sensitive.\nTemplate was set to POLICY_TEMPLATE_FUNDAMENTAL.\nActive was set to false.\nDifferentiate between HTTP and HTTPS URLs was set to Protocol Specific.\nPolicy Name was set to /Common/test_asm_policy.\nEnforcement Mode was set to Blocking. { audit: policy = /Common/test_asm_policy, username = admin, client IP = 192.168.2.111 }",
        "name": "test_asm_policy",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/header-settings?ver=13.1.0"
        },
        "versionPolicyName": "/Common/test_asm_policy",
        "generalReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/general?ver=13.1.0"
        }
    }

|labmodule|\.\ |labnum|\.1.4. Search for an ASM Policy
--------------------------------------------------------

An HTTP GET to the ``/mgmt/tm/asm/policies`` endpoint with a parameter of ``filter=name eq test``, allows ASM policies to be searched by name.

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies?filter=name eq test
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
     |
     
**Example Response**

::

    {
        "plainTextProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/plain-text-profiles?ver=13.1.0",
            "isSubCollection": true
        },
        "dataGuardReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/data-guard?ver=13.1.0"
        },
        "createdDatetime": "2017-06-02T04:37:22Z",
        "cookieSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/cookie-settings?ver=13.1.0"
        },
        "versionLastChange": " Security Policy /Common/test_asm_policy [add]: Type was set to Security.\nEncoding Selected was set to false.\nApplication Language was set to utf-8.\nCase Sensitivity was set to Case Sensitive.\nTemplate was set to POLICY_TEMPLATE_FUNDAMENTAL.\nActive was set to false.\nDifferentiate between HTTP and HTTPS URLs was set to Protocol Specific.\nPolicy Name was set to /Common/test_asm_policy.\nEnforcement Mode was set to Blocking. { audit: policy = /Common/test_asm_policy, username = admin, client IP = 192.168.2.111 }",
        "name": "test_asm_policy",
        "caseInsensitive": false,
        "headerSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/header-settings?ver=13.1.0"
        },
        "versionPolicyName": "/Common/test_asm_policy",
        "generalReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/general?ver=13.1.0"
        }
    }

|labmodule|\.\ |labnum|\.1.5. List ASM Tasks
----------------------------------------------

An HTTP GET to the ``/mgmt/tm/asm/tasks/`` endpoint lists the various ASM related tasks that can be performed via the iControl REST API.

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/tasks/
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
     |
     
**Example Response**

::

    {
        "kind": "tm:asm:tasks",
        "selfLink": "https://localhost/mgmt/tm/asm/tasks?ver=13.1.0",
        "items": [
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/export-policy?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/resolve-vulnerabilities?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/check-signatures?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/terminate-vulnerability-assessment?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/apply-server-technologies?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/associate-xml-validation-files-to-xml-profile?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/export-policy-template?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/export-requests?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/initiate-vulnerability-assessment?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/import-policy-template?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/update-signatures?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/import-policy?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/bulk?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/get-vulnerability-assessment-subscriptions?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/apply-policy?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/export-signatures?ver=13.1.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/import-vulnerabilities?ver=13.1.0"
                }
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.6. List a specific ASM Task
-------------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/tasks/export-policy
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
     |
     
**Example Response**

::

    {
        "kind": "tm:asm:tasks:export-policy:export-policy-taskcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/tasks/export-policy?ver=13.1.0",
        "totalItems": 0,
        "items": []
    }

|labmodule|\.\ |labnum|\.1.7. Retrieve ASM Policy Templates
------------------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policy-templates
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
     |
     
**Example Response**

::

    {
        "kind": "tm:asm:policy-templates:policy-templatecollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/policy-templates?ver=13.1.0",
        "totalItems": 32,
        "items": [
            {
            "policyType": "security",
            "name": "POLICY_TEMPLATE_SHAREPOINT_2007_HTTP",
            "description": "Generic template for SharePoint 2007 (http)",
            "kind": "tm:asm:policy-templates:policy-templatestate",
            "templateType": "application-ready",
            "selfLink": "https://localhost/mgmt/tm/asm/policy-templates/jmHjN-Fpm-SGwYQsrZp57A?ver=13.1.0",
            "templateDefaults": {
                "caseInsensitive": true,
                "learningSpeed": {
                "untrustedTrafficSiteChangeTracking": {
                    "maxDaysBetweenSamples": 7,
                    "differentSources": 10,
                    "minMinutesBetweenSamples": 5
                },
                "untrustedTrafficLoosen": {
                    "maxDaysBetweenSamples": 7,
                    "differentSources": 20,
                    "minHoursBetweenSamples": 1
                },
                "trustedTrafficSiteChangeTracking": {
                    "maxDaysBetweenSamples": 7,
                    "differentSources": 1,
                    "minMinutesBetweenSamples": 0
                },
                "trustedTrafficLoosen": {
                    "maxDaysBetweenSamples": 7,
                    "differentSources": 1,
                    "minHoursBetweenSamples": 0
                },
                "trafficTighten": {
                    "minDaysBetweenSamples": 1,
                    "totalRequests": 15000,
                    "maxModificationSuggestionScore": 50
                }
                },
                "enforcementReadinessPeriod": 7,
                "learningMode": "disabled",
                "applicationLanguage": "utf-8",
                "enforcementMode": "transparent",
                "signatureStaging": true,
                "type": "security",
                "protocolIndependent": false
            },
            "title": "SharePoint 2007 (http)",
            "id": "jmHjN-Fpm-SGwYQsrZp57A"
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.8. Retrieve ASM Signature Sets
------------------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/signature-sets
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
     |
     
**Example Response**

::

    {
        "kind": "tm:asm:signature-sets:signature-setcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/signature-sets?ver=13.1.0",
        "totalItems": 29,
        "items": [
            {
            "filter": {
                "riskFilter": "all",
                "accuracyFilter": "all",
                "userDefinedFilter": "all",
                "lastUpdatedFilter": "all",
                "accuracyValue": "all",
                "riskValue": "all",
                "signatureType": "all"
            },
            "isUserDefined": false,
            "name": "Generic Detection Signatures",
            "assignToPolicyByDefault": true,
            "lastUpdateMicros": 0,
            "kind": "tm:asm:signature-sets:signature-setstate",
            "selfLink": "https://localhost/mgmt/tm/asm/signature-sets/pBeUaadz6x-Z55_GkLxfsg?ver=13.1.0",
            "defaultAlarm": true,
            "systems": [
                {
                    "systemReference": {
                        "link": "https://localhost/mgmt/tm/asm/signature-systems/EStDgGiP9nSPgKBhSlDyvQ?ver=13.1.0"
                    }
                    },
                    {
                    "systemReference": {
                        "link": "https://localhost/mgmt/tm/asm/signature-systems/rMiBJmL6DLmnfmW_pXHmdw?ver=13.1.0"
                    }
                    },
                    {
                    "systemReference": {
                        "link": "https://localhost/mgmt/tm/asm/signature-systems/b9hI1sIulARJ09bbdy0VQw?ver=13.1.0"
                    }
                }
            ],
            "id": "pBeUaadz6x-Z55_GkLxfsg",
            "type": "filter-based",
            "signatureReferences": [
                {
                "link": "https://localhost/mgmt/tm/asm/signatures/nHU-8zUxj8ldUevwMgFpvw?ver=13.1.0"
                },
                {
                "link": "https://localhost/mgmt/tm/asm/signatures/RTFj6E66sH7g7XMa9ihQOQ?ver=13.1.0"
                }
            ],
            "category": "User-defined",
            "defaultBlock": true,
            "defaultLearn": true
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.9. Retrieve ASM Signature Systems
--------------------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/signature-systems
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
     |
     
**Example Response**

::

    {
        "kind": "tm:asm:signature-systems:signature-systemcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/signature-systems?ver=13.1.0",
        "totalItems": 44,
        "items": [
            {
                "kind": "tm:asm:signature-systems:signature-systemstate",
                "selfLink": "https://localhost/mgmt/tm/asm/signature-systems/EStDgGiP9nSPgKBhSlDyvQ?ver=13.1.0",
                "name": "General Database",
                "id": "EStDgGiP9nSPgKBhSlDyvQ"
            },
            {
                "kind": "tm:asm:signature-systems:signature-systemstate",
                "selfLink": "https://localhost/mgmt/tm/asm/signature-systems/rMiBJmL6DLmnfmW_pXHmdw?ver=13.1.0",
                "name": "Various systems",
                "id": "rMiBJmL6DLmnfmW_pXHmdw"
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.10. Retrieve ASM Attack Types
-----------------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/attack-types
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
     |
     
**Example Response**

::

    {
        "kind": "tm:asm:attack-types:attack-typecollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/attack-types?ver=13.1.0",
        "totalItems": 37,
        "items": [
            {
                "kind": "tm:asm:attack-types:attack-typestate",
                "selfLink": "https://localhost/mgmt/tm/asm/attack-types/9yL3q5_pO0E3pK1Uz9x2cw?ver=13.1.0",
                "name": "Remote File Include",
                "id": "9yL3q5_pO0E3pK1Uz9x2cw",
                "description": "Remote File Inclusion attacks allow attackers to run arbitrary code on a vulnerable website."
            },
            {
                "kind": "tm:asm:attack-types:attack-typestate",
                "selfLink": "https://localhost/mgmt/tm/asm/attack-types/ufg0smEkZrpmkoDHfSPGdQ?ver=13.1.0",
                "name": "Non-browser Client",
                "id": "ufg0smEkZrpmkoDHfSPGdQ",
                "description": "An attempt is made by a non-browser client to explore the site."
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.11. Retrieve ASM Policy URLs
--------------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies/{{asm_policy_hash}}/urls
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
     |
     
**Example Response**

::

    {
        "kind": "tm:asm:policies:urls:urlcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/urls?ver=13.1.0",
        "totalItems": 2,
        "items": [
            {
            "protocol": "http",
            "wildcardIncludesSlash": true,
            "lastLearnedNewEntityDatetime": "2017-06-02T04:37:25Z",
            "html5CrossOriginRequestsEnforcement": {
                "enforcementMode": "disabled"
            },
            "kind": "tm:asm:policies:urls:urlstate",
            "selfLink": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/urls/faiefv884qtHRU3Qva2AbQ?ver=13.1.0",
            "methodsOverrideOnUrlCheck": false,
            "id": "faiefv884qtHRU3Qva2AbQ",
            "isAllowed": true,
            "metacharsOnUrlCheck": false,
            "name": "*",
            "lastUpdateMicros": 1496378251000000,
            "description": "",
            "parameterReference": {
                "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/urls/faiefv884qtHRU3Qva2AbQ/parameters?ver=13.1.0",
                "isSubCollection": true
            },
            "attackSignaturesCheck": true,
            "signatureOverrides": [],
            "clickjackingProtection": false,
            "urlContentProfiles": [
                {
                "headerValue": "*",
                "headerName": "*",
                "headerOrder": "default",
                "type": "apply-value-and-content-signatures"
                },
                {
                "headerValue": "*form*",
                "headerName": "Content-Type",
                "headerOrder": "1",
                "type": "form-data"
                },
                {
                "contentProfileReference": {
                    "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/json-profiles/X8FbXF48VWJ5Tecp5ATd4A?ver=13.1.0"
                },
                "headerValue": "*json*",
                "headerName": "Content-Type",
                "headerOrder": "2",
                "type": "json"
                },
                {
                "contentProfileReference": {
                    "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/xml-profiles/jwQd_XYZPfNGYnc3l7P4Pg?ver=13.1.0"
                },
                "headerValue": "*xml*",
                "headerName": "Content-Type",
                "headerOrder": "3",
                "type": "xml"
                }
            ],
            "performStaging": true,
            "type": "wildcard",
            "wildcardOrder": 2
            },
            {
            "protocol": "https",
            "wildcardIncludesSlash": true,
            "lastLearnedNewEntityDatetime": "2017-06-02T04:37:25Z",
            "html5CrossOriginRequestsEnforcement": {
                "enforcementMode": "disabled"
            },
            "kind": "tm:asm:policies:urls:urlstate",
            "selfLink": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/urls/N_a3D1S7OKDehYEPb-mgCg?ver=13.1.0",
            "methodsOverrideOnUrlCheck": false,
            "id": "N_a3D1S7OKDehYEPb-mgCg",
            "isAllowed": true,
            "metacharsOnUrlCheck": false,
            "name": "*",
            "lastUpdateMicros": 1496378251000000,
            "description": "",
            "parameterReference": {
                "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/urls/N_a3D1S7OKDehYEPb-mgCg/parameters?ver=13.1.0",
                "isSubCollection": true
            },
            "attackSignaturesCheck": true,
            "signatureOverrides": [],
            "clickjackingProtection": false,
            "urlContentProfiles": [
                {
                "headerValue": "*",
                "headerName": "*",
                "headerOrder": "default",
                "type": "apply-value-and-content-signatures"
                },
                {
                "headerValue": "*form*",
                "headerName": "Content-Type",
                "headerOrder": "1",
                "type": "form-data"
                },
                {
                "contentProfileReference": {
                    "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/json-profiles/X8FbXF48VWJ5Tecp5ATd4A?ver=13.1.0"
                },
                "headerValue": "*json*",
                "headerName": "Content-Type",
                "headerOrder": "2",
                "type": "json"
                },
                {
                "contentProfileReference": {
                    "link": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/xml-profiles/jwQd_XYZPfNGYnc3l7P4Pg?ver=13.1.0"
                },
                "headerValue": "*xml*",
                "headerName": "Content-Type",
                "headerOrder": "3",
                "type": "xml"
                }
            ],
            "performStaging": true,
            "type": "wildcard",
            "wildcardOrder": 1
            }
        ]
    }

|labmodule|\.\ |labnum|\.1.12. Retrieve ASM Policy Signature Sets
---------------------------------------------------------------------

.. Hint::  
  1) Reuse the Postman step for 2.2.1 to send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET

     | **URL**
     
     ::
     
         https://{{bigip-dev_mgmt}}/mgmt/tm/{{module}}/policies/{{asm_policy_hash}}/signature-sets
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{bigip-dev_auth_token}}
     
     | **Body**
     |
     
**Example Response**

::

    {
        "kind": "tm:asm:policies:signature-sets:signature-setcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/signature-sets?ver=13.1.0",
        "totalItems": 1,
        "items": [
            {
            "signatureSetReference": {
                "link": "https://localhost/mgmt/tm/asm/signature-sets/pBeUaadz6x-Z55_GkLxfsg?ver=13.1.0"
            },
            "lastUpdateMicros": 1496378251000000,
            "selfLink": "https://localhost/mgmt/tm/asm/policies/W-w3q351kYbr1A9OEaUOag/signature-sets/xMpCOKC5I4INzFCab3WEmw?ver=13.1.0",
            "kind": "tm:asm:policies:signature-sets:signature-setstate",
            "alarm": true,
            "block": true,
            "id": "xMpCOKC5I4INzFCab3WEmw",
            "learn": true
            }
        ]
    }
