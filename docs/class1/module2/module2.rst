Module 2: Abstracting Services using iApp Templates
===================================================

In this Module we will continue working with the BIG-IP REST interface; though
we will now introduce an F5 Declarative interface called iApps. iApps are
commonly thought of as a wizard style deployment helper, but they provide a
Declarative Interface (like REST Transactions).

A **single** call containing the contents of a Service is processed through
an iApp's framework, which organizes the deployment and creates the
linkage to all objects (ASO's).

iApps are a user-customizable framework for deploying applications that enables
you to templatize sets of functionality on your F5 gear. For example, you can
automate the process of adding virtual servers or build a custom iApp to manage
your iRules inventory. We will be using the **F5 App Services Integration iApp**
(App_Svcs iApp for short).

.. WARNING:: This Lab has the prerequisite of completing Module 1 (for the underlining network connectivity), **and** having **BIG-IP A** the active node in the cluster

.. NOTE:: This Module deploys configuration to BIG-IP A, iApps are a config-sync item passing to other BIG-IP's from the cluster sync process

- An overview `AND` the user guide of the App Services Integration iApp can be found on
   `GitHub <https://devcentral.f5.com/wiki/iApp.AppSvcsiApp_index.ashx?lc=1>`_.

- An overview of iApps, and different iApps available can be found on
   `DevCentral <https://devcentral.f5.com/iapps>`_.


.. toctree::
   :maxdepth: 1
   :glob:

   lab*
