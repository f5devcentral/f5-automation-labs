Lab |labmodule|\.\ |labnum|\: Deploy the PROD environment (Dave)
================================================================

Background:
~~~~~~~~~~~~~

We've completed our tests in DEV, both functional tests and security tests have passed

Task 4.1 - Merge Infrastructure as Code file from dev
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- We will 'merge' the app3 dev branch with the master branch,
  so that the production deployment will use the correct policy.

- Return to the f5-use-cases Container
- ``cd  /home/snops/f5-rs-app3``

- Execute below code:

.. code-block:: terminal

   git checkout master
   git merge dev -m "changed asm policy"

.. Note:: The merge will trigger a job in jenkins which is configured to monitor this repo - 'agility_devsecops/f5-rs-app3-prd/B1 - push a WAF policy',
          since the environment isn't deployed yet it will fail, either cancel the job or let it fail.

Task 4.2 Deploy PROD:
~~~~~~~~~~~~~~~~~~

.. Note:: In this lab we manually deploy PROD after the tests have completed.
          This manual step can easily be automated, what would be  metrics that
          we need to verify successful deployment?

- Go to the 'Agility DevSecOps > f5-rs-app3-prd' folder, choose the 'Service deployment pipeline', view and run the pipeline.

- Open Chrome and login to our Production BIG-IP at https://10.1.1.15 (admin/admin)

- Verify that the Production BIG-IP now contains all the Services (serviceMain) and Security Policies we have worked on throughout this lab
