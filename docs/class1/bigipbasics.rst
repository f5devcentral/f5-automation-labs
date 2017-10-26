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

<<<<<<< HEAD
HA Proxy to Big-IP Quick start
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If you are already familiar with HA Proxy, learning F5 Big-IP will be
straightforward once you learn the F5 terminology. Here is a list of common config/terminology and their F5 equivalent
=======
HA Proxy to BIG-IP Quick Start
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you're already familiar with HA Proxy, learning F5 BIG-IP is straightforward
once you learn the associated F5 terminology. Here is a list of common HA Proxy
configuration terminology and its F5 equivalent:
>>>>>>> 7b1d5e444c788aacb818b1a7e431b568cc8da99e

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

NGINX to Big-IP Quick start
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
If you are already familiar with NGINX, learning F5 Big-IP will be
straightforward once you learn the F5 terminology.

NGINX administrators usually use multiple files and leverage the include 
command in their config to break down the config and make it easier to 
manage. F5 leverages profiles which can be applied to a virtual server.

NGINX uses in-band (passive) health monitor which can be enabled on F5 through 
the creation of an inband monitor. Big-IP also supports the use of active 
health which will poll the pool member every X seconds. Both can be used in
combination for better monitoring of the services.

F5 Big-IP supports node.js through the use of iRulesLX, iControlLX and iAppsLX.
TCL is also supported through iRules if data plane speed is required.

A lot of manual configuration and scripts that needs to be done in NGINX 
is supported more easily through config parameters and profiles in Big-IP.

F5 is a proxy by design and default. In most cases there are no needs to 
tune TCP & HTTP buffering like you would on NGINX (using proxy_buffering).
This is because the default settings have been optimized and can adapt
to most situations.

Here is a list of common config/terminology and their F5 equivalent.

+----------------------------------+------------------------------------------+
| **NGINX**                        | **F5 Big-IP**                            |
+----------------------------------+------------------------------------------+
| listen                           | Virtual Server port (VIP)                |
+----------------------------------+------------------------------------------+
| upstream                         | Pool                                     |
+----------------------------------+------------------------------------------+
| proxy_pass                       | Default Pool                             |
+----------------------------------+------------------------------------------+
| server                           | Member                                   |
+----------------------------------+------------------------------------------+
| ssl_certificate                  | Done through an SSL Profile              |
+----------------------------------+------------------------------------------+
| return                           | Done through an LTM policy               |
+----------------------------------+------------------------------------------+
| proxy_set_header X Forwarded For | Insert X Forwarded For in HTTP profile   |
+----------------------------------+------------------------------------------+
| proxy_set_header                 | LTM Policy                               |
+----------------------------------+------------------------------------------+
| add_header                       | LTM Policy                               |
+----------------------------------+------------------------------------------+
| location & proxy_pass            | LTM Policy                               |
+----------------------------------+------------------------------------------+
| Proxy Cache                      | Web Acceleration policy                  |
+----------------------------------+------------------------------------------+ 