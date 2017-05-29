LAB 2.1 - Create AFM Address List
==================================

Overview
---------


Preface
--------

Prior to performing this lab, the Postman environemnt should valided.  The **{{big_ip_a_mgmt}}** IP address should be the IP address of the BIG-IP GUI.  Ensure that you can log into the BIG-IP with the default username and password.  Follow the **Lab 1.1 - API Authentication** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for referance.

In this lab, the basic authenication value is the base64-encoding of the BIG-IPs default username and password **admin:admin**.

1. List Firewall Policies
--------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy

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

2. List all Firewall Address Lists
-----------------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Response**

::

    {
        "kind": "tm:security:firewall:address-list:address-listcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list?ver=13.0.0",
        "items": [
            {
                "kind": "tm:security:firewall:address-list:address-liststate",
                "name": "test_address_list",
                "partition": "Common",
                "fullPath": "/Common/test_address_list",
                "generation": 6326,
                "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~test_address_list?ver=13.0.0",
                "addresses": [
                    {
                        "name": "1.1.1.1"
                    }
                ]
            }
        ]
    }

3. Create Firewall Address List
--------------------------------

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list/

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Body**

::

    {
        "name": "google-dns_address_list",
        "addresses": [
            {
                "name": "8.8.4.4"
            }
        ]
    }

**Example Request**

::

    {
        "kind": "tm:security:firewall:address-list:address-liststate",
        "name": "google-dns_address_list",
        "partition": "Common",
        "fullPath": "/Common/google-dns_address_list",
        "generation": 11436,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.0.0",
        "addresses": [
            {
                "name": "8.8.4.4"
            }
        ]
    }

4. List Single Firewall Address List
-------------------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list/{{afm_address_list}}

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

**Example Request**

::

    {
        "kind": "tm:security:firewall:address-list:address-liststate",
        "name": "google-dns_address_list",
        "partition": "Common",
        "fullPath": "/Common/google-dns_address_list",
        "generation": 11436,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.0.0",
        "addresses": [
            {
                "name": "8.8.4.4"
            }
        ]
    }

5. Update Firewall Address List
--------------------------------

**Request**

::

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list/{{afm_address_list}}

**Headers**

:: 

    Content-Type: application/json
    Authorization: Basic YWRtaW46YWRtaW4=

.. note:: Include the contents of the address list plus the new address(es) to ensure that the contents are not overwritten.

**Body**

::

    {
        "addresses": [
            {
                "name": "8.8.4.4"
            },
            {
                "name": "8.8.8.8"
            }
        ]
    }

**Example Request**

::

    {
        "kind": "tm:security:firewall:address-list:address-liststate",
        "name": "google-dns_address_list",
        "partition": "Common",
        "fullPath": "/Common/google-dns_address_list",
        "generation": 11436,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.0.0",
        "addresses": [
            {
                "name": "8.8.4.4"
            },
            {
                "name": "8.8.8.8"
            }
        ]
    }