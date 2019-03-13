Lab 4.4: Deploying AS3 Templates on BIG-IQ
------------------------------------------

Task 6 - Create custom HTTP AS3 Template on BIG-IQ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Administrators will employ the BIG-IQ Service Catalog to construct and manage a set of JSON Schema templates.  Non-administrative users may be selectively allowed to deploy configurations using these templates according to BIG-IQ RBAC policies.  The purpose of the templates is to filter the information being supplied to AS3 in 3 ways:

- Force the inclusion of specific AS3 class objects
- Restrict specific AS3 properties and/or classes
- Override specific AS3 default property values

.. note:: BIG-IQ 7.0 will bring a User Interface to create and manage the AS3 templates.

The following examples demonstrate how these goals can be met with JSON Schema.

#. Enforcing Changes to AS3 Classes

   In order to trigger schema enforcement of each class in the template other than Tenant and Application, specify the class name(s) and reference(s) in the Application class additionalProperties, like this:

   .. code-block:: yaml
      :linenos:

      "additionalProperties": {
         "allOf": [
               {
                  "if": {"properties": {"class": {"const": "Service_HTTP"}}},
                  "then": { "$ref": "#/definitions/Service_HTTP" }
               },
               {
                  "if": {"properties": {"class": {"const": "HTTP_Profile"}}},
                  "then": { "$ref": "#/definitions/HTTP_Profile" }
               }
         ]
      }

#. Overriding an AS3 Default Value

   To override a default, specify the property name, type, and new default like this snippet for the HTTP_Profile class: 

   .. code-block:: yaml
      :linenos:

      "xForwardedFor": {
         "type": "boolean",
         "default": true
      }

#. Setting a Static Value

   To force a property to a specific value and accept no other, specify the property name, type, and const.  To add the static value when the user omits the property, specify the default as well, like this snippet added to the Service_HTTP class:

   .. code-block:: yaml
      :linenos:

      "virtualPort": {
         "type": "integer",
         "const": 8080,
         "default": 8080
      }

#. Disallowing One or More Properties

   To reject a specific property whenever it appears in a declaration, specify that property within dependencies, like this snippet added to the Service_HTTP class:

   .. code-block:: yaml
      :linenos:

      "dependencies": {
         "policyIAM": { "not": {} },
         "policyWAF": { "not": {} }
      }

#. Disallowing All Properties Except Those Specified

   To act on a handful of properties and reject all others, make sure to include a stub for the "class" property and specify:

   .. code-block:: yaml
      :linenos:

      "additionalProperties": false

#. Disallowing One or More Classes

   To reject an entire class, specify this not anyOf properties clause within the Application class additionalProperties object:

   .. code-block:: yaml

      :linenos:
      "additionalProperties": {
         "not": {
               "anyOf": [
                  {"properties": {"class": {"const": "TCP_Profile"}}},
                  {"properties": {"class": {"const": "TLS_Client"}}}
               ]
         }
      }

#. Disallowing All But 1 or 2 Classes

   To allow just 1 or 2 classes, use an if-then construct within additionalProperties:

   .. code-block:: yaml
      :linenos:

      "additionalProperties": {
         "if": {
               "properties": {"class": {"const": "Service_L4"}}
         },
         "then": { "$ref": "#/definitions/Service_L4" },
         "else": {
                  "if": { "not": {"properties": {"class": {"const": "Pool"}}}},
                  "then": false
         }
      }

------------

In this task, we will create a template which require a Service_HTTP object, force the service port to 8080, and prevent WAF (ASM) and IAM (APM) configuration.

#. Using Postman, use the **BIG-IQ Token (david)** collections to authenticate you on the BIG-IQ and save the token.
   If your token expires, obtain a new token by resending the ``BIG-IQ Token (david)``.

   .. WARNING:: The token timeout is set to 5 min. If you get the 401 authorization error, request a new token.

#. Copy the below example of an AS3 service template into the Postman **BIG-IQ AS3 Template Creation** call.
   It will create a new template in BIG-IQ AS3 Service Catalogue:

   POST https://10.1.1.4/mgmt/cm/global/appsvcs-templates

   .. code-block:: yaml
      :linenos:

      {
         "description": "Task 6 - Create custom HTTP AS3 Template on BIG-IQ",
         "name": "HTTPcustomTemplateTask6",
         "schemaOverlay": {
               "type": "object",
               "properties": {
                  "class": {
                     "type": "string",
                     "const": "Application"
                  },
                  "schemaOverlay": {},
                  "label": {},
                  "remark": {},
                  "template": {},
                  "enable": {},
                  "constants": {}
               },
               "additionalProperties": {
                  "allOf": [
                     {
                           "if": {
                              "properties": {
                                 "class": {
                                       "const": "Service_HTTP"
                                 }
                              }
                           },
                           "then": {
                              "$ref": "#/definitions/Service_HTTP"
                           }
                     }
                  ],
                  "not": {
                     "anyOf": [
                           {
                              "properties": {
                                 "class": {
                                       "const": "IAM_Policy"
                                 }
                              }
                           },
                           {
                              "properties": {
                                 "class": {
                                       "const": "WAF_Policy"
                                 }
                              }
                           }
                     ]
                  }
               },
               "required": [
                  "class"
               ],
               "definitions": {
                  "Service_HTTP": {
                     "type": "object",
                     "properties": {
                           "virtualPort": {
                              "type": "integer",
                              "const": 8080,
                              "default": 8080
                           }
                     },
                     "dependencies": {
                           "policyIAM": {
                              "not": {}
                           },
                           "policyWAF": {
                              "not": {}
                           }
                     },
                     "additionalProperties": true
                  }
               }
         }
      }


