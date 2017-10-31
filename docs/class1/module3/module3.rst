Module 3: Creating Declarative Service Interfaces with iWorkflow
================================================================

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
         iapps [label="iApp Templates&#92;n& Deployments",color="palegreen"]
         iwf_templates [label="Service&#92;nTemplates",color="steelblue1"]
      }
      subgraph cluster_tenant {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "Tenant"
         iwf_catalog [label="Service&#92;nCatalog",color="steelblue1"]
         iwf_deploy [label="Service&#92;nDeployment",color="steelblue1"]
      }
      iwf_deploy -> iwf_catalog -> iwf_templates -> iapps -> bigip
   }

Overview
--------

In this module we will explore how to use F5’s iWorkflow platform to
further abstract Application Services and deliver those services, with
a **Declarative** interface to Consumers.

When moving to an iWorkflow based toolchain it’s important to understand
that automation in L1-3 (Device Onboarding, Networking, etc) and L4-7
(Deployment of Virtual Servers, Pools, etc) is separated and delivered
by different features.

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

iWorkflow enables generic functionality in all of these environments by using
a **BIG-IP Cloud Connector**.  This connector allows iWorkflow to utilize
BIG-IP devices running on any of these environments.

.. NOTE:: F5 BIG-IP also supports integration with Container Ecosystems.
   However, in these environments iWorkflow may not be required.  For more
   information you can refer to:

   - Container Ecosystems:

     - **Cloud Foundry:** http://clouddocs.f5.com/containers/latest/cloudfoundry/

     - **Kubernetes:** http://clouddocs.f5.com/containers/latest/kubernetes

     - **Mesos Marathon:** http://clouddocs.f5.com/containers/latest/marathon

     - **RedHat OpenShift:** http://clouddocs.f5.com/containers/latest/openshift/

Layer 4-7 Application Service Delivery
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

L4-7 Application Service Delivery is accomplished by:

-  Consuming F5 iApp templates on BIG-IP devices and
   creating a Service Catalog (**Declarative**).

-  Consuming the iWorkflow REST Proxy to drive API calls to
   BIG-IP devices (**Imperative**).

The labs in the module will focus on the high level features in place to
achieve full L4-7 automation. As mentioned above, iApp Templates are a key
component of the chain of linked tools (toolchain) we are building.

In this Module we will focus on building a **Service Catalog** using the App
Services iApp template you learned about in Module 2.  The focus in Module 2
was to show how to deploy advanced configurations. However, a large amount of F5
**Domain Specific Knowledge** was still required to build each deployment.
From a conceptual point of view, iApp templates alone do not fully satisfy the requirement
for a fully **Declarative** interface because while the iApp template simplifies
the underlying **Imperative** actions, it does not allow the administrator to
build an **Interface** that minimizes or eliminates the need for **Domain
Specific Knowledge**.

For example, we deployed a service that enabled HTTP Traffic Management with
an iRule attached and Profile Customizations.  To the F5 administrator these
are all very familiar terms, however, to a consumer, such as an Application
Owner, the terms *Virtual Server*, *iRule*, *Profile*, etc. are foreign
concepts.

To solve this problem iWorkflow allows the administrator to create a
**Service Template** that is an **Abstraction** of the iApp templates
input fields.  By doing this the F5 administrator can **create an interface
tailored to the use case and knowledge level of the CONSUMER rather than the
ADMINSTRATOR**, enabling full featured and complex Layer 4-7 Application
and Security services that are tailored to business need and use case rather
than the technical implementation.  Additionally, the **Service Abstraction**
achieved when creating the **Service Catalog** enables the easy integration of
F5 services with third-party tools and methodologies such as DevOps.

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
