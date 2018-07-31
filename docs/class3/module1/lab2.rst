.. |labmodule| replace:: 1
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Create AFM Address List
=====================================================

Overview
--------

In this lab, the iControl REST based API will be used to create an address list that will be used with an AFM policy in a later lab.

Specific Instructions
----------------------

Follow the below steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for reference.

.. ATTENTION:: Some response content has been removed for brevity.

1. List Firewall Policies
--------------------------

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy

**Headers**

:: 

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Example Response**

.. NOTE:: A test policy has already been created on the BIG-IP for demonstration purposes.

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

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Example Response**

.. NOTE:: A test address list has already been created on the BIG-IP for demonstration purposes.

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

3. Create an Address List
--------------------------

An HTTP POST to the ``/mgmt/tm/security/firewall/address-list/`` endpoint with a body containing the configuration creates an address list that can be used with a firewall policy.  Make sure you edit the body to include the name fo the address list.

**Request**

::

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list/

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

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
.
.. note:: Copy the **name** of the address list you created into the **afm_address_list** Postman environment variable

**Example Response**

.. code-block:: rest
    :emphasize-lines: 3, 8-12

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

.. note:: Ensure that the **afm_address_list** Postman environment variable has been populated with the name of the address list.

**Request**

::

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list/{{afm_address_list}}

**Headers**

:: 

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Example Response**

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

An HTTP PATCH to the ``/mgmt/tm/security/firewall/address-list/{{afm_address_list}}`` endpoint with a body containing all addresses that should exist in the address list will update this collection.

**Request**

::

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list/{{afm_address_list}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

.. NOTE:: Include the contents of the address list plus the new address(es) to ensure that the contents are not overwritten.

**Body**

.. WARNING:: When patching an address list, be sure to include all addresses (e.g. existing and new) to ensure that the list does not get overwritten.

::

    {
        "addresses": [
            {
                "name": "1.1.1.1"
            },            
            {
                "name": "2.2.2.2"
            },            
            {
                "name": "3.3.3.3"
            },            
            {
                "name": "4.4.4.4"
            },
            {
                "name": "8.8.4.4"
            }
        ]
    }

**Example Response**

.. code-block:: rest
    :emphasize-lines: 3, 8-15

    {
        "kind": "tm:security:firewall:address-list:address-liststate",
        "name": "google-dns_address_list",
        "partition": "Common",
        "fullPath": "/Common/google-dns_address_list",
        "generation": 11436,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.0.0",
        "addresses": [
            {
                "name": "1.1.1.1"
            },            
            {
                "name": "2.2.2.2"
            },            
            {
                "name": "3.3.3.3"
            },            
            {
                "name": "4.4.4.4"
            },
            {
                "name": "8.8.4.4"
            }
        ]
    }
