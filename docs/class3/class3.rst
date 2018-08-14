Class 3: Introduction to SecDevOps
==================================

.. _GitHub: https://github.com/f5devcentral/f5-automation-labs
.. _Issue: https://github.com/f5devcentral/f5-automation-labs/issues
.. _Postman: https://www.getpostman.com/
.. _Lab Guide: ./labinfo/labinfo.html

Leveraging programmability to deploy security policies and/or adhere to best practices during an application’s lifecycle reduces the operational (e.g. time and money) cost of a defense in depth strategy. Programmatic workflows can be developed and deployed for specific security use cases, and integrated into the SDLC process, allowing for the protection of an application to iterate in parallel with the development of the application.

This class covers the following topics:

- SecDevOps concepts

- Programmatic configuration of security services on BIG-IP

  - Layer 3/4 Firewall (AFM)
  - Layer 7 Web Application Firewall (ASM)

- Building Security into CI/CD Pipelines with Jenkins

- Real world use cases for SecDevOps (time permitting)

  - Programmatic maintenance of black/white lists
  - Creation of a "golden" security (ASM/AFM) policy
  - ChatOps for security

The entire class will be run from within the F5 Lab Created environment, for access to the lab please ask your instructor, or continue with the self-paced labs from f5.com/supernetops.

To perform the steps required in the lab, `Postman`_ will be used from the jump box.

**Lab Guide**

Prior to beginning the exercises, it is recommended to review the `Lab Guide`_.

**Support**

Bugs and enhancements can be made by opening an `issue`_ within the `GitHub`_ repository.

Expected time to complete: **3 hours**

.. toctree::
   :maxdepth: 1
   :glob:

   labinfo/labinfo
   labinfo/postman
   module*/module*
