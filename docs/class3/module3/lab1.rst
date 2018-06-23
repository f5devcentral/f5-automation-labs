.. |labmodule| replace:: 3
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Deploy app to DEV environment (Dave)
==================================================================

Background:
~~~~~~~~~~~

Security team has created some security policies templates, those were built based on the F5 templates with some modifications to the specific enterprise. 
in this lab we don't cover the 'how to' of the security templates. we focus on the operational side and the workflows.

The Tasks are split between the two roles:
 - secops
 - Dave - the person who's responsible of changing code for the app and the infrastructure of the app (dev team)
 
Lab scenario:
~~~~~~~~~~~~~

New app - App2 is being developed. the app is an e-commerce site. 
code is ready to go into 'DEV' environment. for lab simplicity there are only two environments - DEV and PROD. 
Dave should deploy their new code into a DEV environment that is exactly the same as the production environment. 
run their application tests and security tests.

.. Note:: Pipeline is broken to DEV and PROD for lab simplicity. 
   from a workflow perspective the pipelines are the same. 
   it is broken up to two for a better lab flow. 

   
.. Note:: OUT OF SCOPE - a major part of the app build process is out of scope for this lab, 
   Building the app code and publish it as a container to the registry. this process is done using DOCKERHUB.  

Task 1.1 - review Dave's repo
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1.1.1 view git branches in the application repo:
****************************************************

on the container CLI type the following command to view git branches:

.. code-block:: terminal

   cd /home/snops/f5-rs-app2
   git branch
   
the app repo has two branches, dev and master. we are now working on the dev branch. 

1.1.2 view files in the application repo:
****************************************************

on the container CLI type the following commands to view the files in the repo:

.. code-block:: terminal

   cd /home/snops/f5-rs-app2
   ls

- application code under the 'all-in-one-hackazon' folder. 
- infrastructure code maintained in the 'iac_parameters.yaml' file. 
 
1.1.3 explore the infrastructure as code parameters file:
*****************************************************************

.. code-block:: terminal

   more iac_parameters.yaml
   
the infrastructure of the environments is deployed using ansible playbooks that were built by devops/netops. 
those playbooks are being controlled by jenkins which takes the iac_parameters.yaml file and uses it as parameters for the playbooks. 

- that enables dave to choose the aws region in which to deploy, the name of the app and more.  
- dave can also control the deployment of the security policies from his repo as we will see. 
 
Task 1.2 - Deploy dev environment 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. Note:: Jenkins can be configured to run the dev pipeline based on code change in dave's app repo. 
   in this lab we are manually starting the Full stack pipeline in Jenkins to visualize the process. 

1.2.1 Open Jenkins:
**************************

go to UDF, on the :guilabel:`jumphost` click on :guilabel:`access` and :guilabel:`jenkins`

:guilabel:`username:` ``snops`` , :guilabel:`password:` ``default``


.. Note:: when you open jenkins you should see some jobs that have started running automatically, jobs that contain: 'Push a WAF policy',
          this happens because jenkins monitors the repo and start the jobs.
		  *you can cancel the jobs or let them fail*. 


1.2.2 start the 'Full stack pipeline':
**************************		  
in jenkins open the :guilabel:`DevSecOps - Lab - App2` folder, the lab jobs are all in this folder 
we will start by deploying a DEV environment, you will start a pipeline that creates a full environment in AWS. 


   |jenkins010|
   
click on the 'f5-rs-app2-dev' folder.
here you can see all of the relevant jenkins jobs for the dev environment.

   |jenkins020|

click on 'Full stack deployment' , that's the pipeline view for the same folder. 

   |jenkins030|
   
click on 'run' to start the dev environment pipeline. 

   |jenkins040|


   
Task 1.3 - Review the deployed environment 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1.3.1 review jobs output:
**************************	

you can review the output of each job while its running, click on the small :guilabel:`console output` icon as shown in the screenshot:

   |jenkins050|
   
1.3.2 let the jobs run until the pipeline finishes:
**************************	
   
wait until all of the jobs have finished (turned green and the app-test one is red ). 

   |jenkins055|

