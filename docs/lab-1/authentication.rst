LAB 1.1 - API Authentication
=============================

Overview
---------

The iControl REST API requires initial authentication in the form of a username/password.  After authentication is successful, a token can be used to make subsequent API calls.

Preface
--------

Prior to performing this lab, the Postman environemnt should valided.  The **{{big_ip_a_mgmt}}** IP address should be the IP address of the BIG-IP GUI.  Ensure that you can log into the BIG-IP with the default username and password.  Follow the **Lab 1.1 - API Authentication** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for referance.

In this lab, the basic authenication value is the base64-encoding of the BIG-IPs default username and password **admin:admin**.

1. HTTP BASIC Authentication
-----------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/ltm

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "kind": "tm:ltm:ltmcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/ltm?ver=13.0.0",
        "items": [
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/ltm/auth?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/ltm/cipher?ver=13.0.0"
                }
            }
        ]
    }


2. Get Authentication Token
----------------------------

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/shared/authn/login

**Header**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Body**

::

    {
        "username":"admin",
        "password":"admin",
        "loginProviderName":"tmos"
    }

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "username": "admin",
        "loginProviderName": "tmos",
        "token": 
        {
            "token": "FZ42XIKJMI6UGXDD7I3VU52EUY",
            "name": "FZ42XIKJMI6UGXDD7I3VU52EUY",
            "userName": "admin",
            "authProviderName": "tmos",
            "timeout": 1200,
            "partition": "[All]",
            "generation": 1,
            "lastUpdateMicros": 1495940163849480,
            "expirationMicros": 1495941363850000,
            "kind": "shared:authz:tokens:authtokenitemstate",
            "selfLink": "https://localhost/mgmt/shared/authz/tokens/FZ42XIKJMI6UGXDD7I3VU52EUY"
        }
    }

.. attention::  Notice that the **timeout** value is 1200 seconds.

3. Verify Authentication Token Works
------------------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/ltm

**Header**

.. attention:: The following X-F5-Auth-Token is for example only.

::

    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "kind": "tm:ltm:ltmcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/ltm?ver=13.0.0",
        "items": [
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/ltm/auth?ver=13.0.0"
                }
            },
            {
                "reference": {
                    "link": "https://localhost/mgmt/tm/ltm/cipher?ver=13.0.0"
                }
            }
        ]
    }

.. attention::  Notice that the **timeout** value is changed to 36000 seconds.

4. Set Authentication Token Timeout
------------------------------------

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/shared/authz/tokens/{{big_ip_a_auth_token}}

**Header**

.. attention:: Some response content has been removed for brevity.

::

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "timeout":"36000"
    }

**Example Response**

.. attention:: Some response content has been removed for brevity.

::

    {
        "token": "F3J4CMRAYBWVD6A74A6KBP4DGQ",
        "name": "F3J4CMRAYBWVD6A74A6KBP4DGQ",
        "userName": "admin",
        "authProviderName": "tmos",
        "timeout": 36000,
        "partition": "[All]",
        "kind": "shared:authz:tokens:authtokenitemstate",
        "selfLink": "https://localhost/mgmt/shared/authz/tokens/F3J4CMRAYBWVD6A74A6KBP4DGQ"
    }

.. attention::  Notice that the **timeout** value has changed to 36000 seconds.

