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

The BIG-IP has multiple ways to ingest an iApp on to the platform, including
TMOS Shell (TMSH), the GUI, and the REST Interface. All different mechanisms
are valid, and if needed can be used in conjunction with each other,
i.e. Installing an iApp from the GUI and then interacting with it to deploy
a new service via REST, or another Orchestration Engine, like Postman or Ansible.

.. NOTE:: Redeployment of iApp templates makes use of underlying mechanism in
   the BIG-IP platform that allows safe changes to the configuration without
   interrupting existing user traffic.

F5 iApps were introduced in version 11, they can interact within and across
different F5 Modules. Once and iApp is installed a `Service` is
created using the iApp as the Service's template structure.

Some examples of what we can use iApps to configure:

- Local Traffic Manager
- Advanced Firewall Manager
- Application Security Manager
- iRules
- Certificates
- Various Profiles

.. NOTE:: ``Application Service`` in the GUI and ``Service`` in REST are the same
   objects, with just slightly abbreviated names in REST

You can find the GUI representation of iApps on the left hand side of the UI
under "iApps", on the slide out pane there are `Application Services` showing
already deployed services, and also `Templates`, showing installed iApp Templates
on the system.

- `Application Services`

  |image2_1|

- `Templates`

  |image2_2|

Under BIG-IP REST you can find the location of deployed `Services` at the
``/mgmt/tm/cloud/services/iapp/`` endpoint, and installed `Templates` (iApps) at
the ``/mgmt/tm/sys/application/template`` endpoint.

.. |image2_1| image:: /_static/class1/image2_1.png
.. |image2_2| image:: /_static/class1/image2_2.png
