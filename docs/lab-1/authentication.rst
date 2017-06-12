LAB 1.2 - API Authentication
=============================

Overview
---------

The iControl REST API requires initial authentication in the form of a username/password.  After authentication is successful, a token can be used to make subsequent API calls.

Preface
--------

Prior to performing this lab, the Postman environemnt should valided.  The **{{big_ip_a_mgmt}}** IP address should be set to the IP address of the BIG-IP GUI.  In this case, the Postman environment variable should already be set to 10.1.1.5 for this lab.  Prior to perforing any of the below steps, ensure that you can log into the BIG-IP with Chrome after accepting the invalid certificate.  Postman relies on the Chrome certificate store and if the self-signed cert has not been accepted via Chrome, this extension will not work properly.

Lab Specific Instructions
--------------------------

Follow the **Lab 1.2 - API Authentication** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for referance.

In this lab, the basic authenication value is the base64-encoding of the BIG-IPs default username and password **admin:admin**.

Once successfully authenticated, the BIG-IP response will respond with an authentication token that should be copied and placed into the **{{big_ip_a_auth_token}}** Postman environemnt variable.

.. attention:: Some response content has been removed for brevity.

1. HTTP BASIC Authentication
-----------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/ltm

**Headers**

:: 

    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

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

Once successfully authenticated, the BIG-IP response will respond with an authentication token that should be copied and placed into the **{{big_ip_a_auth_token}}** Postman environemnt variable.

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/shared/authn/login

**Header**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Body**

.. code-block:: rest

    {
        "username":"admin",
        "password":"admin",
        "loginProviderName":"tmos"
    }

**Example Response**

.. note::  Notice that the **timeout** value is 1200 seconds.

.. code-block:: rest
    :emphasize-lines: 6, 10

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

3. Verify Authentication Token Works
------------------------------------

Ensure that the authentication token has been copied from the BIG-IP response and into the **{{big_ip_a_auth_token}}** Postman environment variable.

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/ltm

**Header**

.. attention:: The following X-F5-Auth-Token is for example only.

::

    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

.. code-block:: rest

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

4. Set Authentication Token Timeout
------------------------------------

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/shared/authz/tokens/{{big_ip_a_auth_token}}

**Header**

::

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

.. code-block:: rest

    {
        "timeout":"36000"
    }

**Example Response**

.. note:: The **timeout** value is now 360000 seconds.

.. code-block:: rest
    :emphasize-lines: 6

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
