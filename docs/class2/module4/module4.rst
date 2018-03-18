Module 4: Continuous Integration / Continuous Delivery
======================================================

This Module will continue to build up our Infrastructure to a Self-Service or CI/CD goal.
We will be building on the code that was utilized in the previous modules and labs, though now
we'll use Jenkins to provide a CI/CD mechanism. This lab will also use Slack to notify
users of changes going on in real time.

Tools we will be using:

- f5-newman-wrapper & previous workflows

  - The previous 5 wrapper workflows files will be executed, but from a Jenkins Pipeline

- f5-super-netops-container

  - Continuing delivery of F5 configuration from a self contained toolkit
  - This version or **variant** of the container has Jenkins installed for you, this is depicted from tag associated to the Docker Image ``f5devcentral/f5-super-netops-container:jenkins``

- Slack

  - There has been a Slack channel already setup on your behalf, which we will all be monitoring for environment changes
  - Any person with an @f5.com email address can join the Slack Channel. To join and view the transactions use https://f5agilitydevops.slack.com/signup

- Jenkins

  - Jenkins is installed on the f5-super-netops-container, accessed via ``http://localhost:10000`` (Web) user credentials are ``admin/default``

From the previous labs you should already have your Super-NetOps-Container already
running, if it's not please refer to :ref:`Class 2, Module 1, Lab 2 <lab1_2_1>` on starting the service.

.. toctree::
   :maxdepth: 1
   :glob:

   lab*
