Module 2: Abstracting Services using iApp Templates
===================================================

In this Module we will continue working with the BIG-IP REST interface, however,
we will now introduce F5 Declarative Interfaces built with F5 iApp templates.
iApps are commonly thought of as a Wizard style deployment helper, but they are
actually a Declarative Interface (like REST Transactions). A **single** call
declaring the desired deployment is processed on the BIG-IP in the correct order
of operations, and all objects are associated with an Application Service Object
(ASO) making for easy deletion.

iApps are a user-customizable framework for deploying applications that enables
you to templatize sets of functionality on your F5 devices. For example, you can
automate the process of adding virtual servers or build a custom iApp to manage
your iRules inventory. We will be using the **F5 App Services Integration iApp**
(App Services iApp for short).

For further information about the App Services iApp see:

- **GitHub Repository:** https://github.com/F5Networks/f5-application-services-integration-iApp

- **User Guide:** https://devcentral.f5.com/wiki/iApp.AppSvcsiApp_userguide_userguide.ashx

An overview of iApps and different iApp templates that available can be found
at:

- https://devcentral.f5.com/iapps

.. NOTE:: This modules requires the underlying network configuration that was
   completed in Module 1.  Additionally **BIG-IP A** must be the **Active**
   node in the cluster

.. NOTE:: This module deploys configuration to BIG-IP A. iApp deployments
   leverage the underlying config-sync mechanisms in the cluster.  Once deployed
   on BIG-IP A, the configuration will be automatically synced to BIG-IP B

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