1.3.3 open slack and extract bigip and application info:
**************************	
   
 - open slack - https://f5-rs.slack.com/messages/C9WLUB89F/ (if you don't already have an account you can set it up with an F5 email)
 - go to the :guilabel:`builds` channel. 
 - use the search box on the upper right corner and filter by your username (student#). 
 - jenkins will send to this channel the bigip and the application address. 


   |slack040|

1.3.4 login to the bigip:
**************************	

- use the address from the slack notification (look for your username in the :guilabel:`builds` channel)
- username: admin
- password: the personal password you defined in the global parameters file in the vault_dac_password parameter.

explore the objects that were created: 

1.3.5 Access the App:
**************************	

try to access the app using the ip provided in the slack channel - that's the Elastic ip address that's tied to the VIP on the bigip.
after ignoring the ssl error (because the certificate isn't valid for the domain) you should get to the Hackazone mainpage

   |hackazone010|
   

1.3.6 Summary - Jobs roles:
**************************	

A1 - aws-net:
+++++++++++++
- Builds an AWS VPC with subnets and security groups. 
- Jenkins runs a shell command that kicks off an ansible playbook with parameters from the application repo. (like which region) 
- Ansible playbook takes the parameters and use them to deploy a cloud formation template 
- cloud formation template deploys all resources in AWS subscription

A2 - aws_app:
+++++++++++++
- Deploys an AWS autoscale group with a containerized app
- Jenkins runs a shell command that kicks off an ansible playbook with parameters from the application repo. (like container name)
- Jenkins uses the VPC / subnets  information from previews job 
- Ansible playbook takes the parameters and use them to deploy a cloud formation template 
- cloud formation template deploys all resources in AWS subscription


A3 - aws-bigip:
+++++++++++++
- Deploys a BIGIP to AWS 
- Jenkins runs a shell command that kicks off an ansible playbook with parameters from the application repo. (like which region) 
- Jenkins uses the VPC / subnets  information from previews job 
- Ansible playbook takes the parameters and use them to deploy a cloud formation template 
- cloud formation template deploys all resources in AWS subscription

A4 - aws bigip onboard (rest_user):
+++++++++++++
- Connects to the BIGIP over SSH with private key (only way to connect to an AWS instance).
- configures rest user and password for future use 

A5 - bigip rs onboard:
+++++++++++++
- deploys the 'enterprise' default profiles, for example: HTTP, analytics, AVR, DOSL7, iapps etc.  
- Jenkins runs a shell command that kicks off an ansible playbook with parameters from the application repo.  
- Ansible playbook takes the parameters and uses them to deploy a configuration to the BIGIP using the F5 supported ansible modules and API's.

B1 - push a WAF policy:
+++++++++++++
- deploys the 'application specific' profiles, for example: DOSL7, waf policy 
- Jenkins runs a shell command that kicks off an ansible playbook with parameters from the application repo. (which waf policy to use, dosl7 parameters)
- Ansible playbook takes the parameters and uses them to deploy a configuration to the BIGIP using the F5 supported ansible modules and API's.

B2 - rs-iapp service:
+++++++++++++
- deploys the 'service definition' uses AS2 API 
- Jenkins runs a shell command that kicks off an ansible playbook with parameters from the application repo.
- Jenkins uses the application autoscale group name from previous jobs
- Ansible playbook takes the parameters and uses them to deploy a configuration to the BIGIP using the F5 supported ansible modules and API's.
- AS2 turns the service definition into objects on the BIGIP 

B3 - app-test:
+++++++++++++
- Send HTTP requests to the application to test it 
- Jenkins runs a shell command that kicks off an ansible playbook with parameters
- Ansible playbook takes the parameters and uses them to run HTTP requests to our APP.

B4  - rs-attacks:
+++++++++++++
- Test app vulnerabilities 
- Jenkins runs a shell command that kicks off an ansible playbook with parameters
- Ansible playbook takes the parameters and uses them to run HTTP requests to our APP.

SEC export waf policy:
+++++++++++++
- Pulls a policy from a bigip and stores in a git repo 
- Jenkins runs a shell command that kicks off an ansible playbook with parameters
- Ansible playbook takes the parameters and uses them to run F5 modules (Created by Fouad Chmainy <F.Chmainy@F5.com> ) to pull the waf policy from the BIGIP 

Z - destroy:
+++++++++++++
- Destroy the environment 



Task 1.4 - Go over the test results 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1.4.1 view the test results:
**************************	

the deployment process failed because not all of the application tests completed successfully. 
review the app-test job :guilabel:`console output`

   |jenkins053|
   

1.4.2 identify the WAF blocked page response:
**************************	
   
scroll to the bottom of the page, you should see the response with :guilabel:`request rejected`, and the failure reason as :guilabel:`unexpected response returned`

this is an indication that ASM has blocked the request. in our case it is a false positive. 




   |jenkins056|
   
.. Note:: in this lab secops uses the same WAF policy template for many apps.
   we don't want to create a 'snowflake' waf policy. so with this failure dave will escalete to secops. 
   that ensures that the setting will be reviewd and if needed the policy template will get updated. 
   
   
.. |jenkins010| image:: images/jenkins010.PNG 
   
.. |jenkins020| image:: images/jenkins020.PNG 
   
.. |jenkins030| image:: images/jenkins030.PNG
   
.. |jenkins040| image:: images/jenkins040.PNG
   
.. |jenkins050| image:: images/jenkins050.PNG
   
.. |jenkins055| image:: images/jenkins055.PNG

.. |jenkins053| image:: images/jenkins053.PNG

.. |jenkins056| image:: images/jenkins056.PNG
   
.. |slack040| image:: images/Slack-040.PNG
   
.. |hackazone010| image:: images/hackazone010.PNG