#. Logon on BIG-IQ, go to Application tab, then Application Templates. Look at the custom template created previous through the API.

   |lab-4-1|

   Note the AS3 Template cannot be created through BIG-IQ UI but only using the API. You can only delete a AS3 templates from the BIG-IQ UI.

   You can see the Template in JSON format if you click on it.

   |lab-4-2|

   .. NOTE:: For help with JSON Schema, there are lots of resources, but one good place to start is https://json-schema.org/learn.


Task 7 - Admin set RBAC for Olivia on BIG-IQ
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let's update now Oliva's service catalog.

Logon on BIG-IQ as **david** go to the System tab, Role Management, Roles, CUSTOM ROLES, Application Roles, select **Application Creator AS3** 
and the custom role linked to the custom HTTP template previously created. Remove the **default** template from the allowed list. 
Click **Save & Close**.

|lab-4-3|


Task 8 - Deploy the HTTP Application Service using a Custom Template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now, let's deploy an application as Olivia using the AS3 template previously created in Task 6. Note in the below declaration, 
the virtualPort is set to 9090 while in the template, we force the virtualPort to a specific value and accept no other.

#. Using Postman, use the **BIG-IQ Token (olivia)** collections to authenticate you on the BIG-IQ and save the token.
   If your token expires, obtain a new token by resending the ``BIG-IQ Token (olivia)``.

   .. WARNING:: The token timeout is set to 5 min. If you get the 401 authorization error, request a new token.

#. Copy below example of an AS3 Declaration into the body of the **BIG-IQ AS3 Declaration** collection in order to create the service on the BIG-IP through BIG-IQ:

   POST https://10.1.1.4/mgmt/shared/appsvcs/declare?async=true

   .. code-block:: yaml
      :linenos:
      :emphasize-lines: 30

      {
         "class": "AS3",
         "action": "deploy",
         "declaration": {
               "class": "ADC",
               "schemaVersion": "3.7.0",
               "id": "isc-lab",
               "label": "Task8",
               "target": {
                  "hostname": "bigip-a.f5.local"
               },
               "Task8": {
                  "class": "Tenant",
                  "MyWebApp8http": {
                     "class": "Application",
                     "schemaOverlay": "HTTPcustomTemplateTask6",
                     "template": "http",
                     "statsProfile": {
                           "class": "Analytics_Profile",
                           "collectedStatsInternalLogging": true,
                           "collectPageLoadTime": true,
                           "collectClientSideStatistics": true,
                           "collectResponseCode": true
                     },
                     "serviceMain": {
                           "class": "Service_HTTP",
                           "virtualAddresses": [
                              "10.1.20.125"
                           ],
                           "virtualPort": 9090,
                           "pool": "pool_8",
                           "profileAnalytics": {
                              "use": "statsProfile"
                           }
                     },
                     "pool_8": {
                           "class": "Pool",
                           "monitors": [
                              "http"
                           ],
                           "members": [
                              {
                                 "servicePort": 80,
                                 "serverAddresses": [
                                       "10.1.10.102",
                                       "10.1.10.103"
                                 ],
                                 "shareNodes": true
                              }
                           ]
                     }
                  }
               }
         }
      }

  
   This will give you an ID which you can query using the **BIG-IQ Check AS3 Deployment Task**.

#. Use the **BIG-IQ Check AS3 Deployment Task** Postman calls to ensure that the AS3 deployment is successfull without errors: 

   GET https://10.1.1.4/mgmt/shared/appsvcs/task/<id>

#. As expected, note the error message returned due to the static value set in the template::

   "response": "declaration is invalid according to provided schema overlay: data['serviceMain'].virtualPort should be equal to constant",
                "status": 422


#. Update the ``virtualPort`` to **8080** and re-send the declaration.

#. Logon on **bigip-a.f5.local** and verify the Application is correctly deployed in partition Task8.

#. Logon on **BIG-IQ** as Olivia, go to Application tab and check the application is displayed and analytics are showing.

   |lab-4-4|


.. |lab-4-1| image:: images/lab-4-1.png
   :scale: 60%
.. |lab-4-2| image:: images/lab-4-2.png
   :scale: 60%
.. |lab-4-3| image:: images/lab-4-3.png
   :scale: 60%
.. |lab-4-4| image:: images/lab-4-4.png
   :scale: 60%
