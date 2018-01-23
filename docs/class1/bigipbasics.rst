.. _bigipbasics:

BIG-IP Basics (optional)
------------------------

Just in case you're new to the F5 BIG-IP platform (or need a refresher) we've
included some links and videos below that will help get you started.  

What is BIG-IP
^^^^^^^^^^^^^^

.. raw:: html

    <iframe width="600" height="315" src="http://www.youtube.com/embed/D6J_j7HdkV8?rel=0" frameborder="0" gesture="media" allowfullscreen></iframe>

*Source: https://devcentral.f5.com/articles/lightboard-lessons-what-is-big-ip-26793*

BIG-IP Basic Nomenclature
^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   <iframe width="600" height="315" src="https://www.youtube.com/embed/2YRKTyMgV4M" frameborder="0" gesture="media" allowfullscreen></iframe>

*Source: https://devcentral.f5.com/articles/lightboard-lessons-big-ip-basic-nomenclature-26144*

F5 DevCentral BIG-IP Basics Articles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

BIG-IP Basics Articles: https://devcentral.f5.com/articles?tag=devcentral+basics

Using F5 in Various Environments
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

- Public Cloud:

  - **AWS/Azure/GCP/etc.:** http://clouddocs.f5.com/cloud/public/v1/

- Private Cloud:

  - **OpenStack:** http://clouddocs.f5.com/cloud/openstack/

  - **VMware:** https://f5.com/solutions/technology-alliances/vmware

- Container Ecosystems:

  - **Cloud Foundry:** http://clouddocs.f5.com/containers/latest/cloudfoundry/

  - **Kubernetes:** http://clouddocs.f5.com/containers/latest/kubernetes

  - **Mesos Marathon:** http://clouddocs.f5.com/containers/latest/marathon

  - **RedHat OpenShift:** http://clouddocs.f5.com/containers/latest/openshift/

HA Proxy to BIG-IP Quick Start
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you're already familiar with HA Proxy, learning F5 BIG-IP is straightforward
once you learn the associated F5 terminology. 

Here is a list of common HA Proxy configuration terminology and its F5 equivalent:

+---------------------+---------------------+
| **HA Proxy**        | **F5 BIG-IP**       |
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

NGINX to BIG-IP Quick Start
^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you are already familiar with NGINX, learning F5 BIG-IP will be
straightforward once you learn the F5 terminology.

NGINX administrators usually use multiple files and leverage the include 
command in their config to break down the config and make it easier to 
manage. F5 leverages *Profiles* which can be applied to a *Virtual Server*.

NGINX uses in-band (passive) health monitors which can be enabled on F5 through 
the creation of an *inband monitor*. BIG-IP also supports the use of active 
health monitors, which will poll the pool member periodically.  Both can be 
used together for better monitoring of your services.

F5 BIG-IP supports control-plane and data-plane programmability with:

- Node.js through the use of iRulesLX, iControlLX and iAppsLX

- TCL through the use of iRules and iApp Templates

A lot of the manual configuration and scripting steps that are required with NGINX 
are supported more easily through various config parameters and profiles in BIG-IP.
By leveraging the control-plane programmability features this class covers you can
achieve full automation of your services with the BIG-IP platform.

F5 BIG-IP is designed to be a full proxy by default.  In most cases there is no
need to tune TCP & HTTP buffering like you would on NGINX (i.e. using 
``proxy_buffering``).  This is because the default settings have been optimized
and can adapt to most situations.

Here is a list of common NGINX configuration terminology and its F5 equivalent:

+----------------------------------+--------------------------------------------+
| **NGINX**                        | **F5 BIG-IP**                              |
+----------------------------------+--------------------------------------------+
| listen                           | Virtual Server Port (VIP)                  |
+----------------------------------+--------------------------------------------+
| upstream                         | Pool                                       |
+----------------------------------+--------------------------------------------+
| proxy_pass                       | Default Pool                               |
+----------------------------------+--------------------------------------------+
| server                           | Member                                     |
+----------------------------------+--------------------------------------------+
| ssl_certificate                  | SSL Profile Option                         |
+----------------------------------+--------------------------------------------+
| return                           | LTM HTTP Policy Option                     |
+----------------------------------+--------------------------------------------+
| proxy_set_header X Forwarded For | HTTP Profile Option Insert X-Forwarded-For |
+----------------------------------+--------------------------------------------+
| proxy_set_header                 | LTM HTTP Policy Option                     |
+----------------------------------+--------------------------------------------+
| add_header                       | LTM HTTP Policy Option                     |
+----------------------------------+--------------------------------------------+
| location & proxy_pass            | LTM HTTP Policy Option                     |
+----------------------------------+--------------------------------------------+
| Proxy Cache                      | Web Acceleration Policy                    |
+----------------------------------+--------------------------------------------+ 
