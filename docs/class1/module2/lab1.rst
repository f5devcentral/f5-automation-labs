.. |labmodule| replace:: 2
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Exploring iApps
---------------------------------------------

iApp Templates & Deployments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A BIG-IP device has multiple ways to ingest an iApp onto its platform, including
TMOS Shell (TMSH), the GUI (TMUI), and the REST Interface. All mechanisms
are valid and, if needed, can be used in conjunction with each other.

For instance, you can install an iApp template from the GUI and then deploy
a new service via iControl REST using tools like cURL, Postman and Ansible.

.. NOTE:: Redeployment of iApp templates makes use of an underlying mechanism in
   the BIG-IP platform that allows safe changes to the configuration without
   interrupting existing user traffic.

F5 iApps were introduced in TMOS Version 11, they can interact within, and
across different F5 modules providing full Layer 4-7 Application Service
capability.  The **iApp Template** is used to drive and **iApp Deployment**
that creates a configuration under an **Application Service Object (ASO)**.

Some examples of the modules we can use iApp templates to configure:

- Local Traffic Manager
- Advanced Firewall Manager
- Application Security Manager
- Access Policy Manager

.. NOTE:: ``Application Service`` in the GUI and ``service`` in the REST
   API are the same objects.  The name is slightly abbreviated in the API.

You can find the GUI representation of iApps on the left-hand side of the UI
under :guilabel:`iApps`. iApp deployments are located under
:guilabel:`Application Services`, while iApp templates are located under
:guilabel:`Templates` on the system.

- :guilabel:`Application Services` (iApp deployments)

  |image2_1|

- :guilabel:`Templates` (iApp templates)

  |image2_2|

The associated REST API endpoints are:

- **iApp Deployments**: ``/mgmt/tm/cloud/services/iapp``
- **iApp Templates**: ``/mgmt/tm/sys/application/template``

iApp Deployments and Source-of-Truth
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default iApp technology implements a strict source-of-truth preservation
mechanism called **Strict Updates**.  The App Service iApp allows granular
configuration of the underlying TMOS objects **without** disabling the Strict
Updates mechanism, however, not all iApp templates implement this functionality.

In non-automated environments the impact of this can be justified, however, in
automated environments we must always guarantee that the template inputs are the
Source-of-Truth for an underlying deployment.  As a result **Strict Updates
should not be disabled**.

For example, creating an iApp deployment, disabling Strict Updates and then
modifying the underlying configuration results in a Source-of-Truth violation
because redeployment of the iApp would result in the changes made directly to
the configuration being overwritten.  This is because the direct modification
on the configuration moved the Source-of-Truth to the object itself, rather
than the iApp deployment input values that automation tools are interacting
with.

.. |image2_1| image:: /_static/class1/image2_1.png
.. |image2_2| image:: /_static/class1/image2_2.png
