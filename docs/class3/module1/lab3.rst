.. |labmodule| replace:: 1
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Create AFM Policy
===============================================

Overview
--------

In this lab, the iControl REST based API will be used to create a firewall policy that will leverage the previously created address list.

Specific Instructions
---------------------

Follow the below steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for reference.

.. ATTENTION:: Some response content has been removed for brevity.

1. List AFM policies
---------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy

**Headers**

:: 

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Example Response**

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

2. Create AFM policy
---------------------

An HTTP POST to the ``/mgmt/tm/security/firewall/policy`` endpoint with a body containing just a policy name creates a firewall policy.  Edit the body to add teh name of the policy you are creating.

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

::

    {
        "name": "global_default_deny"
    }

**Example Response**

.. NOTE:: Copy the full policy name as it appears in the ``"selfLink": "https://localhost/mgmt/tm/security/firewall/policy/**~Common~global_default_deny**?ver=13.0.0"`` line of the response and populate the **{{afm_policy}}** Postman environment variable.  In this case, the name of the policy is **~Common~global_default_deny**.

.. code-block:: rest
    :emphasize-lines: 3, 7

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

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Example Response**

.. NOTE:: There will be no rules listed in the newly created policy.  Rules are populated in the ``"items": []`` sub collection.

.. code-block:: rest
    :emphasize-lines: 4

    {
        "kind": "tm:security:firewall:policy:rules:rulescollectionstate",
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules?ver=13.0.0",
        "items": []
    }

4. Add default deny rule to policy
-----------------------------------

An HTTP POST to the ``/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules`` endpoint with a body containing a new rule will add the rule to the firewall policy.  Edit the body to set the action to drop.

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

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

.. code-block:: rest
    :emphasize-lines: 3-4, 7-12

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

5. Add address list rule to policy
-----------------------------------

An HTTP POST to the ``/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules`` endpoint with a body containing a new rule will add the rule to the firewall policy.  The status of the rule can be specified when the POST is made.  Edit the body to set the action to accept.

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

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

.. NOTE:: Copy the newly created rule name ``allow_google-dns`` and populate the {{afm_policy_rule}} Postman environment variable.

.. code-block:: rest
    :emphasize-lines: 3-4, 7-21

    {
        "kind": "tm:security:firewall:policy:rules:rulesstate",
        "name": "allow_google-dns",
        "fullPath": "allow_google-dns",
        "generation": 13210,
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
                "link": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~allow_google-dns?ver=13.0.0"
            }
            ]
        },
        "source": {
            "identity": {}
        }
    }

6. List policy rules
---------------------

The ``"items"`` sub collection will now be populated with the all the firewall rules when performing an HTTP GET on the rules endpoint of the **{{afm_policy}}**.

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules

**Headers**

:: 

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Example Response**

.. code-block:: rest
    :emphasize-lines: 7

    {
        "kind": "tm:security:firewall:policy:rules:rulescollectionstate",
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules?ver=13.0.0",
        "items": [
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

7. Disable Policy rule
-----------------------

An HTTP PATCH to the ``/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules/{{afm_policy_rule}}`` endpoint with a body containing a name of an existing rule can set the ``"status": "disabled"`` to deactivate a single rule.  Edit the body to set the status to disabled.

**Request**

::

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules/{{afm_policy_rule}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

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
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~global_default_deny/rules/allow_google-dns?ver=13.0.0",
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
                    "link": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.0.0"
                }
            ]
        },
        "source": {
            "identity": {}
        }
    }

8. List policy rule
--------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy/{{afm_policy}}/rules/{{afm_policy_rule}}

**Headers**

:: 

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

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
