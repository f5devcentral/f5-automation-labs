.. |labmodule| replace:: 4
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Executing Jenkins Jobs for Creation or Modify
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that we have Jenkins running and the dependent Slack Plugin installed
we can utilize our Jenkins Pipeline Scripts to execute successfully.

Task 1 - Building the Framework via Jenkins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This step is executing the f5-newman-wrapper files. Instead of having to run the two different
builds (Framework and Pool member add) individually, Jenkins has a pause function looking for approval.
After approving, this will allow the node to be added, still using 2 f5-newman-wrapper files but in conjunction
with a single solution (Jenkins). Jenkins will continue to update the class via Slack as people
are progressing. Jenkins will also keep a running console for logging, which we will also review.

#. From the Jenkins Dashboard click on ``create new jobs``

   |image103|

#. We are going to create our first Pipeline Job. Name the item ``module_4_jenkinsfile1-2``, choose the ``Pipeline`` project style and select ``OK``

   |image104|

#. We are going to be using the raw ``Jenkinsfile1-2`` right in the ``Pipeline Script`` option at the end of the config page. Scroll to the bottom of the page but please look at the other options to deploy a Pipeline. There are options in here such as Polling an SCM for the same file we are working with. The ``Polling`` method enables full Continuous Deployment, as Jenkins will deploy the change on a polled basis and we have an automatic testing phase for syntax in the Pipeline.

   |image105|

#. We need to enter the contents of the ``Jenkinsfile1-2`` into the ``Script`` section under Pipeline. After the contents are added click the ``Save`` Option.

.. code-block:: groovy
   :linenos:

    node {
       stage('Testing') {
          //Run the tests
          //sh "python –m /home/snops/f5-automation-labs/jenkins/f5-newman-build/f5-newman-build-1"
          //sh "python –m /home/snops/f5-automation-labs/jenkins/f5-newman-build/f5-newman-build-2"
       }
       stage('Frameword-Deployment') {
           //Run SNOPS Container Newman Package Virtual and Pool
          sh "f5-newman-wrapper /home/snops/f5-automation-labs/jenkins/f5-newman-build/f5-newman-build-1"
          //chatops slack message that run has completed
          slackSend(
             channel: '#jenkins_builds',
             color: 'good',
             message: 'Super-NetOps Engineer is about to deploy an F5 Service Framework, Approval Needed!',
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
              message: 'Super-NetOps Engineer just approved a new F5 Service Framework, thats some serious Continuous Delivery!',
              teamDomain: 'f5agilitydevops',
              token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
              )
       }
       stage('Add-Sevice-Node') {
           //Run SNOPS Container Newman Package add Node to Pool
          sh "f5-newman-wrapper /home/snops/f5-automation-labs/jenkins/f5-newman-build/f5-newman-build-2"
          //chatops slack message that run has completed
          slackSend(
             channel: '#jenkins_builds',
             color: 'good',
             message: 'Super-NetOps Engineer just added a Node to a Service, Production is Online!',
             teamDomain: 'f5agilitydevops',
             token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
             )
       }
    }

   |image106|

#. Once the Job is saved, you will be taken to the stage view page, from here we are going to execute our Pipeline build, choose the ``Build Now`` option.

   |image107|

#. The Build is now running, and the stages are being executed in order. However, on our third stage we have a pause and an approval needed. Also at the same time Slack has notified us that a new service is being deployed and someone needs to approve it.

   |image108|

   |image109|

   |image110|

#. Approve the change in Jenkins to allow the build to finish. Once this is done, the approval and finished Slack notification will be sent.

   |image111|

   |image112|

#. At the end of the Build event (success or failure) there is a console output from Jenkins. Select the blue globe on the left to see the outputs

   |image113|

#. The output file not only contains the Jenkins output from the Build, but also the f5-newman-wrapper toolkit logs for easy troubleshooting

   |image114|

#. Check Slack visual for completion of everything!

   |image115|

#. Verify on the BIG-IP that the pool ``module_3_vs`` has been created and the services are Green

   |image117|

Task 2 - Jenkinsfile3 and Jenkinsfile4
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

These two Jenkins files were completed to show the ability of creating smaller deployments. In our case we will use the f5-newman-wrapper toolkit to again change the user selected state of a pool member. The different Pipelines notifications also have different Slack Color depictions, helping to quickly identify issues to team members.

#. Return to the Jenkins Dashboard and select ``New Item``

   |image116|

#. Follow steps 2 & 3 of the last module creating 2 new Jenkins jobs, one for each desired user state.

   **Pipeline Job Name:** ``module_4_jenkinsfile_3``

   .. code-block:: groovy
      :linenos:

      node {
        stage('Testing') {
           //Run the tests
           //sh "python –m /home/snops/f5-automation-labs/jenkins/f5-newman-operation/f5-newman-build-3"
        }
        stage('Disable-Node') {
            //Run SNOPS Container Newman Package Virtual and Pool
           sh "f5-newman-wrapper /home/snops/f5-automation-labs/jenkins/f5-newman-operation/f5-newman-build-3"
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

#. Verify on the BIG-IP that the pool ``module_3_pool`` has a user down node

   **Pipeline Job Name:** ``module_4_jenkinsfile_4``

   .. code-block:: groovy
      :linenos:

      node {
        stage('Testing') {
           //Run the tests
           //sh "python –m /home/snops/f5-automation-labs/jenkins/f5-newman-operation/f5-newman-build-4"
        }
        stage('Enable-Node') {
            //Run SNOPS Container Newman Package Virtual and Pool
           sh "f5-newman-wrapper /home/snops/f5-automation-labs/jenkins/f5-newman-operation/f5-newman-build-4"
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

#. Verify on the BIG-IP that the pool ``module_3_pool`` has a user up node

.. |image103| image:: /_static/class2/image103.png
   :scale: 70%
.. |image104| image:: /_static/class2/image104.png
   :scale: 70%
.. |image105| image:: /_static/class2/image105.png
   :scale: 70%
.. |image106| image:: /_static/class2/image106.png
   :scale: 70%
.. |image107| image:: /_static/class2/image107.png
   :scale: 70%
.. |image108| image:: /_static/class2/image108.png
   :scale: 70%
.. |image109| image:: /_static/class2/image109.png
   :scale: 70%
.. |image110| image:: /_static/class2/image110.png
   :scale: 70%
.. |image111| image:: /_static/class2/image110.png
   :scale: 70%
.. |image112| image:: /_static/class2/image110.png
   :scale: 70%
.. |image113| image:: /_static/class2/image113.png
   :scale: 70%
.. |image114| image:: /_static/class2/image114.png
   :scale: 70%
.. |image115| image:: /_static/class2/image115.png
   :scale: 70%
.. |image116| image:: /_static/class2/image116.png
   :scale: 70%
.. |image117| image:: /_static/class2/image117.png
   :scale: 70%
