Module 2 – iWorkflow
====================

In this module we will explore how to use F5’s iWorkflow platform to
further abstract application services and deliver those services to
tenants. iWorkflow has two main purposes in the Automation &
Orchestration toolchain:

-  Provide simplified but customizable Device Onboarding workflows

-  Provide a tenant/provider interface for L4 – L7 service delivery

When moving to an iWorkflow based toolchain it’s important to understand
that L1-3 Automation (Device Onboarding, Networking, etc) and L4-7
(Deployment of Virtual Servers, Pools, etc) are separated and delivered
by different features.

L1-3 Networking and Device Onboarding are delivered by ‘Cloud
Connectors’ that are specific to the third party technology ecosystem
(e.g. vCMP, AWS, Cisco APIC, VMware NSX, BIG-IP, etc).

L4-7 service delivery is accomplished by:

-  Declarative: Consuming F5 iApp templates from BIG-IP devices and
   creating a Service Catalog.

-  Imperative: Consuming the iWorkflow REST Proxy to drive API calls to
   BIG-IP devices

The labs in the module will focus on the high level features in place to
achieve full L1-7 automation. As mentioned above, iApps are a key
component of this toolchain. For our purposes we will use the f5.http
iApp to create simple examples. For more advanced use cases it’s often
required to use a ‘Declarative’ or ‘Deployment-centric’ iApp template. A
supported template of this nature called the App Services Integration iApp is
available at
https://github.com/F5Networks/f5-application-services-integration-iApp for this
purpose.

.. toctree::
   :maxdepth: 1
   :glob:

   lab*