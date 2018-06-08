Lab 4 (Dave): Deploy the PROD environment 
----------------------------

Background: 
~~~~~~~~~~~~~

we completed tests in DEV, both functional tests and security tests have passed. 
 
Task 1 - merge infrastructure as code file from dev
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

we will 'merge' the app2 dev branch with the master branch so that the production deployment will use the correct policy. 
on the /home/snops/f5-rs-app2 folder:

.. code-block:: terminal
 
   git checkout master
   git merge -m "changed asm policy"

* the merge will trigger a job in jenkins that's configured to monitor this repo - 'Push waf policy', since the environment isn't deployed yet it will fail, either cancel the job or let it fail. 


Task 2 deploy PROD:
~~~~~~~~~~~~~~~~~~

we will deploy the environment. 
go to the 'f5-rs-app2-prod' folder, choose the 'Full stack deployment' view and run the pipeline. 
go to slack to get the ip's for the bigip and the app. 

open the bigip and verify that you don't see the 'high ascii' false positive. 

verify the security policy that's attached to the VIP. 
