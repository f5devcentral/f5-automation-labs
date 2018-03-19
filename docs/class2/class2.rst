Class 2: Building Continuous Delivery Pipelines
================================================

This class covers the following topics:

- Continuous Integration(CI) and Continuous Delivery(CD) Concepts

- F5 Automation Toolkits:

  - F5-Super-NetOps-Container
  - F5 Postman Collections and f5-postman-workflows extensions
  - F5 f5-newman-wrapper for Automating Workflows

- Building CI/CD Pipelines with Jenkins
- Team Collaboration with Automated Slack Notifications

The entire class will be run from within the F5 Lab Created environment, for
access to the lab please ask your instructor, or continue with the self-paced
labs from f5.com/supernetops.

.. NOTE:: If you are running this lab independent from Class 1 you will want
          to restore BIGIP-A from UCS ``bigip-a-module3.ucs`` located in the
          ``in_case_of_emergency folder``. Not restoring BIGIP-A will result
          in services unable to be accessed and nodes/pool members offline.
          This restore **MUST** be done via TMSH with a ``no-license`` flag.
          
          The UCS file is located on the Linux Jumphost at:
          ``/home/ubuntu/Desktop/in_case_of_emergency/bigip-a-module3.ucs``
          
Expected time to complete: **3 hours**

.. toctree::
   :maxdepth: 1
   :glob:

   module*/module*
