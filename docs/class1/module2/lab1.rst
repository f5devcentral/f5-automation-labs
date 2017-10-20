.. |labmodule| replace:: 2
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Exploring iApps
---------------------------------------------

Task 1 - Overview of Mechanisms to install iApps
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The BIG-IP has multiple ways to ingest an iApp onto its platform, including
TMOS Shell (TMSH), the GUI, and the REST Interface. All different mechanisms
are valid, and if needed can be used in conjunction with each other.
For instance, installing an iApp from the GUI and then deploying
a new service via REST, or another Orchestration Engine, like Postman or Ansible.

.. NOTE:: Redeployment of iApp templates makes use of an underlying mechanism in
   the BIG-IP platform that allows safe changes to the configuration without
   interrupting existing user traffic.

F5 iApps were introduced in TMOS Version 11, they can interact within, and across
different F5 Modules. Once an iApp is installed, a **Service** can be
created using the iApp as the Service's template structure.

Some examples of what we can use iApps to configure:

- Local Traffic Manager
- Advanced Firewall Manager
- Application Security Manager
- Access Policy Manager
- iRules
- Certificates
- Various Profiles

.. NOTE:: ``Application Service`` in the GUI and ``Service`` in REST are the same
   objects, with a slightly abbreviated name in REST.

You can find the GUI representation of iApps on the left-hand side of the UI
under "iApps". The slide out pane refers to **Application Services** as
already deployed services, and **Templates** as installed iApp Templates
on the system.

- **Application Services**

  |image2_1|

- **Templates**

  |image2_2|

Under the BIG-IP REST interface you can find the location of deployed `Services` at the
``/mgmt/tm/cloud/services/iapp/`` endpoint, and installed `Templates` (iApps) at
the ``/mgmt/tm/sys/application/template`` endpoint.

.. |image2_1| image:: /_static/class1/image2_1.png
.. |image2_2| image:: /_static/class1/image2_2.png
