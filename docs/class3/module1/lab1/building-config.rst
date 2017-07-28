Lab 1.4: Building a Basic LTM Config
====================================

Overview
--------

In this lab, the iControl REST API will be used to build a basic monitor, node, pool, and virtual server configuration on the BIG-IP.

Specific Instructions
---------------------

Prior to performing the below steps, validate that the Hackazon web site is not accessible via the Windows jump box by clicking on the Hackazon bookmark in the Chrome toolbar.

Follow the **Lab 1.4 - Building a Basic LTM Config** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for reference.

.. ATTENTION:: Some response content has been removed for brevity.

1. Create an HTTP Monitor
--------------------------

An HTTP POST to the ``/mgmt/tm/ltm/monitor/http`` endpoint with a body containing the monitor configuration creates a monitor.

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/monitor/http

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

::

    {
        "name":"hackazon_monitor",
        "send":"GET /\r\n"
    }

**Example Response**

::

    {
        "kind": "tm:ltm:monitor:http:httpstate",
        "name": "hackazon_monitor",
        "partition": "Common",
        "fullPath": "/Common/hackazon_monitor",
        "generation": 0,
        "selfLink": "https://localhost/mgmt/tm/ltm/monitor/http/~Common~hackazon_monitor?ver=13.0.0",
        "adaptive": "disabled",
        "adaptiveDivergenceType": "relative",
        "adaptiveDivergenceValue": 25,
        "adaptiveLimit": 200,
        "adaptiveSamplingTimespan": 300,
        "defaultsFrom": "/Common/http",
        "destination": "*:*",
        "interval": 5,
        "ipDscp": 0,
        "manualResume": "disabled",
        "reverse": "disabled",
        "send": "GET / HTTP/\r\n",
        "timeUntilUp": 0,
        "timeout": 16,
        "transparent": "disabled",
        "upInterval": 0
    }

2. Create a Pool
-----------------

An HTTP POST to the ``/mgmt/tm/ltm/pool`` endpoint with a body containing the configuration creates a pool with a node(s).

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/pool

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

::

    {
        "name":"hackazon_pool",
        "monitor":"/Common/hackazon_monitor",
        "members": ["10.1.20.10:80"]
    }

**Example Response**

.. code-block:: rest
    :emphasize-lines: 3, 20

    {
        "kind": "tm:ltm:pool:poolstate",
        "name": "hackazon_pool",
        "partition": "Common",
        "fullPath": "/Common/hackazon_pool",
        "generation": 10781,
        "selfLink": "https://localhost/mgmt/tm/ltm/pool/~Common~hackazon_pool?ver=13.0.0",
        "allowNat": "yes",
        "allowSnat": "yes",
        "ignorePersistedWeight": "disabled",
        "ipTosToClient": "pass-through",
        "ipTosToServer": "pass-through",
        "linkQosToClient": "pass-through",
        "linkQosToServer": "pass-through",
        "loadBalancingMode": "round-robin",
        "minActiveMembers": 0,
        "minUpMembers": 0,
        "minUpMembersAction": "failover",
        "minUpMembersChecking": "disabled",
        "monitor": "/Common/hackazon_monitor ",
        "queueDepthLimit": 0,
        "queueOnConnectionLimit": "disabled",
        "queueTimeLimit": 0,
        "reselectTries": 0,
        "serviceDownAction": "none",
        "slowRampTime": 10,
        "membersReference": {
            "link": "https://localhost/mgmt/tm/ltm/pool/~Common~hackazon_pool/members?ver=13.0.0",
            "isSubcollection": true
        }
    }

3. Create a HTTP Profile
-------------------------

An HTTP POST to the ``/mgmt/tm/ltm/profile/http`` endpoint with a body containing the configuration creates a profile.

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/profile/http

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

::

    {
        "name":"hackazon_http_profile",
        "insertXforwardedFor":"enabled",
        "serverAgentName":"hackazon"
    }

**Example Response**

.. code-block:: rest
    :emphasize-lines: 3, 17, 18

    {
        "kind": "tm:ltm:profile:http:httpstate",
        "name": "hackazon_http_profile",
        "partition": "Common",
        "fullPath": "/Common/hackazon_http_profile",
        "generation": 10783,
        "selfLink": "https://localhost/mgmt/tm/ltm/profile/http/~Common~hackazon_http_profile?ver=13.0.0",
        "acceptXff": "disabled",
        "appService": "none",
        "basicAuthRealm": "none",
        "defaultsFrom": "/Common/http",
        "defaultsFromReference": {
            "link": "https://localhost/mgmt/tm/ltm/profile/http/~Common~http?ver=13.0.0"
        },
        "description": "none",
        "encryptCookies": [],
        "insertXforwardedFor": "enabled",
        "serverAgentName": "hackazon"
    }

4. Create a TCP profile
------------------------

An HTTP POST to the ``/mgmt/tm/ltm/profile/tcp`` endpoint with a body containing the configuration creates a TCP profile.

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/profile/tcp

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

::

    {
        "name":"hackazon_tcp_clientside_profile",
        "nagle":"disabled",
        "sendBufferSize":"16000"
    }

**Example Response**

