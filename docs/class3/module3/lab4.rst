.. |labmodule| replace:: 3
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Deploy the prod environment (Dave)
================================================================

Background:
~~~~~~~~~~~

We've completed our tests in dev, both functional and security tests have passed


Task 4.1 - Merge Infrastructure as Code file from dev
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* We will now "merge" the app3 dev branch with the master branch,
  so that the production deployment will use the correct policy.

* Return to the f5-use-cases Container
  * copy and paste ``cd  /home/snops/f5-rs-app3``

  * Execute below code:

    .. code-block:: terminal

       git checkout master
        git merge dev -m "changed asm policy"

.. Note:: The merge will trigger a job in jenkins which is configured to monitor this repo - ``agility_devsecops/f5-rs-app3-prd/B1 - push a WAF policy``,
          since the environment isn't deployed yet it will fail, either cancel the job or let it fail.

Task 4.2 Deploy prod:
~~~~~~~~~~~~~~~~~~~~~

.. Note:: In this lab we manually deploy prod after the tests have completed. This is an easily automated task, a simple poll, or webhook could be initiated do to the same work

* Go to the 'Agility devSecOps > f5-rs-app3-prd' folder, choose the 'Service deployment pipeline', view and run the pipeline.

* Open Chrome and login to our production BIG-IP at https://10.1.1.15 (admin/admin)

* Verify that the production BIG-IP now contains all the Services (serviceMain) and Security Policies we have worked on throughout this lab
