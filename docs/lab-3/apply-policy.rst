LAB 3.3 - Apply ASM Policy to Virtual Server
=============================================

Overview
---------

In this lab, the previously created ASM policy will be apllied to a virtual server using the iControl REST API.

Lab Specific Instructions
--------------------------

Follow the **LAB 3.3 - Apply ASM Policy to Virtual Server** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for referance.

.. attention:: Some response content has been removed for brevity.

1. Apply ASM Policy to VS
--------------------------

An HTTP PATCH to the ``/mgmt/tm/asm/policies/{{asm_policy_hash}}`` endpoint with a body containing the name of a virtual server(s), in this case ``"virtualServers":["/Common/hackazon_vs"]``, will apply the ASM policy.

**Request**

::

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=
    
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
        },
        "ipIntelligenceReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/ip-intelligence?ver=13.0.0"
        },
        "protocolIndependent": true,
        "sessionAwarenessSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/session-tracking?ver=13.0.0"
        },
        "policyBuilderUrlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-url?ver=13.0.0"
        },
        "policyBuilderServerTechnologiesReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-server-technologies?ver=13.0.0"
        },
        "policyBuilderFiletypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-filetype?ver=13.0.0"
        },
        "signatureSetReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signature-sets?ver=13.0.0",
            "isSubCollection": true
        },
        "parameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationLanguage": "utf-8",
        "enforcementMode": "transparent",
        "loginEnforcementReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/login-enforcement?ver=13.0.0"
        },
        "navigationParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/navigation-parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationService": "",
        "gwtProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/gwt-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "whitelistIpReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/whitelist-ips?ver=13.0.0",
            "isSubCollection": true
        },
        "historyRevisionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/history-revisions?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder?ver=13.0.0"
        },
        "responsePageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/response-pages?ver=13.0.0",
            "isSubCollection": true
        },
        "vulnerabilityAssessmentReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/vulnerability-assessment?ver=13.0.0"
        },
        "serverTechnologyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/server-technologies?ver=13.0.0",
            "isSubCollection": true
        },
        "cookieReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookies?ver=13.0.0",
            "isSubCollection": true
        },
        "blockingSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/blocking-settings?ver=13.0.0",
            "isSubCollection": true
        },
        "hostNameReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/host-names?ver=13.0.0",
            "isSubCollection": true
        },
        "versionDeviceName": "bigip13.lab.local",
        "selfLink": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ?ver=13.0.0",
        "signatureReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signatures?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderRedirectionProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-redirection-protection?ver=13.0.0"
        },
        "filetypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/filetypes?ver=13.0.0",
            "isSubCollection": true
        },
        "id": "zD8sehzULw6Ni7GJG2XwJQ",
        "modifierName": "admin",
        "manualVirtualServers": [],
        "versionDatetime": "2017-05-30T15:46:09Z",
        "subPath": "/Common",
        "parentPolicyName": "/Common/API_ASM_POLICY_TEST",
        "sessionTrackingStatusReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/session-tracking-statuses?ver=13.0.0",
            "isSubCollection": true
        },
        "active": true,
        "auditLogReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/audit-logs?ver=13.0.0",
            "isSubCollection": true
        },
        "disallowedGeolocationReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/disallowed-geolocations?ver=13.0.0",
            "isSubCollection": true
        },
        "redirectionProtectionDomainReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/redirection-protection-domains?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationServiceManagedUpdatesOnly": false,
        "type": "security",
        "signatureSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signature-settings?ver=13.0.0"
        },
        "websocketUrlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/websocket-urls?ver=13.0.0",
            "isSubCollection": true
        },
        "xmlProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/xml-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "methodReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/methods?ver=13.0.0",
            "isSubCollection": true
        },
        "vulnerabilityReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/vulnerabilities?ver=13.0.0",
            "isSubCollection": true
        },
        "redirectionProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/redirection-protection?ver=13.0.0"
        },
        "templateReference": {
            "link": "https://localhost/mgmt/tm/asm/policy-templates/KGO8Jk0HA4ipQRG8Bfd_Dw?ver=13.0.0"
        },
        "policyBuilderSessionsAndLoginsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-sessions-and-logins?ver=13.0.0"
        },
        "policyBuilderHeaderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-header?ver=13.0.0"
        },
        "creatorName": "admin",
        "urlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/urls?ver=13.0.0",
            "isSubCollection": true
        },
        "headerReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/headers?ver=13.0.0",
            "isSubCollection": true
        },
        "xmlValidationFileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/xml-validation-files?ver=13.0.0",
            "isSubCollection": true
        },
        "lastUpdateMicros": 1496159524000000,
        "jsonProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/json-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "bruteForceAttackPreventionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/brute-force-attack-preventions?ver=13.0.0",
            "isSubCollection": true
        },
        "characterSetReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/character-sets?ver=13.0.0",
            "isSubCollection": true
        },
        "extractionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/extractions?ver=13.0.0",
            "isSubCollection": true
        },
        "suggestionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/suggestions?ver=13.0.0",
            "isSubCollection": true
        },
        "isModified": false,
        "sensitiveParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/sensitive-parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "versionPolicyName": "/Common/API_ASM_POLICY_CHILD_TEST",
        "generalReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/general?ver=13.0.0"
        }
    }

