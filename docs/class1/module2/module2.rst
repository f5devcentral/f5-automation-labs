Module 2: Abstracting Services using iApp Templates
===================================================

.. graphviz::

   digraph breadcrumb {
      rankdir="LR"
      ranksep=.4
      node [fontsize=10,style="rounded,filled",shape=box,color=gray72,margin="0.05,0.05",height=0.1] 
      fontname = "arial-bold" 
      fontsize = 10
      labeljust="l"
      subgraph cluster_provider {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "Provider"
         bigip [label="BIG-IP",color="palegreen"]
         iapps [label="iApp Templates&#92;n& Deployments",color="steelblue1"]
         iwf_templates [label="Service&#92;nTemplates"]
      }
      subgraph cluster_tenant {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "Tenant"
         iwf_catalog [label="Service&#92;nCatalog"]
         iwf_deploy [label="Service&#92;nDeployment"]
      }
      iwf_deploy -> iwf_catalog -> iwf_templates -> iapps -> bigip
   }

In this Module, we will continue working with the BIG-IP REST interface. However,
we will now introduce F5 Declarative Interfaces built with F5 iApp templates.

iApps are a user-customizable framework for deploying applications that enables
you to templatize sets of functionality on your F5 devices. For example, you can
automate the process of adding virtual servers or build a custom iApp to manage
your iRules inventory.

iApps are commonly thought of as a Wizard style deployment helper, but they are
actually a Declarative Interface (like REST Transactions).

When an iApp deploys, a **single** call - declaring the desired deployment -
is processed on the BIG-IP in the correct order of operations.
All created objects are associated with an Application Service Object (ASO).
The ASO model identifies which objects belong to the iApp service deployment.
Upon service deletion, all service related objects are recursively deleted.

We will be using the **F5 App Services Integration iApp**
(App Services iApp for short).

For further information about the App Services iApp see:

- **GitHub Repository:** https://github.com/F5Networks/f5-application-services-integration-iApp

- **User Guide:** https://devcentral.f5.com/wiki/iApp.AppSvcsiApp_userguide_userguide.ashx

An overview of iApps and different iApp templates that available can be found
at:

- https://devcentral.f5.com/iapps

.. NOTE:: This module requires the underlying network configuration that was
   completed in Module 1.  Additionally, **BIG-IP A** must be the **Active**
   node in the cluster

.. NOTE:: This module deploys the configuration to BIG-IP A. iApp deployments
   leverage the underlying config-sync mechanisms in the cluster.  Once deployed
   on BIG-IP A, the configuration will be automatically synced to BIG-IP B

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
