Module 1: Imperative Automation with the |bip| |icr|
====================================================

In this module you will learn the basic concepts required to interact
with the BIG-IP iControl REST API. Additionally, you will walk through a
typical Device Onboarding workflow that results in a fully functional
BIG-IP Active/Standby pair. It’s important to note that this module will
focus on showing an **Imperative** approach to automation.

.. NOTE:: The Lab Deployment for this lab includes two BIG-IP devices.
   For most of the labs we will focus on configuring only the BIG-IP-A
   device (management IP and licensing have already been completed).
   BIG-IP-B already has some minimal configuration loaded. In a real-world
   environment it would be necessary to perform Device Onboarding functions
   on ALL BIG-IP devices. We are only performing them on a single device in
   this lab so we are able to cover all topics in the time allotted.

.. NOTE:: In order to confirm the results of REST API calls made in this lab, it's 
   beneficial to have GUI/SSH sessions open to BIG-IP and iWorkflow devices. 
   By default, BIG-IP and iWorkflow will log all REST API related events locally 
   to **restjavad.0.log** and also can be configured to log to a remote syslog server 
   (see https://support.f5.com/csp/article/K13080). Additionally, the **ltm** 
   log file on BIG-IP will contain log messages that pertain specifically to 
   BIG-IP local traffic management events. These log file locations are below:

   - BIG-IP:

     - /var/log/ltm
     
     - /var/log/restjavad.0.log

   - iWorkflow: 

     - /var/log/restjavad.0.log

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