2. Retrieve ASM policy
-----------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/asm/policies/{{asm_policy_hash}}

**Headers**

::

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

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
        "virtualServers": [
            "/Common/hackazon_vs"
        ],
        "policyBuilderCookieReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-cookie?ver=13.0.0"
        },
        "ipIntelligenceReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/ip-intelligence?ver=13.0.0"
        },
        "protocolIndependent": true,
        "sessionAwarenessSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/session-tracking?ver=13.0.0"
        },
        "policyBuilderUrlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-url?ver=13.0.0"
        },
        "policyBuilderServerTechnologiesReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-server-technologies?ver=13.0.0"
        },
        "policyBuilderFiletypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-filetype?ver=13.0.0"
        },
        "signatureSetReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signature-sets?ver=13.0.0",
            "isSubCollection": true
        },
        "parameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationLanguage": "utf-8",
        "enforcementMode": "transparent",
        "loginEnforcementReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/login-enforcement?ver=13.0.0"
        },
        "navigationParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/navigation-parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "gwtProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/gwt-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "whitelistIpReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/whitelist-ips?ver=13.0.0",
            "isSubCollection": true
        },
        "historyRevisionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/history-revisions?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder?ver=13.0.0"
        },
        "responsePageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/response-pages?ver=13.0.0",
            "isSubCollection": true
        },
        "vulnerabilityAssessmentReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/vulnerability-assessment?ver=13.0.0"
        },
        "serverTechnologyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/server-technologies?ver=13.0.0",
            "isSubCollection": true
        },
        "cookieReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookies?ver=13.0.0",
            "isSubCollection": true
        },
        "blockingSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/blocking-settings?ver=13.0.0",
            "isSubCollection": true
        },
        "hostNameReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/host-names?ver=13.0.0",
            "isSubCollection": true
        },
        "versionDeviceName": "bigip13.lab.local",
        "selfLink": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ?ver=13.0.0",
        "signatureReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signatures?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderRedirectionProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-redirection-protection?ver=13.0.0"
        },
        "filetypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/filetypes?ver=13.0.0",
            "isSubCollection": true
        },
        "id": "zD8sehzULw6Ni7GJG2XwJQ",
        "modifierName": "Policy Builder",
        "manualVirtualServers": [],
        "versionDatetime": "2017-05-30T15:52:12Z",
        "subPath": "/Common",
        "parentPolicyName": "/Common/API_ASM_POLICY_TEST",
        "sessionTrackingStatusReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/session-tracking-statuses?ver=13.0.0",
            "isSubCollection": true
        },
        "active": true,
        "auditLogReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/audit-logs?ver=13.0.0",
            "isSubCollection": true
        },
        "disallowedGeolocationReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/disallowed-geolocations?ver=13.0.0",
            "isSubCollection": true
        },
        "redirectionProtectionDomainReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/redirection-protection-domains?ver=13.0.0",
            "isSubCollection": true
        },
        "type": "security",
        "signatureSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signature-settings?ver=13.0.0"
        },
        "websocketUrlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/websocket-urls?ver=13.0.0",
            "isSubCollection": true
        },
        "xmlProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/xml-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "methodReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/methods?ver=13.0.0",
            "isSubCollection": true
        },
        "vulnerabilityReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/vulnerabilities?ver=13.0.0",
            "isSubCollection": true
        },
        "redirectionProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/redirection-protection?ver=13.0.0"
        },
        "templateReference": {
            "link": "https://localhost/mgmt/tm/asm/policy-templates/KGO8Jk0HA4ipQRG8Bfd_Dw?ver=13.0.0"
        },
        "policyBuilderSessionsAndLoginsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-sessions-and-logins?ver=13.0.0"
        },
        "policyBuilderHeaderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-header?ver=13.0.0"
        },
        "creatorName": "admin",
        "urlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/urls?ver=13.0.0",
            "isSubCollection": true
        },
        "headerReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/headers?ver=13.0.0",
            "isSubCollection": true
        },
        "xmlValidationFileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/xml-validation-files?ver=13.0.0",
            "isSubCollection": true
        },
        "lastUpdateMicros": 1496159558000000,
        "jsonProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/json-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "bruteForceAttackPreventionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/brute-force-attack-preventions?ver=13.0.0",
            "isSubCollection": true
        },
        "characterSetReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/character-sets?ver=13.0.0",
            "isSubCollection": true
        },
        "extractionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/extractions?ver=13.0.0",
            "isSubCollection": true
        },
        "suggestionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/suggestions?ver=13.0.0",
            "isSubCollection": true
        },
        "isModified": false,
        "sensitiveParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/sensitive-parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "versionPolicyName": "/Common/API_ASM_POLICY_CHILD_TEST",
        "generalReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/general?ver=13.0.0"
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
    Authorization: Basic YWRtaW46YWRtaW4=
    
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
        },
        "ipIntelligenceReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/ip-intelligence?ver=13.0.0"
        },
        "protocolIndependent": true,
        "sessionAwarenessSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/session-tracking?ver=13.0.0"
        },
        "policyBuilderUrlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-url?ver=13.0.0"
        },
        "policyBuilderServerTechnologiesReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-server-technologies?ver=13.0.0"
        },
        "policyBuilderFiletypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-filetype?ver=13.0.0"
        },
        "signatureSetReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signature-sets?ver=13.0.0",
            "isSubCollection": true
        },
        "parameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationLanguage": "utf-8",
        "enforcementMode": "transparent",
        "loginEnforcementReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/login-enforcement?ver=13.0.0"
        },
        "navigationParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/navigation-parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationService": "",
        "gwtProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/gwt-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "whitelistIpReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/whitelist-ips?ver=13.0.0",
            "isSubCollection": true
        },
        "historyRevisionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/history-revisions?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder?ver=13.0.0"
        },
        "responsePageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/response-pages?ver=13.0.0",
            "isSubCollection": true
        },
        "vulnerabilityAssessmentReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/vulnerability-assessment?ver=13.0.0"
        },
        "serverTechnologyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/server-technologies?ver=13.0.0",
            "isSubCollection": true
        },
        "cookieReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookies?ver=13.0.0",
            "isSubCollection": true
        },
        "blockingSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/blocking-settings?ver=13.0.0",
            "isSubCollection": true
        },
        "hostNameReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/host-names?ver=13.0.0",
            "isSubCollection": true
        },
        "versionDeviceName": "bigip13.lab.local",
        "selfLink": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ?ver=13.0.0",
        "signatureReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signatures?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderRedirectionProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-redirection-protection?ver=13.0.0"
        },
        "filetypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/filetypes?ver=13.0.0",
            "isSubCollection": true
        },
        "id": "zD8sehzULw6Ni7GJG2XwJQ",
        "modifierName": "Policy Builder",
        "manualVirtualServers": [],
        "versionDatetime": "2017-05-30T15:52:12Z",
        "subPath": "/Common",
        "parentPolicyName": "/Common/API_ASM_POLICY_TEST",
        "sessionTrackingStatusReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/session-tracking-statuses?ver=13.0.0",
            "isSubCollection": true
        },
        "active": true,
        "auditLogReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/audit-logs?ver=13.0.0",
            "isSubCollection": true
        },
        "disallowedGeolocationReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/disallowed-geolocations?ver=13.0.0",
            "isSubCollection": true
        },
        "redirectionProtectionDomainReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/redirection-protection-domains?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationServiceManagedUpdatesOnly": false,
        "type": "security",
        "signatureSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signature-settings?ver=13.0.0"
        },
        "websocketUrlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/websocket-urls?ver=13.0.0",
            "isSubCollection": true
        },
        "xmlProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/xml-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "methodReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/methods?ver=13.0.0",
            "isSubCollection": true
        },
        "vulnerabilityReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/vulnerabilities?ver=13.0.0",
            "isSubCollection": true
        },
        "redirectionProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/redirection-protection?ver=13.0.0"
        },
        "templateReference": {
            "link": "https://localhost/mgmt/tm/asm/policy-templates/KGO8Jk0HA4ipQRG8Bfd_Dw?ver=13.0.0"
        },
        "policyBuilderSessionsAndLoginsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-sessions-and-logins?ver=13.0.0"
        },
        "policyBuilderHeaderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-header?ver=13.0.0"
        },
        "creatorName": "admin",
        "urlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/urls?ver=13.0.0",
            "isSubCollection": true
        },
        "headerReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/headers?ver=13.0.0",
            "isSubCollection": true
        },
        "xmlValidationFileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/xml-validation-files?ver=13.0.0",
            "isSubCollection": true
        },
        "lastUpdateMicros": 1496159558000000,
        "jsonProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/json-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "bruteForceAttackPreventionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/brute-force-attack-preventions?ver=13.0.0",
            "isSubCollection": true
        },
        "characterSetReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/character-sets?ver=13.0.0",
            "isSubCollection": true
        },
        "extractionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/extractions?ver=13.0.0",
            "isSubCollection": true
        },
        "suggestionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/suggestions?ver=13.0.0",
            "isSubCollection": true
        },
        "isModified": false,
        "sensitiveParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/sensitive-parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "versionPolicyName": "/Common/API_ASM_POLICY_CHILD_TEST",
        "generalReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/general?ver=13.0.0"
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

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

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
        },
        "ipIntelligenceReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/ip-intelligence?ver=13.0.0"
        },
        "protocolIndependent": true,
        "sessionAwarenessSettingsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/session-tracking?ver=13.0.0"
        },
        "policyBuilderUrlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-url?ver=13.0.0"
        },
        "policyBuilderServerTechnologiesReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-server-technologies?ver=13.0.0"
        },
        "policyBuilderFiletypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-filetype?ver=13.0.0"
        },
        "signatureSetReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signature-sets?ver=13.0.0",
            "isSubCollection": true
        },
        "parameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationLanguage": "utf-8",
        "enforcementMode": "transparent",
        "loginEnforcementReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/login-enforcement?ver=13.0.0"
        },
        "navigationParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/navigation-parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationService": "",
        "gwtProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/gwt-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "whitelistIpReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/whitelist-ips?ver=13.0.0",
            "isSubCollection": true
        },
        "historyRevisionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/history-revisions?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder?ver=13.0.0"
        },
        "responsePageReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/response-pages?ver=13.0.0",
            "isSubCollection": true
        },
        "vulnerabilityAssessmentReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/vulnerability-assessment?ver=13.0.0"
        },
        "serverTechnologyReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/server-technologies?ver=13.0.0",
            "isSubCollection": true
        },
        "cookieReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/cookies?ver=13.0.0",
            "isSubCollection": true
        },
        "blockingSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/blocking-settings?ver=13.0.0",
            "isSubCollection": true
        },
        "hostNameReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/host-names?ver=13.0.0",
            "isSubCollection": true
        },
        "versionDeviceName": "bigip13.lab.local",
        "selfLink": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ?ver=13.0.0",
        "signatureReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signatures?ver=13.0.0",
            "isSubCollection": true
        },
        "policyBuilderRedirectionProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-redirection-protection?ver=13.0.0"
        },
        "filetypeReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/filetypes?ver=13.0.0",
            "isSubCollection": true
        },
        "id": "zD8sehzULw6Ni7GJG2XwJQ",
        "modifierName": "Policy Builder",
        "manualVirtualServers": [],
        "versionDatetime": "2017-05-30T15:52:12Z",
        "subPath": "/Common",
        "parentPolicyName": "/Common/API_ASM_POLICY_TEST",
        "sessionTrackingStatusReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/session-tracking-statuses?ver=13.0.0",
            "isSubCollection": true
        },
        "active": true,
        "auditLogReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/audit-logs?ver=13.0.0",
            "isSubCollection": true
        },
        "disallowedGeolocationReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/disallowed-geolocations?ver=13.0.0",
            "isSubCollection": true
        },
        "redirectionProtectionDomainReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/redirection-protection-domains?ver=13.0.0",
            "isSubCollection": true
        },
        "applicationServiceManagedUpdatesOnly": false,
        "type": "security",
        "signatureSettingReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/signature-settings?ver=13.0.0"
        },
        "websocketUrlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/websocket-urls?ver=13.0.0",
            "isSubCollection": true
        },
        "xmlProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/xml-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "methodReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/methods?ver=13.0.0",
            "isSubCollection": true
        },
        "vulnerabilityReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/vulnerabilities?ver=13.0.0",
            "isSubCollection": true
        },
        "redirectionProtectionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/redirection-protection?ver=13.0.0"
        },
        "templateReference": {
            "link": "https://localhost/mgmt/tm/asm/policy-templates/KGO8Jk0HA4ipQRG8Bfd_Dw?ver=13.0.0"
        },
        "policyBuilderSessionsAndLoginsReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-sessions-and-logins?ver=13.0.0"
        },
        "policyBuilderHeaderReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/policy-builder-header?ver=13.0.0"
        },
        "creatorName": "admin",
        "urlReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/urls?ver=13.0.0",
            "isSubCollection": true
        },
        "headerReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/headers?ver=13.0.0",
            "isSubCollection": true
        },
        "xmlValidationFileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/xml-validation-files?ver=13.0.0",
            "isSubCollection": true
        },
        "lastUpdateMicros": 1496159558000000,
        "jsonProfileReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/json-profiles?ver=13.0.0",
            "isSubCollection": true
        },
        "bruteForceAttackPreventionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/brute-force-attack-preventions?ver=13.0.0",
            "isSubCollection": true
        },
        "characterSetReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/character-sets?ver=13.0.0",
            "isSubCollection": true
        },
        "extractionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/extractions?ver=13.0.0",
            "isSubCollection": true
        },
        "suggestionReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/suggestions?ver=13.0.0",
            "isSubCollection": true
        },
        "isModified": false,
        "sensitiveParameterReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/sensitive-parameters?ver=13.0.0",
            "isSubCollection": true
        },
        "versionPolicyName": "/Common/API_ASM_POLICY_CHILD_TEST",
        "generalReference": {
            "link": "https://localhost/mgmt/tm/asm/policies/zD8sehzULw6Ni7GJG2XwJQ/general?ver=13.0.0"
        }
    }