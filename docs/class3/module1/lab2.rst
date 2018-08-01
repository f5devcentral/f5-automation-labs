.. |labmodule| replace:: 1
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Module |labmodule|\, Lab \ |labnum|\: Create an AFM Address List
=================================================================

Overview
--------

In this lab, the iControl REST based API will be used to create an address list that will be used with an AFM policy in a later lab.

.. NOTE::
    - Use Postman collection to complete this lab.
    - Some response content has been removed for brevity.
 
|labmodule|\.\ |labnum|\.1. List all Firewall Policies
--------------------------------------------------------

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET
     
     | **URL**
     
     ::
     
         https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/policy
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{big_ip_a_auth_token}}
     
     | **Body**

**Example Response**

.. NOTE:: 
       - A test policy has already been created on the BIG-IP for demonstration purposes.

::

    {
        "kind": "tm:security:firewall:policy:policycollectionstate",
        "selfLink": "https://localhost/mgmt/tm/security/firewall/policy?ver=13.1.0.8",
        "items": [
            {
                "kind": "tm:security:firewall:policy:policystate",
                "name": "block_all",
                "partition": "Common",
                "fullPath": "/Common/block_all",
                "generation": 5789,
                "selfLink": "https://localhost/mgmt/tm/security/firewall/policy/~Common~block_all?ver=13.1.0.8",
                "rulesReference": {
                    "link": "https://localhost/mgmt/tm/security/firewall/policy/~Common~block_all/rules?ver=13.1.0.8",
                    "isSubcollection": true
                }
            }
        ]
    }

|labmodule|\.\ |labnum|\.2. List all Address Lists
-----------------------------------------------------------

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET
     
     | **URL**
     
     ::
     
         https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list
     
     | **Headers**
     
     ::
     
	     X-F5-Auth-Token: {{big_ip_a_auth_token}}
     
     | **Body**

**Example Response**

.. NOTE:: 
    - A test address list has already been created on the BIG-IP for demonstration purposes.

::

    {
        "kind": "tm:security:firewall:address-list:address-listcollectionstate",
        "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list?ver=13.1.0.8",
        "items": [
            {
                "kind": "tm:security:firewall:address-list:address-liststate",
                "name": "test_address_list",
                "partition": "Common",
                "fullPath": "/Common/test_address_list",
                "generation": 6326,
                "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~test_address_list?ver=13.1.0.8",
                "addresses": [
                    {
                        "name": "1.1.1.1"
                    }
                ]
            }
        ]
    }

|labmodule|\.\ |labnum|\.3. Create an Address List
--------------------------------------------------

An HTTP POST to the ``/mgmt/tm/security/firewall/address-list/`` endpoint with a body containing the configuration creates an address list that can be used with a firewall policy.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         PATCH
     
     | **URL**
     
     ::
     
         https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list/
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{big_ip_a_auth_token}}
     
     | **Body**
	 
     ::
     
         {
            "name": "google-dns_address_list",
        "addresses": [
            {
                "name": "8.8.4.4"
            }  ]
         }
  2) Copy the **name** of the address list you created into the **afm_address_list** Postman environment variable.

**Example Response**

.. code-block:: rest
    :emphasize-lines: 3, 10

    {
        "kind": "tm:security:firewall:address-list:address-liststate",
        "name": "google-dns_address_list",
        "partition": "Common",
        "fullPath": "/Common/google-dns_address_list",
        "generation": 11436,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.1.0.8",
        "addresses": [
            {
                "name": "8.8.4.4"
            }
        ]
    }

|labmodule|\.\ |labnum|\.4. List a Single Address List
---------------------------------------------------------------

To retrieve the contents of a single address list, send a HTTP GET to the ``/mgmt/tm/security/firewall/address-list/`` and include the name of the address list.  For example, ``/mgmt/tm/security/firewall/address-list/google-dns_address_list``.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         GET
     
     | **URL**
     
     ::
     
         https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list/{{afm_address_list}}
     
     | **Headers**
     
     ::
     
    	 X-F5-Auth-Token: {{big_ip_a_auth_token}}
     
     | **Body**

**Example Response**

::

    {
        "kind": "tm:security:firewall:address-list:address-liststate",
        "name": "google-dns_address_list",
        "partition": "Common",
        "fullPath": "/Common/google-dns_address_list",
        "generation": 11436,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.1.0.8",
        "addresses": [
            {
                "name": "8.8.4.4"
            }
        ]
    }

|labmodule|\.\ |labnum|\.5. Update an Address List
--------------------------------------------------------

A HTTP PATCH to the ``/mgmt/tm/security/firewall/address-list/{{afm_address_list}}`` endpoint with a body containing all addresses that should exist in the address list will update this collection.

.. WARNING:: When patching an address list, be sure to include all addresses (e.g. existing and new) to ensure that the list does not get overwritten.

.. Hint::  
  1) Send a **Request** with the following details.
     
     | **Method**
     
     ::
     
         PATCH
     
     | **URL**
     
     ::
     
         https://{{big_ip_a_mgmt}}/mgmt/tm/security/firewall/address-list/{{afm_address_list}}
     
     | **Headers**
     
     ::
     
          Content-Type: application/json
	  X-F5-Auth-Token: {{big_ip_a_auth_token}}
     
     | **Body**
	 
     ::
     
		{
            "name": "google-dns_address_list",
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
    :emphasize-lines: 3, 10, 13, 16, 19, 22

    {
        "kind": "tm:security:firewall:address-list:address-liststate",
        "name": "google-dns_address_list",
        "partition": "Common",
        "fullPath": "/Common/google-dns_address_list",
        "generation": 11436,
        "selfLink": "https://localhost/mgmt/tm/security/firewall/address-list/~Common~google-dns_address_list?ver=13.1.0.8",
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