.. code-block:: rest
    :emphasize-lines: 3, 23, 24

    {
        "kind": "tm:ltm:profile:tcp:tcpstate",
        "name": "hackazon_tcp_clientside_profile",
        "partition": "Common",
        "fullPath": "/Common/hackazon_tcp_clientside_profile",
        "generation": 10784,
        "selfLink": "https://localhost/mgmt/tm/ltm/profile/tcp/~Common~hackazon_tcp_clientside_profile?ver=13.0.0",
        "abc": "enabled",
        "ackOnPush": "enabled",
        "appService": "none",
        "autoProxyBufferSize": "disabled",
        "autoReceiveWindowSize": "disabled",
        "autoSendBufferSize": "disabled",
        "closeWaitTimeout": 5,
        "cmetricsCache": "enabled",
        "cmetricsCacheTimeout": 0,
        "congestionControl": "high-speed",
        "defaultsFrom": "/Common/tcp",
        "defaultsFromReference": {
            "link": "https://localhost/mgmt/tm/ltm/profile/tcp/~Common~tcp?ver=13.0.0"
        },
        "keepAliveInterval": 1800,
        "nagle": "disabled",
        "sendBufferSize": 16000
    }

5. Create a Virtual Server
---------------------------

An HTTP POST to the ``/mgmt/tm/ltm/virtual`` endpoint with a body containing the configuration creates a virtual server.

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/virtual

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Body**

::

    {
        "name":"hackazon_vs",
        "destination":"10.1.10.10:80",
        "ipProtocol":"tcp",
        "pool":"hackazon_pool",
        "sourceAddressTranslation": { "type":"automap" },
        "profiles": [
            { "name":"/Common/hackazon_tcp_clientside_profile", "context":"clientside" },
            { "name":"/Common/tcp-wan-optimized", "context":"serverside" },
            "/Common/hackazon_http_profile"
        ]
    }

**Example Response**

.. NOTE:: The profiles for this virtual server is a subcollection.  This collection can be access by performing a GET on the profiles endpoint for this specific virtual server ``https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/virtual/~Common~hackazon_vs/profiles``.

.. code-block:: rest
    :emphasize-lines: 3, 15, 20, 30, 31, 32, 43, 44, 45, 46

    {
        "kind": "tm:ltm:virtual:virtualstate",
        "name": "hackazon_vs",
        "partition": "Common",
        "fullPath": "/Common/hackazon_vs",
        "generation": 10785,
        "selfLink": "https://localhost/mgmt/tm/ltm/virtual/~Common~hackazon_vs?ver=13.0.0",
        "addressStatus": "yes",
        "autoLasthop": "default",
        "cmpEnabled": "yes",
        "connectionLimit": 0,
        "destination": "/Common/10.1.10.20:80",
        "enabled": true,
        "gtmScore": 0,
        "ipProtocol": "tcp",
        "mask": "255.255.255.255",
        "mirror": "disabled",
        "mobileAppTunnel": "disabled",
        "nat64": "disabled",
        "pool": "/Common/hackazon_pool",
        "poolReference": {
            "link": "https://localhost/mgmt/tm/ltm/pool/~Common~hackazon_pool?ver=13.0.0"
        },
        "rateLimit": "disabled",
        "rateLimitDstMask": 0,
        "rateLimitMode": "object",
        "rateLimitSrcMask": 0,
        "serviceDownImmediateAction": "none",
        "source": "0.0.0.0/0",
        "sourceAddressTranslation": {
            "type": "automap"
        },
        "sourcePort": "preserve",
        "synCookieStatus": "not-activated",
        "translateAddress": "enabled",
        "translatePort": "enabled",
        "vlansDisabled": true,
        "vsIndex": 9,
        "policiesReference": {
            "link": "https://localhost/mgmt/tm/ltm/virtual/~Common~hackazon_vs/policies?ver=13.0.0",
            "isSubcollection": true
        },
        "profilesReference": {
            "link": "https://localhost/mgmt/tm/ltm/virtual/~Common~hackazon_vs/profiles?ver=13.0.0",
            "isSubcollection": true
        }
    }


6. Retrieve VS information
---------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/virtual/~Common~hackazon_vs/

**Headers**

:: 

    X-F5-Auth-Token: {{big_ip_a_auth_token}}

**Example Response**

::

    {
        "kind": "tm:ltm:virtual:virtualstate",
        "name": "hackazon_vs",
        "partition": "Common",
        "fullPath": "/Common/hackazon_vs",
        "generation": 10785,
        "selfLink": "https://localhost/mgmt/tm/ltm/virtual/~Common~hackazon_vs?ver=13.0.0",
        "addressStatus": "yes",
        "autoLasthop": "default",
        "cmpEnabled": "yes",
        "connectionLimit": 0,
        "destination": "/Common/10.1.10.20:80",
        "enabled": true,
        "gtmScore": 0,
        "ipProtocol": "tcp",
        "mask": "255.255.255.255",
        "mirror": "disabled",
        "mobileAppTunnel": "disabled",
        "nat64": "disabled",
        "pool": "/Common/hackazon_pool",
        "poolReference": {
            "link": "https://localhost/mgmt/tm/ltm/pool/~Common~hackazon_pool?ver=13.0.0"
        },
        "rateLimit": "disabled",
        "rateLimitDstMask": 0,
        "rateLimitMode": "object",
        "rateLimitSrcMask": 0,
        "serviceDownImmediateAction": "none",
        "source": "0.0.0.0/0",
        "sourceAddressTranslation": {
            "type": "automap"
        },
        "sourcePort": "preserve",
        "synCookieStatus": "not-activated",
        "translateAddress": "enabled",
        "translatePort": "enabled",
        "vlansDisabled": true,
        "vsIndex": 9,
        "policiesReference": {
            "link": "https://localhost/mgmt/tm/ltm/virtual/~Common~hackazon_vs/policies?ver=13.0.0",
            "isSubcollection": true
        },
        "profilesReference": {
            "link": "https://localhost/mgmt/tm/ltm/virtual/~Common~hackazon_vs/profiles?ver=13.0.0",
            "isSubcollection": true
        }
    }

7. Validate the virtual server
-------------------------------

Click on the Hackazon bookmark in the Chrome toolbar and validate that the Hackazon web site is now accessible.
