LAB 1.3 - BIG-IP Module Provisioning
=====================================

Overview
---------

In this lab, the iControl REST API will be used to provision a module on the BIG-IP.  More specifially, the Advanced Firewall Manager (AFM) module will be provisioned for use in **LAB 2 - CONFIGURING AFM**.

Lab Specific Instructions
--------------------------

Prior to performing the below steps, validate the **{{module}}** Postman environemnt variable.  The **{{module}}** should be set to **afm**.

Follow the **Lab 1.3 - BIG-IP Module Provisioning** steps in order found in the Postman collection to complete this portion of the lab.  The requests and responses have been included below for referance.

.. attention:: Some response content has been removed for brevity.

1. Retrieve all module provision states
----------------------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

.. note:: The **afm** module is currently provisioned for **none** while the **ltm** module is provisioned for **nominal**.

.. code-block:: rest
    :emphasize-lines: 13, 24

    {
        "kind": "tm:sys:provision:provisioncollectionstate",
        "selfLink": "https://localhost/mgmt/tm/sys/provision?ver=13.0.0",
        "items": [
            {
                "kind": "tm:sys:provision:provisionstate",
                "name": "afm",
                "fullPath": "afm",
                "generation": 5609,
                "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
                "cpuRatio": 0,
                "diskRatio": 0,
                "level": "none",
                "memoryRatio": 0
            },
            {
                "kind": "tm:sys:provision:provisionstate",
                "name": "ltm",
                "fullPath": "ltm",
                "generation": 1,
                "selfLink": "https://localhost/mgmt/tm/sys/provision/ltm?ver=13.0.0",
                "cpuRatio": 0,
                "diskRatio": 0,
                "level": "nominal",
                "memoryRatio": 0
            }
        ]
    }

2. Retrieve single module provision state
------------------------------------------

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

.. note:: The **afm** module is currently not provisioned.

.. code-block:: rest
    :emphasize-lines: 9

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "afm",
        "fullPath": "afm",
        "generation": 5609,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "none",
        "memoryRatio": 0
    }

3.1. Provision module
----------------------

The **afm** module is provisioned using an HTTP PATCH with a body containing a provisioning level to the REST endpoint for ``mgmt/tm/sys/provision/{{module}}``.

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

.. code-block:: rest
    :emphasize-lines: 2

    {
        "level":"nominal"
    }

**Example Response**

.. note:: The **afm** module has been provisioned with a **level** of **nominal**.

.. code-block:: rest
    :emphasize-lines: 9

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "afm",
        "fullPath": "afm",
        "generation": 10636,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "nominal",
        "memoryRatio": 0
    }

3.2. Deprovision module
------------------------

This request is will serve as an example of how to deprovision a BIG-IP module.

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "level":"none"
    }

**Example Response**

.. code-block:: rest
    :emphasize-lines: 9

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "afm",
        "fullPath": "afm",
        "generation": 10714,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "none",
        "memoryRatio": 0
    }

3.3. Re-provision module
---------------------------

Re-provision the **afm** module if previously deprovisioned.

**Request**

:: 

    PATCH https://{{big_ip_a_mgmt}}/mgmt/tm/sys/provision/{{module}}

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Body**

::

    {
        "level":"nominal"
    }

**Example Response**

.. code-block:: rest
    :emphasize-lines: 9

    {
        "kind": "tm:sys:provision:provisionstate",
        "name": "afm",
        "fullPath": "afm",
        "generation": 10636,
        "selfLink": "https://localhost/mgmt/tm/sys/provision/afm?ver=13.0.0",
        "cpuRatio": 0,
        "diskRatio": 0,
        "level": "nominal",
        "memoryRatio": 0
    }

4. Determine license state
---------------------------

Performing a GET on the ``/mgmt/tm/sys/license`` endpoint can be used to quickly determine the license registration key used to license a BIG-IP.

**Request**

:: 

    GET https://{{big_ip_a_mgmt}}/mgmt/tm/sys/license

