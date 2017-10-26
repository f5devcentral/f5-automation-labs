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

In this module we will explore how to use F5’s iWorkflow platform to
further abstract application services and deliver those services to
tenants. iWorkflow has two main purposes in the Automation &
Orchestration toolchain:

-  Provide simplified but customizable Device Onboarding workflows

-  Provide a tenant/provider interface for L4 - L7 service delivery

When moving to an iWorkflow based toolchain it’s important to understand
that L1-3 Automation (Device Onboarding, Networking, etc) and L4-7
(Deployment of Virtual Servers, Pools, etc) are separated and delivered
by different features.

L1-3 Networking and Device Onboarding are delivered by **Cloud
Connectors** that provide an abstracted interface to BIG-IP Onboarding
in different environments.

L4-7 service delivery is accomplished by:

-  **Declarative:** Consuming F5 iApp templates from BIG-IP devices and
   creating a Service Catalog.

-  **Imperative:** Consuming the iWorkflow REST Proxy to drive API calls to
   BIG-IP devices

The labs in the module will focus on the high level features in place to
achieve full L1-7 automation. As mentioned above, iApps are a key
component of this toolchain. 

In this Module we will focus on building a **Service Catalog** using the App
Services iApp template you learned about in Module 2.  The focus in Module 2
was showing how to drive rich deployments, however, a large amount of F5 
**Domain Specific Knowledge** was still required to drive the deployments.
From a conceptual view iApp templates alone do not fully satisfy the requirement
for a fully **Declarative** interface because while the iApp template simplifies
the underlying **Imperative** actions it does not allow the adminstrator to 
build an **Interface** that minimizes or eliminates the need for **Domain 
Specific Knowledge**.

For example, we deployed a service that enabled HTTP Traffic Management with 
an iRule attached and Profile Customizations.  To the F5 administrator these 
are all very familar terms, however, to a consumer, such as an Application 
Owner, the terms *Virtual Server*, *iRule*, *Profile*, etc. are foreign 
concepts.  To solve this problem iWorkflow allows the adminstrator to create 
a **Service Catalog Template** that is an **Abstraction** of the iApp templates
input fields.  By doing this the F5 administrator can **create an interface 
tailored to the use case and knowledge level of the CONSUMER rather than the
ADMINSTRATOR**, enabling full featured and complex Layer 4-7 Application 
and Security services that are tailored to business need and use case rather
than the technical implementation.  Additionally, the **Service Abstraction**
acheived when creating the **Service Catalog** enables the easy integration of
F5 services with third-party tools and methodologies such as DevOps.

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
