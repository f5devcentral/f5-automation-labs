Lab 3: Deploy with new waf policy 
----------------------------

Background: 
~~~~~~~~~~~~~

secops found a false positive on the waf policy, they fixed it and created a new version for that policy. 
 
 
Task 1 (Dave) - Update the policy you are using in 'DEV' 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

deploy to dev again:
~~~~~~~~~~~~~~~~~~~

ssh into the contianer, make sure you are connected as user 'jenkins' 
go to the application git folder. check which branches are there and what is the active branch. (git branch) 
you should be on the 'dev' branch. the files you see belong to the dev branch. 

.. code-block:: terminal

   cd /home/snops/f5-rs-app2
   git branch
   
Configure your information in git, this information is used by git (in this lab we use local git so it only has local meaning) 

.. code-block:: terminal

   git config --global user.email "you@example.com"
   git config --global user.name "Your Name"
   
 
edit the iac_parameters.yaml file to point the deployment to the new ASM policy (linux-high-v01). then add the file to git and commit 

.. code-block:: terminal

   vi iac_parameters.yaml 
   git add iac_parameters.yaml
   git commit -m "changed asm policy"

	|dev-cmd-010|
   
   
go back to jenkins and open the 'f5-rs-app2-dev ' folder. choose the 'waf policy' tab , jenkins is set up to monitor the application repo. when a 'commit' is identified jenkins will start an automatic pipeline to deploy the service. it takes up to a minute for jenkins to start the pipeline. 

jenkins takes the parametes from the git repo and uses them to deploy/update the service. 

log on to the bigip again, check which ASM policies are there and which policy is attached to the 'App2 VIP. 
check the 'traffic learning' for the security policy and verify you no longer see the 'high ascii charachters' 

this concludes the tests in the 'dev' environment. 
we are now ready to push the changes to production. 



we will 'merge' the app2 dev branch with the master branch so that the production deployment will use the correct policy. 
on the /home/snops/f5-rs-app2 folder:

.. code-block:: terminal
 
   git checkout master
   git merge -m "changed asm policy"

* the merge will trigger a job in jenkins that's configured to monitor this repo - 'Push waf policy', since the environment isn't deployed yet it will fail, either cancel the job or let it fail. 





   
.. |dev-cmd-010| image:: images/dev-cmd-010.PNG

