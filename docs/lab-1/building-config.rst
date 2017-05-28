LAB 1.3 - Building a Basic LTM Config
======================================

Overview
---------


Preface
--------


1. Create a HTTP Monitor
-------------------------

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/monitor/http

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "name":"hackazon_monitor",
        "send":"GET / HTTP/1.0\r\n\r\n",
        "recv":"Hello"
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
        "recv": "Hello",
        "reverse": "disabled",
        "send": "GET / HTTP/1.0\r\n\r\n",
        "timeUntilUp": 0,
        "timeout": 16,
        "transparent": "disabled",
        "upInterval": 0
    }

2. Create a Pool
-----------------

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/pool

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "name":"hackazon_pool",
        "monitor":"/Common/hackazon_monitor",
        "members": ["10.1.20.20:80"]
    }

**Example Response**

::

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

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/profile/http

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "name":"hackazon_http_profile",
        "insertXforwardedFor":"enabled",
        "serverAgentName":"hackazon"
    }

**Example Response**

::

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
        "enforcement": {
            "excessClientHeaders": "reject",
            "excessServerHeaders": "reject",
            "knownMethods": [
            "CONNECT",
            "DELETE",
            "GET",
            "HEAD",
            "LOCK",
            "OPTIONS",
            "POST",
            "PROPFIND",
            "PUT",
            "TRACE",
            "UNLOCK"
            ],
            "maxHeaderCount": 64,
            "maxHeaderSize": 32768,
            "maxRequests": 0,
            "oversizeClientHeaders": "reject",
            "oversizeServerHeaders": "reject",
            "pipeline": "allow",
            "truncatedRedirects": "disabled",
            "unknownMethod": "allow"
        },
        "explicitProxy": {
            "badRequestMessage": "none",
            "badResponseMessage": "none",
            "connectErrorMessage": "none",
            "defaultConnectHandling": "deny",
            "dnsErrorMessage": "none",
            "dnsResolver": "none",
            "hostNames": [],
            "routeDomain": "none",
            "tunnelName": "none"
        },
        "fallbackHost": "none",
        "fallbackStatusCodes": [],
        "headerErase": "none",
        "headerInsert": "none",
        "hsts": {
            "includeSubdomains": "enabled",
            "maximumAge": 16070400,
            "mode": "disabled",
            "preload": "disabled"
        },
        "insertXforwardedFor": "enabled",
        "lwsSeparator": "none",
        "lwsWidth": 80,
        "oneconnectTransformations": "enabled",
        "proxyType": "reverse",
        "redirectRewrite": "none",
        "requestChunking": "preserve",
        "responseChunking": "selective",
        "responseHeadersPermitted": [],
        "serverAgentName": "hackazon",
        "sflow": {
            "pollInterval": 0,
            "pollIntervalGlobal": "yes",
            "samplingRate": 0,
            "samplingRateGlobal": "yes"
        },
        "viaHostName": "none",
        "viaRequest": "preserve",
        "viaResponse": "preserve",
        "xffAlternativeNames": []
    }

4. Create a HTTP Monitor
-------------------------

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/profile/tcp

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "name":"hackazon_tcp_clientside_profile",
        "nagle":"disabled",
        "sendBufferSize":"16000"
    }

**Example Response**

::

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
        "deferredAccept": "disabled",
        "delayWindowControl": "disabled",
        "delayedAcks": "enabled",
        "description": "none",
        "dsack": "disabled",
        "earlyRetransmit": "disabled",
        "ecn": "disabled",
        "enhancedLossRecovery": "disabled",
        "fastOpen": "disabled",
        "fastOpenCookieExpiration": 21600,
        "finWait_2Timeout": 300,
        "finWaitTimeout": 5,
        "hardwareSynCookie": "enabled",
        "idleTimeout": 300,
        "initCwnd": 3,
        "initRwnd": 3,
        "ipDfMode": "pmtu",
        "ipTosToClient": "0",
        "ipTtlMode": "proxy",
        "ipTtlV4": 255,
        "ipTtlV6": 64,
        "keepAliveInterval": 1800,
        "limitedTransmit": "enabled",
        "linkQosToClient": "0",
        "maxRetrans": 8,
        "maxSegmentSize": 1460,
        "md5Signature": "disabled",
        "minimumRto": 1000,
        "mptcp": "disabled",
        "mptcpCsum": "disabled",
        "mptcpCsumVerify": "disabled",
        "mptcpDebug": "disabled",
        "mptcpFallback": "reset",
        "mptcpFastjoin": "disabled",
        "mptcpIdleTimeout": 300,
        "mptcpJoinMax": 5,
        "mptcpMakeafterbreak": "disabled",
        "mptcpNojoindssack": "disabled",
        "mptcpRtomax": 5,
        "mptcpRxmitmin": 1000,
        "mptcpSubflowmax": 6,
        "mptcpTimeout": 3600,
        "nagle": "disabled",
        "pktLossIgnoreBurst": 0,
        "pktLossIgnoreRate": 0,
        "proxyBufferHigh": 49152,
        "proxyBufferLow": 32768,
        "proxyMss": "enabled",
        "proxyOptions": "enabled",
        "ratePace": "disabled",
        "ratePaceMaxRate": 0,
        "receiveWindowSize": 65535,
        "resetOnTimeout": "enabled",
        "rexmtThresh": 3,
        "selectiveAcks": "enabled",
        "selectiveNack": "disabled",
        "sendBufferSize": 16000,
        "slowStart": "enabled",
        "synCookieEnable": "enabled",
        "synCookieWhitelist": "disabled",
        "synMaxRetrans": 3,
        "synRtoBase": 3000,
        "tailLossProbe": "disabled",
        "tcpOptions": "none",
        "timeWaitRecycle": "enabled",
        "timeWaitTimeout": "2000",
        "timestamps": "enabled",
        "verifiedAccept": "disabled",
        "zeroWindowTimeout": 20000
    }

5. Create a Virtual Server
---------------------------

**Request**

:: 

    POST https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/virtual

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "name":"hackazon_vs",
        "destination":"10.1.10.20:80",
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


6. Retrieve VS information
---------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/ltm/virtual/~Common~hackazon_vs/

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

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