.. |labmodule| replace:: 4
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Executing Jenkins Jobs for Creation or Modify
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that we have Jenkins running and have the dependent Slack Plugin installed
we can utilize our Jenkins Pipeline Scripts to execute successfully

Task 1 - Building the Framework via Jenkins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This step is executing the f5-newman-wrapper files. Instead of having to run the framework build
and Pool member adds individually, Jenkins has a pause function looking for approval;
which after approving will allow the node to be added. Jenkins will continue to update
the class via Slack how things are progressing, the build will also keep a running console for
logging we will review.

1. From the Jenkins Dashboard click on ``create new jobs``

.. |image103| image:: /_static/image103.png
 :scale: 70%

2. We are going to create our first Pipeline Job. The name of the item use ``module_4_jenkinsfile1-2``, choose the ``Pipeline`` project style and select ``OK``

.. |image104| image:: /_static/image104.png
 :scale: 70%

3. We are going to be using the raw ``Jenkinsfile1-2`` right in the ``Pipeline Script`` option at the end of the config page, scroll to the bottom while looking at the other options to deploy a Pipeline. There are options in here such as Polling an SCM for the same file we are working with, using a ``Polling`` method would be full Continuous Deployment, as Jenkins would deploy the change on a polled bases and we have an automatic testing phase for syntax in the Pipeline.

.. |image105| image:: /_static/image105.png
 :scale: 70%

4. We need to enter the contents of the ``Jenkinsfile1-2`` into the ``Script`` section under Pipeline. After the contents are added click the ``Save`` Option.

.. code-block:: json
   :linenos:

 node {
   stage('Testing') {
      //Run the tests
      //sh "python –m /home/snops/Local_Mapped_Repository/jenkins/f5-newman-buil                                                d/f5-newman-build-1"
      //sh "python –m /home/snops/Local_Mapped_Repository/jenkins/f5-newman-buil                                                d/f5-newman-build-2"
   }
   stage('Frameword-Deployment') {
       //Run SNOPS Container Newman Package Virtual and Pool
      sh "f5-newman-wrapper /home/snops/Local_Mapped_Repository/jenkins/f5-newma                                                n-build/f5-newman-build-1"
      //chatops slack message that run has completed
      slackSend(
         channel: '#jenkins_builds',
         color: 'good',
         message: 'Super-NetOps Engineer is about to deploy an F5 Service Framew                                                ork, Approval Needed!',
         teamDomain: 'f5agilitydevops',
         token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
         )
   }
   stage('Approval') {
      //Gate the process and require approval
      input 'Proceed?'
      //chatops slack message that run has completed
      slackSend(
          channel: '#jenkins_builds',
          color: 'good',
          message: 'Super-NetOps Engineer just approved a new F5 Service Framewo                                                rk, thats some serious Continuous Delivery!',
          teamDomain: 'f5agilitydevops',
          token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
          )
   }
   stage('Add-Sevice-Node') {
       //Run SNOPS Container Newman Package add Node to Pool
      sh "f5-newman-wrapper /home/snops/Local_Mapped_Repository/jenkins/f5-newma                                                n-build/f5-newman-build-2"
      //chatops slack message that run has completed
      slackSend(
         channel: '#jenkins_builds',
         color: 'good',
         message: 'Super-NetOps Engineer just added a Node to a Service, Product                                                ion is Online!',
         teamDomain: 'f5agilitydevops',
         token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
         )
   }
 }

.. |image106| image:: /_static/image106.png
 :scale: 70%

5. Once the Job is saved, you will be taken to the stage view page, from here we are going to execute our Pipeline build, choose the ``Build Now`` option.

.. |image107| image:: /_static/image107.png
 :scale: 70%

6. The Build is now running, the stages are being executed in order. On our third stage however we have a pause and an approval needed, also at the same time Slack has notified us that a new service is being deployed.

.. |image108| image:: /_static/image108.png
 :scale: 70%

.. |image109| image:: /_static/image109.png
 :scale: 70%

.. |image110| image:: /_static/image110.png
 :scale: 70%

7. Approve the change in Jenkins to allow the build to finish, there is also a Jenkins Slack notification for the Approval and Completion

.. |image111| image:: /_static/image110.png
 :scale: 70%

.. |image112| image:: /_static/image110.png
 :scale: 70%

8. At the end of the complete (or failed build) there is a console output from Jenkins of the build, select the blue globe on the right to see the outputs

.. |image113| image:: /_static/image113.png
 :scale: 70%

9. The output file not only contains the Jenkins output from the Build, but also the f5-newman-wrapper toolkit logs for easy troubleshooting on maybe response codes.

.. |image114| image:: /_static/image114.png
 :scale: 70%

10. Check Slack visual for completion of everything!

.. |image115| image:: /_static/image115.png
 :scale: 70%

11. Verify on the BIG-IP that the pool ``module_3_vs`` has been created and the services are Green

.. |image115| image:: /_static/image117.png
 :scale: 70%

Task 2 - Jenkinsfile3 and Jenkinsfile4
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

These two Jenkins files were completed to show the ability of creating smaller deployment, in our case we will use the f5-newman-wrapper toolkit to again change the user selected state of a pool member. The different Pipelines also have different Slack Color depictions, helping quickly identify to team members an issue.

1. Return to the Jenkins Dashboard and select ``New Item``

.. |image116| image:: /_static/image116.png
 :scale: 70%

2. Follow steps 2 & 3 of the last module creating 2 new Jenkins jobs, one for each desired user state.

- Pipeline Job name ``module_4_jenkinsfile_3``

.. code-block:: json
   :linenos:

 node {
   stage('Testing') {
      //Run the tests
      //sh "python –m /home/snops/Local_Mapped_Repository/jenkins/f5-newman-operation/f5-newman-build-3"
   }
   stage('Disable-Node') {
       //Run SNOPS Container Newman Package Virtual and Pool
      sh "f5-newman-wrapper /home/snops/Local_Mapped_Repository/jenkins/f5-newman-operation/f5-newman-build-3"
      //chatops slack message that run has completed
      slackSend(
         channel: '#jenkins_builds',
         color: 'bad',
         message: 'Super-NetOps Engineer just disabled a Service Node!',
         teamDomain: 'f5agilitydevops',
         token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
         )
   }
 }

3. Verify on the BIG-IP that the pool ``module_3_pool`` has a user down node

- Pipeline Job name ``module_4_jenkinsfile_3``

.. code-block:: json
   :linenos:

 node {
   stage('Testing') {
      //Run the tests
      //sh "python –m /home/snops/Local_Mapped_Repository/jenkins/f5-newman-operation/f5-newman-build-4"
   }
   stage('Enable-Node') {
       //Run SNOPS Container Newman Package Virtual and Pool
      sh "f5-newman-wrapper /home/snops/Local_Mapped_Repository/jenkins/f5-newman-operation/f5-newman-build-4"
      //chatops slack message that run has completed
      slackSend(
         channel: '#jenkins_builds',
         color: 'good',
         message: 'Super-NetOps Engineer just enabled a Service Node!',
         teamDomain: 'f5agilitydevops',
         token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
         )
   }
 }

4. Verify on the BIG-IP that the pool ``module_3_pool`` has a user up node
