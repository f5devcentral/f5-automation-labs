.. |labmodule| replace:: 4
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| - Destroying a Service with Jenkins
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For the last module we will teardown the Application Service we've been working with today.
Destruction of Application Services is an easy step often overlooked because
of the perceived complexity it takes to reverse engineer a build. Utilizing Postman and the
f5-newman-wrapper this is actually a very easy step, and will be incredibly valuable
to teams seeking to strive for better Application Lifecycle Management. Because
Postman and Newman operate in sequential order, simply reversing the order of
creation will result in the correct teardown order. Also, since we're using the
native F5 REST endpoints, all you need is a Resource with a DELETE method.

Task 1 - Teardown the Application via Jenkins
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Return to the Jenkins Dashboard and select ``New Item``

   |module-4-1|

#. Repeat steps 2 & 3 of task 1 in the previous lab to create the final Jenkins job

#. Create and Execute ``module_4_jenkinsfile_5`` to destroy our Application Service

   **Pipeline Job Name:** ``module_4_jenkinsfile_5``

   .. code-block:: groovy
      :linenos:

      node {
         stage('Testing') {
            //Run the tests
            //sh "python -m /home/snops/f5-automation-labs/jenkins/f5-newman-build/f5-newman-build-5"
         }
         stage('Removal-Notification') {
            //Run SNOPS Container Newman Package Delete Service
            //chatops slack message that run has completed
            slackSend(
               channel: '#jenkins_builds',
               color: 'bad',
               message: 'Super-NetOps Engineer is about to remove an F5 Service!',
               teamDomain: 'f5agilitydevops',
               token: 'vLMQmBq2tiyiCcZoNlbmAi0Z'
               )
         }
         stage('Approval') {
            //Gate the process and require approval
            input 'Delete?'
         }
         stage('Service-Delete') {
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
#. Class 2 is Complete! If you have extra time, please give us feedback! https://www.surveymonkey.com/r/W2SZDYK

.. |module-4-1| image:: images/module-4-1.png
   :scale: 70%
