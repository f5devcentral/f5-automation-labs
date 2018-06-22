Lab |labmodule|\.\ |labnum|\: Deploy the PROD environment (Dave)
================================================================

Background: 
~~~~~~~~~~~~~

we completed tests in DEV, both functional tests and security tests have passed.
 
Task 4.1 - merge infrastructure as code file from dev
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- we will 'merge' the app2 dev branch with the master branch.
  so that the production deployment will use the correct policy. 

- on the /home/snops/f5-rs-app2 folder:

.. code-block:: terminal
 
   git checkout master
   git merge dev -m "changed asm policy"

.. Note:: the merge will trigger a job in jenkins that's configured to monitor this repo - 'Push waf policy',
          since the environment isn't deployed yet it will fail, either cancel the job or let it fail.     

Task 4.2 deploy PROD:
~~~~~~~~~~~~~~~~~~

.. Note:: in this lab we manually deploy PROD after the tests have completed.
          this manual step can easily be automated. what are the metrics that we need to verify successful deployment ? 
		  how can splunk analytics / bigiq 6.0 help with that ? 

- go to the 'f5-rs-app2-prod' folder, choose the 'Full stack deployment' view and run the pipeline. 

- go to slack  https://f5-rs.slack.com/messages/C9WLUB89F/ to get the ip's for the bigip and the app. 

- open the bigip and verify that you don't see the 'high ascii' false positive. 

- verify the security policy that's attached to the VIP. 