**Headers**

:: 

    Content-Type: application/json
    X-F5-Auth-Token: UNNTQM2S27E4RSXY7BRLQVTCSC

**Example Response**

.. code-block:: rest
    :emphasize-lines: 24

    {
        "kind": "tm:sys:license:licensestats",
        "selfLink": "https://localhost/mgmt/tm/sys/license?ver=13.0.0",
        "entries": {
            "https://localhost/mgmt/tm/sys/license/0": {
            "nestedStats": {
                "entries": {
                "licenseEndDate": {
                    "description": "2017/06/10"
                },
                "licenseStartDate": {
                    "description": "2017/05/09"
                },
                "licensedOnDate": {
                    "description": "2017/05/10"
                },
                "licensedVersion": {
                    "description": "13.0.0"
                },
                "platformId": {
                    "description": "Z100"
                },
                "registrationKey": {
                    "description": "X8851-99962-70001-50517-2945515"
                },
                "serviceCheckDate": {
                    "description": "2017/05/10"
                },
                "https://localhost/mgmt/tm/sys/license/0/active-modules": {
                    "nestedStats": {
                    "entries": {
                        "https://localhost/mgmt/tm/sys/license/0/active-modules/%22BIG-IP,%20VE,%20LAB%22": {
                        "nestedStats": {
                            "entries": {
                            "featureModules": {
                                "description": "{ \"Rate Shaping\" \"External Interface and Network HSM, VE\" \"SDN Services, VE\" \"SSL, Forward Proxy, VE\" \"DENY-VER-V11.4.0\" \"DNS Services (LAB)\" \"Max Compression, VE\" \"Acceleration Manager, VE\" \"Crytpo Offload, VE, Tier 1 (25M - 200M)\" \"BIG-IP VE, Multicast Routing\" \"Recycle, BIG-IP, VE\" \"Advanced Protocols, VE\" \"APM, Limited\" \"SSL, VE\" \"PSM, VE\" \"Routing Bundle, VE\" \"AFM, VE (LAB ONLY - NO ROUTING)\" \"ASM, VE\" \"Anti-Virus Checks\" \"Base Endpoint Security Checks\" \"Firewall Checks\" \"Machine Certificate Checks\" \"Network Access\" \"Protected Workspace\" \"Secure Virtual Keyboard\" \"APM, Web Application\" \"App Tunnel\" \"Remote Desktop\" \"DNS RATE LIMITED, MAX\" \"CGN, BIG-IP VE, AFM ONLY\" \"DNS Rate Fallback, Unlimited\" \"DNS Licensed Objects, Unlimited\" \"DNS Rate Limit, Unlimited QPS\" }"
                            },
                            "key": {
                                "description": "B020781-2829817"
                            }
                            }
                        }
                        },
                        "https://localhost/mgmt/tm/sys/license/0/active-modules/%22CGN,%20VE%20(LAB)%22": {
                        "nestedStats": {
                            "entries": {
                            "featureModules": {
                                "description": "{ \"Routing Bundle, VE\" }"
                            },
                            "key": {
                                "description": "C206673-7574695"
                            }
                            }
                        }
                        },
                        "https://localhost/mgmt/tm/sys/license/0/active-modules/%22DNSSEC%22": {
                        "nestedStats": {
                            "entries": {
                            "key": {
                                "description": "M001846-0132923"
                            }
                            }
                        }
                        },
                        "https://localhost/mgmt/tm/sys/license/0/active-modules/%22GTM,%20VE%20(LAB)%22": {
                        "nestedStats": {
                            "entries": {
                            "featureModules": {
                                "description": "{ \"IPV6 Gateway\" \"Ram Cache\" \"STP\" \"DNS Express\" }"
                            },
                            "key": {
                                "description": "P695100-5761500"
                            }
                            }
                        }
                        }
                    }
                    }
                }
                }
            }
            }
        }
    }
