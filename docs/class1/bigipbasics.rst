.. _bigipbasics:

BIG-IP Basics (optional)
------------------------

Just in case you're new to the F5 BIG-IP platform (or need a refesher) we've
included some links and videos below that will help get you started.  

What is BIG-IP
^^^^^^^^^^^^^^

.. raw:: html

    <iframe width="560" height="315" src="http://www.youtube.com/embed/D6J_j7HdkV8?rel=0" frameborder="0" gesture="media" allowfullscreen></iframe>

*Source: https://devcentral.f5.com/articles/lightboard-lessons-what-is-big-ip-26793*

BIG-IP Basic Nomenclature
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <iframe width="600" height="315" src="https://www.youtube.com/embed/2YRKTyMgV4M" frameborder="0" gesture="media" allowfullscreen></iframe>

*Source: https://devcentral.f5.com/articles/lightboard-lessons-big-ip-basic-nomenclature-26144*

F5 DevCentral BIG-IP Basics Articles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

BIG-IP Basics Articles: https://devcentral.f5.com/articles?tag=devcentral+basics

HA Proxy to Big-IP Quick Start
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you're already familiar with HA Proxy, learning F5 BIG-IP is straightforward
once you learn the F5 terminology. Here is a list of common HA Proxy
configuration terminology and its F5 equivalent:

+---------------------+---------------------+
| **HA Proxy**        | **F5 Big-IP**       |
+---------------------+---------------------+
| Frontend            | Virtual Server (VIP)|
+---------------------+---------------------+
| Backend             | Pool                |
+---------------------+---------------------+
| Server              | Member              |
+---------------------+---------------------+
| mode http           | HTTP Profile        |
+---------------------+---------------------+
| default_backend     | Default pool        |
+---------------------+---------------------+
| use_backend         | LTM policy          |
+---------------------+---------------------+
| check port          | Health monitor      |
+---------------------+---------------------+
