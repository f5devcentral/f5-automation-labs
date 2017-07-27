Module 4: Continuous Integration / Continuous Delivery
======================================================

This Module will continue to build up from Infrastructure to Self-Service or CI/CD goal.
We will be building on the code that was utilized in the previous modules, though now
we'll use Jenkins to provide a CD mechanism. This lab will also use Slack to notify
users of changes going on in real time.

Tools we will be using:

- f5-newman-wrapper & previous workflows

  - The Previous 5 wrapper workflows will be executed, but from a Jenkins Pipeline

- super-netops-container

  - Continuing delivery of F5 configuration from a self contained toolkit
  - This version or **variant** of the container has Jenkins installed for you, this is depicted from tag associated to the Docker Image ``f5devcentral/f5-super-netops-container:develop-jenkins``

- Slack

  - There has been a Slack channel already setup on your behalf, the instructor will explain how its used

- Jenkins

  - Jenkins is installed on the super-netops-container access via ``http://10.1.1.8:10000`` (Web) user credentials are ``admin/default``

From the previous labs you should already have your Super-NetOps-Container already
running, if its not please refer to Module 1.3 on starting your service

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
