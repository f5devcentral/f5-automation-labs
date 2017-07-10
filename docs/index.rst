Welcome to F5 SecDevOps  Lab documentation!
===========================================

.. _GitHub: https://github.com/6a6d/f5-secdevops-lab/issues
.. _issue: https://github.com/6a6d/f5-secdevops-lab/issues
.. _Postman: https://www.getpostman.com/

This hands-on lab will demonstrate how to secure applications programmatically using a BIG-IP's iControl based REST API.

Leveraging programmability to deploy security policies and/or adhere to best practices during an application’s lifecycle reduces the operational (e.g. time and money) cost of a defense in depth strategy.  Programmatic workflows can be developed and deployed for specific security use cases, and integrated into the SDLC process, allowing for the protection of an application to iterate in parallel with the development of the application.

This course will feature the following topics.

* General interaction with tmm via BIG-IPs REST APIs
* Create, modify and assign an AFM policy
* Create, modify and assign an ASM policy

Lab Guide
----------

This lab is divided into three parts.  Each section of the lab, will require configuration of the BIG-IP, AFM, or ASM using the iControl REST based API.  It is recommended that each lab be executed in order.

To perform the steps required in the lab, `Postman`_ will be used from the Windows jump box.

Prior to beginning the exercises, it is recommended to review the :doc:`/lab-overview/lab-topology`.  

If you are unfamiliar with Postman, please reference the :doc:`/postman/postman-primer` before beginning.

#. Lab 1: Configuring BIG-IP
#. Lab 2: Configuring AFM (Advanced Firewall Module)
#. Lab 3: Configuring ASM (Application Security Module)

Support
-------

Bugs and enhancements can be made by opening an `issue`_ within the `GitHub`_ repository.


Getting Started
----------------

Please follow the instructions provided by the instructor to start your lab and access your jump host.

.. note:: All work for this lab will be performed exclusively from the Windows jumphost.  No software installation or interaction with your local system is required.

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Overview

   lab-overview/lab-topology.rst

.. toctree::
   :maxdepth: 2
   :hidden:

   postman/postman-primer.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Lab 1 - BIG-IP
   
   lab-1/lab-1-objectives.rst
   lab-1/exploring-icontrol.rst
   lab-1/authentication.rst
   lab-1/provisioning.rst
   lab-1/building-config.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Lab 2 - AFM

   lab-2/lab-2-objectives.rst
   lab-2/provisioning-afm.rst
   lab-2/address-list.rst
   lab-2/create-policy.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Lab 3 - ASM

   lab-3/lab-3-objectives.rst
   lab-3/provisioning-asm.rst
   lab-3/explore-asm.rst
   lab-3/create-policy.rst
   lab-3/apply-policy.rst
