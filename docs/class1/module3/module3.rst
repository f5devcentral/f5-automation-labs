Module 3: Deploying AS3 Declarations with Ansible Tower
================================================================

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
         AS3 [label="App Services&#92;n3 Extension",color="palegreen"]
         Ansible_Tower [label="Ansible&#92;nTower",color="steelblue1"]
      }
      subgraph cluster_tenant {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "Tenant"
         tower_catalog [label="Service&#92;nCatalog",color="steelblue1"]
         tower_deploy [label="Service&#92;nDeployment",color="steelblue1"]
      }
      tower_deploy -> tower_catalog -> Ansible_Tower -> AS3 -> bigip
   }

Overview
--------

In this module we will explore how to use utilize F5's **AS3** extension 
with an orchestration platform such as **Ansible Tower**. Tower is a workflow 
orchestration tool which provides an enterprise solution on top of Ansible including 
an API, GUI, RBAC, and many other features. While we will cover some core concepts of
Ansible, the primary focus of this module is Tower.

.. NOTE:: A previous version of this class utilized iWorkflow as a service catalog.
   Ansible Tower will cover deploying applications in a similar service catalog
   manner while demonstrating 
   within an SCM such as Git.

While working through this module we will be focusing on L4-L7 deployments
(Virtual Servers, Pools, etc).
Ansible and Towe have the ability to perform full L1-L3 configurations
(Device Onboarding, Networking, etc)
as well but that will not be covered in this section.

Layer 1-3 Networking and Device Onboarding
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

L1-3 Networking and Device Onboarding are highly specific to the particular
environment the BIG-IP instances are deployed on.  The onboarding process for
various platforms and ecosystems is very different due to differences in the
L1-3 capabilities and APIs of each platform.  As a result F5 publishes specific
documentation and guidance for each of these environments:

- Public Cloud:

  - **AWS/Azure/GCP/etc.:** http://clouddocs.f5.com/cloud/public/v1/

- Private Cloud:

  - **OpenStack:** http://clouddocs.f5.com/cloud/openstack/

  - **VMware:** https://f5.com/solutions/technology-alliances/vmware

Ansible Tower may be integrated within any of these environments to add
fuctionality and reliablity of workflows.

.. NOTE:: F5 BIG-IP also supports integration with Container Ecosystems.
   However, in these environments Ansible Tower may not be required.  For more
   information you can refer to:

   - Container Ecosystems:

     - **Cloud Foundry:** http://clouddocs.f5.com/containers/latest/cloudfoundry/

     - **Kubernetes:** http://clouddocs.f5.com/containers/latest/kubernetes

     - **Mesos Marathon:** http://clouddocs.f5.com/containers/latest/marathon

     - **RedHat OpenShift:** http://clouddocs.f5.com/containers/latest/openshift/

Layer 4-7 Application Service Delivery
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

L4-7 Application Service Delivery is accomplished by:

-  Providing **templates** within Ansible Tower as a Service Catalog to interact
   with **AS3**.

-  Utilizing Ansible Tower's **Roll Based Access Control (RBAC)** to divide
   workloads based on user functions.

The labs in the module will focus on the high level features in place to
achieve full L4-7 automation.

In this Module we will provision Ansible Tower to deploy and modify the AS3
declarations you learned about in Module 2. The focus of Module 2 was to
demonstrate application deployment directly on to the BIG-IP. Tower will allow
the administrator to build an interface and API for users based on their current
role within the orginization.

For example, in Module 2 we pushed AS3 declarations, updated pool members, and
provided the user access to modify the full AS3 declaration. This approach would
provide each user the same administrative priviledges and may not scale within
orginizations with seperate user functions.

To solve this problem Ansible Tower allows the administrator to create
**Templates** which can provide further **Abstraction** of the AS3 declarations.
The administrator can enforce specific Tenants or parameters to be used based on
the user running the Template. This abstraction allows the templates to
integrated directly in the business based CI/CD toolchains and workflows.

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
