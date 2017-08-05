Class 3: Introduction to SecDevOps
==================================

.. _GitHub: https://github.com/f5devcentral/f5-automation-labs
.. _Issue: https://github.com/f5devcentral/f5-automation-labs/issues
.. _Postman: https://www.getpostman.com/

This hands-on lab will demonstrate how to secure applications programmatically
using a BIG-IP's iControl based REST API.

Leveraging programmability to deploy security policies and/or adhere to best
practices during an application’s lifecycle reduces the operational
(e.g. time and money) cost of a defense in depth strategy.  Programmatic
workflows can be developed and deployed for specific security use cases,
and integrated into the SDLC process, allowing for the protection of an
application to iterate in parallel with the development of the application.

This course will feature the following topics.

* General interaction with tmm via BIG-IPs REST APIs
* Create, modify and assign an AFM policy
* Create, modify and assign an ASM policy

**Lab Guide**

This lab is divided into three modules.  Each module of the lab, will require
configuration of the BIG-IP, AFM, or ASM using the iControl REST based API.
It is recommended that each lab be executed in order.

To perform the steps required in the lab, `Postman`_ will be used from the
Windows jump box.

Prior to beginning the exercises, it is recommended to review the :doc:`/class3/labinfo`.

#. Module 1: Configuring BIG-IP
#. Module 2: Configuring AFM (Advanced Firewall Module)
#. Module 3: Configuring ASM (Application Security Module)

**Support**

Bugs and enhancements can be made by opening an `issue`_ within the `GitHub`_ repository.

**Getting Started**

Please follow the instructions provided by the instructor to start your lab
and access your jump host.

.. NOTE:: All work for this lab will be performed exclusively from the
   Windows jumphost.  No software installation or interaction with your
   local system is required.

Expected time to complete: **3 hours**

.. toctree::
   :maxdepth: 2
   :glob:

   labinfo
   module*/module*
