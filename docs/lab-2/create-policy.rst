LAB 2.1 - Create AFM Address List
==================================

Overview
---------


Preface
--------

Prior to performing this lab, the Postman environemnt should valided.  The **{{big_ip_a_mgmt}}** IP address should be the IP address of the BIG-IP GUI.  Ensure that you can log into the BIG-IP with the default username and password.  Follow the **Lab 1.1 - API Authentication** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for referance.

In this lab, the basic authenication value is the base64-encoding of the BIG-IPs default username and password **admin:admin**.

1. List AFM policies
---------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

::

    {
        "kind": "tm:security:firewall:policy:policycollectionstate",
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

2. Create AFM policy
---------------------

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Body**

::

    {
        "name": "global_default_deny"
    }

**Example Response**

::

    {
        "kind": "tm:security:firewall:policy:policystate",
        "name": "global_default_deny",
        "partition": "Common",
        "fullPath": "/Common/global_default_deny",
        "generation": 11451,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny?ver=13.0.0",
        "rulesReference": {
            "link": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules?ver=13.0.0",
            "isSubcollection": true
        }
    }

3. List AFM policy rules
-------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

::

    {
        "kind": "tm:security:firewall:policy:rules:rulescollectionstate",
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules?ver=13.0.0",
        "items": []
    }

4. Add default deny rule to policy
-----------------------------------

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Body**

::

    {
        "name": "default_deny",
        "fullPath": "default_deny",
        "action": "drop",
        "ipProtocol": "any",
        "iruleSampleRate": 1,
        "log": "no",
        "status": "enabled",
        "destination": { }
        "place-before": "none"
    }

**Example Response**

::

    {
        "kind": "tm:security:firewall:policy:rules:rulesstate",
        "name": "default_deny",
        "fullPath": "default_deny",
        "generation": 11464,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/default_deny?ver=13.0.0",
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

5. List policy rules
---------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

::

    {
        "kind": "tm:security:firewall:policy:rules:rulescollectionstate",
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules?ver=13.0.0",
        "items": [
            {
                "kind": "tm:security:firewall:policy:rules:rulesstate",
                "name": "default_deny",
                "fullPath": "default_deny",
                "generation": 11464,
                "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/default_deny?ver=13.0.0",
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
        ]
    }

6. Disable Policy
------------------

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Body**

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

**Example Response**

::

    {
        "kind": "tm:security:firewall:policy:rules:rulesstate",
        "name": "allow_google-dns",
        "fullPath": "allow_google-dns",
        "generation": 11470,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/allow_google-dns?ver=13.0.0",
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
                "link": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.0.0"
            }
            ]
        },
        "source": {
            "identity": {}
        }
    }

7. List policy rules
---------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

::

    {
        "kind": "tm:security:firewall:policy:rules:rulescollectionstate",
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules?ver=13.0.0",
        "items": [
            {
                "kind": "tm:security:firewall:policy:rules:rulesstate",
                "name": "allow_google-dns",
                "fullPath": "allow_google-dns",
                "generation": 11470,
                "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/allow_google-dns?ver=13.0.0",
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
                            "link": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.0.0"
                        }
                    ]
                },
                "source": {
                    "identity": {}
                }
            },
            {
                "kind": "tm:security:firewall:policy:rules:rulesstate",
                "name": "default_deny",
                "fullPath": "default_deny",
                "generation": 11464,
                "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/default_deny?ver=13.0.0",
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
        ]
    }

8. Diable poilicy
------------------

**Request**

::

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules/{{afm_policy_rule}}

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Body**

::

    {
        "status": "disabled"
    }

**Example Response**

::

    {
        "kind": "tm:security:firewall:policy:rules:rulesstate",
        "name": "allow_google-dns",
        "fullPath": "allow_google-dns",
        "generation": 11483,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/allow_google-dns?ver=13.0.0",
        "action": "accept",
        "ipProtocol": "any",
        "iruleSampleRate": 1,
        "log": "yes",
        "status": "disabled",
        "destination": {
            "addressLists": [
            "/Common/google-dns_address_list"
            ],
            "addressListsReference": [
            {
                "link": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.0.0"
            }
            ]
        },
        "source": {
            "identity": {}
        }
    }