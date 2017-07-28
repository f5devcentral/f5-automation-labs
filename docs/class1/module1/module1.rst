Module 1: REST API Basics & Device Onboarding
=============================================

In this module you will learn the basic concepts required to interact
with the BIG-IP iControl REST API. Additionally, you will walk through a
typical Device Onboarding workflow that results in a fully functional
BIG-IP Active/Standby pair. It’s important to note that this module will
focus on showing an **Imperative** approach to automation.

.. NOTE:: 
    The Lab Deployment for this lab includes two BIG-IP devices.
    For most of the labs we will focus on configuring only the BIG-IP-A
    device (management IP and licensing have already been completed).
    BIG-IP-B already has some minimal configuration loaded. In a real-world
    environment it would be necessary to perform Device Onboarding functions
    on ALL BIG-IP devices. We are only performing them on a single device in
    this lab so we are able to cover all topics in the time allotted.

.. NOTE::
    It’s beneficial to have GUI/SSH sessions open to BIG-IP and
    iWorkflow devices while going through this lab. Feel free to verify the
    actions taken in the lab against the GUI or SSH. You can also watch the
    following logs:

    - BIG-IP:

      - /var/log/ltm
      
      - /var/log/restjavad.0.log

    - iWorkflow: 

      - /var/log/restjavad.0.log

.. toctree::
   :maxdepth: 1
   :glob:

   lab*