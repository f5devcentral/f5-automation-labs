Welcome to F5 SecDevOps  Lab documentation!
===========================================

.. _GitHub Issues: https://github.com/6a6d/f5-secdevops-lab/issues

Release Version: |release|

Introduction
------------

This hands-on lab will demonstrate how to secure applications programmatically using REST based APIs so security professionals can build buttons instead of pushing them.

Leveraging programmability to deploy security policies and/or adhere to best practices during an application’s lifecycle reduces the operational (e.g. time and money) cost of a defense in depth strategy.  Programmatic workflows can be developed and deployed for specific security use cases and integrated into the SDLC process allowing for the protection of an application to iterate in parallel with the development of said app.

This course will feature the following topics.

* General interaction with tmm via BIG-IPs REST APIs
* Create, modify and assign an AFM policy
* Create, modify and asign an ASM policy
* Create, modify and assign an DDoS/pro-active bot defense profile

Support
-------

Please use `GitHub Issues`_ to report any bugs or feature requests.

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Lab Network Overview:

   lab-network-overview/ip-addressing.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Lab Basics:

   lab-basics/connectivity.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Postman Primer:

   postman/postman-primer.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Lab 1 - BIG-IP REST APIs:

   lab-1/objective.rst
   lab-1/authentication.rst
   lab-1/provisioning.rst
   lab-1/building-config.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Lab 2 - ASM APIs:

   lab-2/lab-2-objective.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Lab 3 - AFM APIs:

   lab-3/lab-3-objective.rst

.. toctree::
   :maxdepth: 2
   :hidden:
   :caption: Lab 4 - DDoS APIs:

   lab-4/lab-4-objective.rst

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`