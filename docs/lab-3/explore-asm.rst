LAB 3.1 - Interact with ASM
============================

.. todo:: Add Overview content

Overview
---------

.. todo:: Correct Preface content

Preface
--------

Prior to performing this lab, the Postman environemnt should valided.  The **{{big_ip_a_mgmt}}** IP address should be the IP address of the BIG-IP GUI.  Ensure that you can log into the BIG-IP with the default username and password.  Follow the **Lab 1.1 - API Authentication** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for referance.

In this lab, the basic authenication value is the base64-encoding of the BIG-IPs default username and password **admin:admin**.

1.0. Retrieve ASM resources
----------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "kind": "tm:asm:asmcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm?ver=13.0.0",
        "items": [
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/policies?ver=13.0.0"
                }
            },
                {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/server-technologies?ver=13.0.0"
                }
            }
        ]
    }

1.1. Retrieve ASM server technologies
--------------------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/server-technologies

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "kind": "tm:asm:server-technologies:server-technologycollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/server-technologies?ver=13.0.0",
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
                "selfLink": "https://localhost/mgmt/tm/asm/server-technologies/9ZC0_aLDC-KN08jDyvXHew?ver=13.0.0",
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
                "selfLink": "https://localhost/mgmt/tm/asm/server-technologies/9ySigIBMpBbYU4r8FNAt4g?ver=13.0.0",
                "id": "9ySigIBMpBbYU4r8FNAt4g"
            }
        ]
    }

2.1. Retrieve ASM policy
-------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

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

2.1. Retrieve ASM policy
-------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {

    }

3.0. Search for ASM policy
--------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies?filter=name eq hackazon

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. todo:: Include example response

.. attention:: Some response content has been removed for brevity.

::

    {

    }

3.1. Search for ASM tasks
--------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/tasks/

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "kind": "tm:asm:tasks",
        "selfLink": "https://localhost/mgmt/tm/asm/tasks?ver=13.0.0",
        "items": [
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/export-policy?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/resolve-vulnerabilities?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/check-signatures?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/terminate-vulnerability-assessment?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/apply-server-technologies?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/associate-xml-validation-files-to-xml-profile?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/export-policy-template?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/export-requests?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/initiate-vulnerability-assessment?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/import-policy-template?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/update-signatures?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/import-policy?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/bulk?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/get-vulnerability-assessment-subscriptions?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/apply-policy?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/export-signatures?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/asm/tasks/import-vulnerabilities?ver=13.0.0"
                }
            }
        ]
    }

4. Retrieve ASM policy templates
---------------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policy-templates

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "kind": "tm:asm:policy-templates:policy-templatecollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/policy-templates?ver=13.0.0",
        "totalItems": 32,
        "items": [
            {
            "policyType": "security",
            "name": "POLICY_TEMPLATE_SHAREPOINT_2007_HTTP",
            "description": "Generic template for SharePoint 2007 (http)",
            "kind": "tm:asm:policy-templates:policy-templatestate",
            "templateType": "application-ready",
            "selfLink": "https://localhost/mgmt/tm/asm/policy-templates/jmHjN-Fpm-SGwYQsrZp57A?ver=13.0.0",
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

5. Retrieve ASM signature sets
-------------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/signature-sets

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "kind": "tm:asm:signature-sets:signature-setcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/signature-sets?ver=13.0.0",
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
            "selfLink": "https://localhost/mgmt/tm/asm/signature-sets/pBeUaadz6x-Z55_GkLxfsg?ver=13.0.0",
            "defaultAlarm": true,
            "systems": [
                {
                    "systemReference": {
                        "link": "https://localhost/mgmt/tm/asm/signature-systems/EStDgGiP9nSPgKBhSlDyvQ?ver=13.0.0"
                    }
                    },
                    {
                    "systemReference": {
                        "link": "https://localhost/mgmt/tm/asm/signature-systems/rMiBJmL6DLmnfmW_pXHmdw?ver=13.0.0"
                    }
                    },
                    {
                    "systemReference": {
                        "link": "https://localhost/mgmt/tm/asm/signature-systems/b9hI1sIulARJ09bbdy0VQw?ver=13.0.0"
                    }
                }
            ],
            "id": "pBeUaadz6x-Z55_GkLxfsg",
            "type": "filter-based",
            "signatureReferences": [
                {
                "link": "https://localhost/mgmt/tm/asm/signatures/nHU-8zUxj8ldUevwMgFpvw?ver=13.0.0"
                },
                {
                "link": "https://localhost/mgmt/tm/asm/signatures/RTFj6E66sH7g7XMa9ihQOQ?ver=13.0.0"
                }
            ],
            "category": "User-defined",
            "defaultBlock": true,
            "defaultLearn": true
            }
        ]
    }

6. Retrieve ASM signature systems
----------------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/signature-systems

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "kind": "tm:asm:signature-systems:signature-systemcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/signature-systems?ver=13.0.0",
        "totalItems": 44,
        "items": [
            {
                "kind": "tm:asm:signature-systems:signature-systemstate",
                "selfLink": "https://localhost/mgmt/tm/asm/signature-systems/EStDgGiP9nSPgKBhSlDyvQ?ver=13.0.0",
                "name": "General Database",
                "id": "EStDgGiP9nSPgKBhSlDyvQ"
            },
            {
                "kind": "tm:asm:signature-systems:signature-systemstate",
                "selfLink": "https://localhost/mgmt/tm/asm/signature-systems/rMiBJmL6DLmnfmW_pXHmdw?ver=13.0.0",
                "name": "Various systems",
                "id": "rMiBJmL6DLmnfmW_pXHmdw"
            }
        ]
    }

7. Retrieve ASM attack types
-----------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/attack-types

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "kind": "tm:asm:attack-types:attack-typecollectionstate",
        "selfLink": "https://localhost/mgmt/tm/asm/attack-types?ver=13.0.0",
        "totalItems": 37,
        "items": [
            {
                "kind": "tm:asm:attack-types:attack-typestate",
                "selfLink": "https://localhost/mgmt/tm/asm/attack-types/9yL3q5_pO0E3pK1Uz9x2cw?ver=13.0.0",
                "name": "Remote File Include",
                "id": "9yL3q5_pO0E3pK1Uz9x2cw",
                "description": "Remote File Inclusion attacks allow attackers to run arbitrary code on a vulnerable website."
            },
            {
                "kind": "tm:asm:attack-types:attack-typestate",
                "selfLink": "https://localhost/mgmt/tm/asm/attack-types/ufg0smEkZrpmkoDHfSPGdQ?ver=13.0.0",
                "name": "Non-browser Client",
                "id": "ufg0smEkZrpmkoDHfSPGdQ",
                "description": "An attempt is made by a non-browser client to explore the site."
            }
        ]
    }

8. Retrieve ASM policy urls
----------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}/urls

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. todo:: Include example response

.. attention:: Some response content has been removed for brevity.

::

    {

    }

9. Retrieve ASM policy signature sets
--------------------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}/signature-sets

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. todo:: Include example response

.. attention:: Some response content has been removed for brevity.

::

    {

    }