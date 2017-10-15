Module 2: Abstracting Services using iApp Templates
===================================================

In this Module we will continue working with the BIG-IP REST interface; though
we will now introduce another F5 Declarative interface called iApps. iApps are
commonly thought of as a Wizard style deployment helper, but they are actually a
Declarative interface (like REST Transactions). A **single** call containing the
contents of the iApp is processed on the BIG-IP in the correct order of
operations, and all objects (ASO's) are linked together making for easy
destruction.

iApps are a user-customizable framework for deploying applications that enables
you to templatize sets of functionality on your F5 gear. For example, you can
automate the process of adding virtual servers or build a custom iApp to manage
your iRules inventory. We will be using the **F5 App Services Integration iApp**
(App_Svcs iApp for short).

.. NOTE:: This Lab has the prerequisite of completing Module 1 (for the underlining network connectivity), and having `BIG-IP A` the active node in the cluster

.. NOTE:: This Module deploy configuration to BIG-IP A, as iApps are a config-sync item we do not need to deploy service configuration to clustered BIG-IP's

- An overview `AND` the user guide of the App Services Integration iApp can be found on
   `GitHub <https://devcentral.f5.com/wiki/iApp.AppSvcsiApp_index.ashx?lc=1>`_.

- An overview of iApps, and different iApps available can be found on
   `DevCentral <https://devcentral.f5.com/iapps>`_.flix


.. toctree::
   :maxdepth: 1
   :glob:

   lab*
