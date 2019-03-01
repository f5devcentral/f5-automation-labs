Module 2: Abstracting Services using the App Services 3 Extension
=================================================================

.. graphviz::

   digraph breadcrumb {
      rankdir="LR"
      ranksep=.4
      node [fontsize=10,style="rounded,filled",shape=box,color=gray72,margin="0.05,0.05",height=0.1]
      fontsize = 10
      labeljust="l"
      subgraph cluster_provider {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "Provider"
         bigip [label="BIG-IP",color="palegreen"]
         as3 [label="AS3 Extension",color="steelblue1"]
         templates [label="Service&#92;nTemplates"]
      }
      subgraph cluster_tenant {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "Tenant"
         catalog [label="Service&#92;nCatalog"]
         deploy [label="Service&#92;nDeployment"]
      }
      deploy -> catalog -> templates -> as3 -> bigip
   }

In this Module, we will continue working with the BIG-IP REST interface. However,
we will now introduce another F5 Declarative Interfaces built with the App Services 3 
Extension (AS3).

The AS3 Extension is built on top of the extensible, Node.js based iControl LX 
framework and implements a declarative, application-centric schema for deploying
Layer 4-7 Application Services on BIG-IP devices.

.. NOTE:: Previous versions of this class utilized an iApp Template named the
   App Services Integration iApp.  The AS3 extension is a replacement for the
   functionality provided by this iApp Template.

.. NOTE:: iControl LX extensions are **not** iApp Templates.  The AS3 Extension
   does not use the TCL based iApp framework.  Additionally, AS3 does not use 
   an Application Service Object (ASO).

When deploying services using AS3 we will use a declarative interface and JSON
based schema.  This *declaration* describes the desired end state of the device.
AS3 contains a TMOS independent parser which fully validates declarations before
any changes are made to the configuration of a BIG-IP device.  Additionally
AS3 is:

- `Idempotent <https://whatis.techtarget.com/definition/idempotence>`_
- `Atomic <https://www.techopedia.com/definition/3466/atomic-operation>`_
- `Multi-Tenant <https://en.wikipedia.org/wiki/Multitenancy>`_
- `Supported by F5 <https://f5.com/support/support-policies>`_

For further information on the App Services 3 Extension see:

- **GitHub Repository:** https://github.com/F5Networks/f5-appsvcs-extension

- **Documentation:** http://clouddocs.f5.com/products/extensions/f5-appsvcs-extension/3/

An overview of iControl LX can be found at 
https://devcentral.f5.com/wiki/icontrollx.homepage.ashx

.. NOTE:: This module requires the underlying network configuration that was
   completed in Module 1.  Additionally, **BIG-IP A** must be the **Active**
   node in the cluster.  When viewing the BIG-IP A GUI it should say
   ``ONLINE (ACTIVE)`` in the upper left corner of the interface.

   You can learn more about clustering features in this video:

   .. raw:: html

      <p>  <iframe width="600" height="315" src="https://www.youtube.com/embed/RAQ1qaYnjZo" frameborder="0" gesture="media" allowfullscreen></iframe> </p>

   *Source: https://devcentral.f5.com/articles/lightboard-lessons-device-services-clustering-25575*

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
