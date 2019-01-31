Lab 4.5: Delete AS3 Tenant/Applications on BIG-IQ
-------------------------------------------------

Task 9 - Delete Task1 with its AS3 Applications
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here, we empty the tenant/partition of Task1. This should remove those partitions from bigip-a.f5.local. The relevant Apps 
should also disappear from BIG-IQ. 

.. NOTE:: We are not using the DELETE method but a POST with a declaration containing a tenant with nothing in it.

#. Using Postman, update the user to david/david in the **BIG-IQ Token (david)** call (body).

#. Copy below example of an AS3 Declaration into the body of the **BIG-IQ AS3 Declaration** collection in order to create the service on the BIG-IP through BIG-IQ:

   POST https://10.1.1.4/mgmt/shared/appsvcs/declare?async=true

   .. code-block:: yaml
      :linenos:
      :emphasize-lines: 14,15,16

      {
         "class": "AS3",
         "action": "deploy",
         "persist": true,
         "declaration": {
            "class": "ADC",
            "schemaVersion": "3.7.0",
            "id": "example-declaration-01",
            "label": "Task9",
            "remark": "Task 9 - Delete Tenants",
            "target": {
                  "hostname": "bigip-a.f5.local"
            },
            "Task1": {
                  "class": "Tenant"
            }
         }
      }

#. Check the tenant/application(s) has been correctly removed from the BIG-IP and BIG-IQ.
