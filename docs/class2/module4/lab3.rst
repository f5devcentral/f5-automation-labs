.. |labmodule| replace:: 4
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Destroying a Service with Jenkins
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the last module we will teardown the service we've been working with today.
Destruction of service is an easy to complete step that is often overlooked because
of the perceived complexity it takes to reverse engineer a new build. Utilizing Postman and
f5-newman-wrapper this is actually a very easy step and will be incredibly value
to the team seeking to strive for better Application lifecycle management. Because
Postman and newman operate in sequential order simply reversing the order of
creation will have have the teardown order correct, and since we're using the
native F5 REST endpoints having the destination as the Resource with a DELETE method
is all you need.

Task 1 - Teardown the Application via Jenkins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Return to the Jenkins Dashboard and select ``New Item``

.. |image116| image:: /_static/image116.png
 :scale: 70%

2. Follow steps 2 & 3 of the last module creating the final Jenkins job

- Pipeline Job name ``module_4_jenkinsfile_4``

.. code-block:: json
   :linenos:

   node {
      stage('Testing') {
         //Run the tests
         //sh "python –m /home/snops/Local_Mapped_Repository/jenkins/f5-newman-build/f5-newman-build-5"
      }
      stage('Service-Removal') {
          //Run SNOPS Container Newman Package add Node to Pool
         sh "f5-newman-wrapper /home/snops/Local_Mapped_Repository/jenkins/f5-newman-build/f5-newman-build-5"
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
         sh "f5-newman-wrapper /home/snops/Local_Mapped_Repository/jenkins/f5-newman-build/f5-newman-build-5"
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

4. Verify the on the BIG-IP the service has been Deleted
