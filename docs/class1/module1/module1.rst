.. _module1:

Module 1: Imperative Automation with the |bip| |icr|
====================================================

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
         bigip [label="BIG-IP",color="steelblue1"]
         iapps [label="iApp Templates&#92;n& Deployments"]
         iwf_templates [label="Service&#92;nTemplates"]
      }
      subgraph cluster_tenant {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "Tenant"
         iwf_catalog [label="Service&#92;nCatalog"]
         iwf_deploy [label="Service&#92;nDeployment"]
      }
      iwf_deploy -> iwf_catalog -> iwf_templates -> iapps -> bigip
   }
   
In this module you will learn the basic concepts required to interact
with the BIG-IP iControl REST API. Additionally, you will walk through a
typical Device Onboarding workflow to deploy a fully functional
BIG-IP Active/Standby pair. It’s important to note that this module will
focus on demonstrating an **Imperative** approach to automation.

.. NOTE:: The Lab Deployment for this lab includes two BIG-IP devices.
   For most of the labs, we will only be configuring the BIG-IP-A
   device (management IP configuration and licensing has been completed).
   BIG-IP-B will have some minimal configuration pre-loaded. In real-world
   scenario, it would be necessary to perform Device Onboarding functions
   on ALL BIG-IP devices. In this lab exercise, we chose to perform it only on a single device
   due to lab time allocation constraints.

.. NOTE:: In order to confirm the results of REST API calls made in this lab, it's 
   recommended to keep GUI/SSH sessions to BIG-IP and iWorkflow devices open. 
   By default, BIG-IP and iWorkflow will log all the REST API related events locally 
   to **restjavad.0.log** . These logs can also be directed to a remote syslog server 
   (see https://support.f5.com/csp/article/K13080). On a side note, the following **ltm** 
   log files listed below contains log messages specific to 
   BIG-IP local traffic management events. 

   - BIG-IP:

     - /var/log/ltm
     
     - /var/log/restjavad.0.log

   - iWorkflow: 

     - /var/log/restjavad.0.log

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
