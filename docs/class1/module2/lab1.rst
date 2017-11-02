Lab 2.1: Exploring iApps
------------------------

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
         label = "iApp Templates & Deployments"
         basics [label="iApp Basics",color="steelblue1"]
         templates [label="iApp Templates"]
         deployments [label="iApp Deployments"]
         basics -> templates -> deployments
      }
   }

iApp Templates & Deployments
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are multiple ways to install an iApp on BIG-IP. These includes using
TMOS Shell (TMSH through SSH), the GUI (TMUI), and the REST Interface. All
of these mechanisms are supported and, if required, can be used in
conjunction with each other.

For instance, you can install an iApp template from BIG-IP GUI and then deploy
a new service via iControl REST using tools such as cURL, Postman and Ansible.

.. NOTE:: Redeployment of iApp templates is facilitated/protected by a mechanism in
   BIG-IP platform to ensure safe changes to the configurations without disrupting
   existing user traffic.

F5 iApps was introduced in TMOS (BIG-IP operating system) Version 11.
They can interact within and across different F5 modules to provide
full Layer 4-7 Application Services capabilities.
The **iApp Template** is used to execute an **iApp Deployment**
that generates a series of configuration object grouped under an
**Application Service Object (ASO)**.  The ASO model houses objects belonging
to the iApp service deployment.  Upon deletion of a specific iApp service deployment,
all the associated objects will be recursively deleted.

Below are some of the modules that can be configured using iApp templates:

- Local Traffic Manager
- Advanced Firewall Manager
- Application Security Manager
- Access Policy Manager

.. NOTE:: The term ``Application Service`` in the GUI and ``service`` in the REST
   API are the same objects.  The name is abbreviated in the API.

You can find the GUI representation of iApps on the left-hand side of the UI
under :guilabel:`iApps`. iApp deployments are located under
:guilabel:`Application Services`, while iApp templates are located under
:guilabel:`Templates` on the system.

- :guilabel:`Application Services` (iApp deployments)

  |lab-1-1|

- :guilabel:`Templates` (iApp templates)

  |lab-1-2|

The associated REST API endpoints are:

- **iApp Deployments**: ``/mgmt/tm/cloud/services/iapp``
- **iApp Templates**: ``/mgmt/tm/sys/application/template``

iApp Deployments and Source-of-Truth
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default, iApp implements a strict source-of-truth preservation
mechanism called **Strict Updates**.  The App Services iApp does allow granular
configuration of underlying TMOS objects **without** disabling the Strict
Updates mechanism. However, not all iApp templates supports this functionality.

In an automated environment, we **must** always ensure that the
**iApp template inputs** are being used as the Source-of-Truth for an
underlying deployment.  Therefore, **Strict Updates should not be disabled** in
order to preserve the integrity of service deployments using iApp templates.

For instance, after an iApp service is deployed, modifying the underlying
configuration **with Strict Updates disabled** will result in Source-of-Truth
violation. Changes made directly to the configuration will cause iApp
configuration objects to be overwritten. The direct modification of objects
configured on BIG-IP will alter the integrity of iApp deployment input values
that automation tools are interacting with, causing failures. It is therefore
important to keep **Strict Updates** enabled at all times for automated deployments.

.. |lab-1-1| image:: images/lab-1-1.png
.. |lab-1-2| image:: images/lab-1-2.png
