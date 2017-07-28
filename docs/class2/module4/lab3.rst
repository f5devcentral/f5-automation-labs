.. |labmodule| replace:: 4
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Destroying a Service with Jenkins
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the last module we will teardown the Application Service we've been working with today.
Destruction of Application Service's is an easy to complete step that is often overlooked because
of the perceived complexity it takes to reverse engineer a new build. Utilizing Postman and
f5-newman-wrapper this is actually a very easy step, and will be incredibly valueable
to teams seeking to strive for better Application Lifecycle Management. Because
Postman and newman operate in sequential order simply reversing the order of
creation will have have the teardown order correct, and since we're using the
native F5 REST endpoints having the Resource with a DELETE method is all you need.

Task 1 - Teardown the Application via Jenkins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Return to the Jenkins Dashboard and select ``New Item``

   |image116|

#. Follow steps 2 & 3 of the last module creating the final Jenkins job

   **Pipeline Job Name:** ``module_4_jenkinsfile_4``

   .. code-block:: groovy
      :linenos:

      node {
         stage('Testing') {
            //Run the tests
            //sh "python –m /home/snops/f5-automation-labs/jenkins/f5-newman-build/f5-newman-build-5"
         }
         stage('Service-Removal') {
             //Run SNOPS Container Newman Package add Node to Pool
            sh "f5-newman-wrapper /home/snops/f5-automation-labs/jenkins/f5-newman-build/f5-newman-build-5"
            //chatops slack message that run has completed
            slackSend(
               channel: '#jenkins_builds',
               color: 'good',
               message: 'Super-NetOps Engineer is about to remove an F5 Service Framework, Approval Needed!',
               teamDomain: 'f5agilitydevops',
               token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
               )
         }
         stage('Approval') {
            //Gate the process and require approval
            input 'Proceed?'

         }
         stage('Service-Deleted') {
             //Run SNOPS Container Newman Package add Node to Pool
            sh "f5-newman-wrapper /home/snops/f5-automation-labs/jenkins/f5-newman-build/f5-newman-build-5"
            //chatops slack message that run has completed
            slackSend(
               channel: '#jenkins_builds',
               color: 'good',
               message: 'Super-NetOps Engineer removed an F5 Service successfully!',
               teamDomain: 'f5agilitydevops',
               token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
               )
         }
      }

#. Verify the on the BIG-IP the service has been Deleted

.. |image116| image:: /_static/class2/image116.png
   :scale: 70%
