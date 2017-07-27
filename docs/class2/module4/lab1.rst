.. |labmodule| replace:: 4
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Files Locations and Jenkins setup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We've been executing commands locally from Automated scripts, at this point we are
now going to take the toolkits and tie them together to form a Pipeline.
Pipelines will vary in deployments and even within solutions. Our lab
will show you just one way it can be utilized.


Task 1 - Locating the Jenkins files and how they are setup
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Open Putty and connect to the ``super-netops-container`` user credentials are ``snops`` and ``default``

2. During the installation of the super-netops-container there were several github repositories cloned, all of which are mapped to the ``/home/snops/`` directory.
  Execute: ``cd /home/snops/f5-automation-labs/jenkins`` to access the folder containing the Jenkins Pipeline Files

3. The Jenkins files are located alongside the f5-newman-wrapper files we've used in the previous labs

.. code::

    |- /f5-automation-labs
       |- /jenkins
       |  |  /f5-newman-build
       |  |      Jenkinsfile1-2
       |  |      Jenkinsfile5
       |  |  /f5-newman-operation
       |  |      Jenkinsfile3
       |  |      Jenkinsfile4

4. Lets review the first Jenkins file excute ``cat Jenkinsfile1-2``
  File output:

.. code-block:: yaml
    :linenos:

    node {
       stage('Testing') {
          //Run the tests
          //sh "python –m /home/snops/Local_Mapped_Repository/jenkins/f5-newman-build/f5-newman-build-1"
          //sh "python –m /home/snops/Local_Mapped_Repository/jenkins/f5-newman-build/f5-newman-build-2"
       }
       stage('Frameword-Deployment') {
           //Run SNOPS Container Newman Package Virtual and Pool
          sh "f5-newman-wrapper /home/snops/Local_Mapped_Repository/jenkins/f5-newman-build/f5-newman-build-1"
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
          sh "f5-newman-wrapper /home/snops/Local_Mapped_Repository/jenkins/f5-newman-build/f5-newman-build-2"
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

This is a Jenkins Pipeline file, which we'll be inputting into a Pipeline deployment in out Jenkins Toolkit

The file should be human readable even without Jenkins experience, a ``stage`` can be thought of as a step in
the Pipeline, right after the stage is its name, followed by some commands. Since the super-netops-container
has is running this Jenkins installation we can use local mapping to file structure. In more common deployments
the Jenkins file would be stored in a SCM (like Github) called during an action or polled on an interval to
execute.

Testing before executing code via tools like linter can make sure formatting is valid and reduce errors from
happing during build.

Our installation also has some Slack calls. Which we will setup next.

Task 2 - Accessing Jenkins and Installed the Slack-Notifier Plug-in
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Slack is a ChatOps tool, think of Skype, Messenger or IIRC! Except Slack also has the ability to take in
bots. slackbots are used to interact with services, they might query something for you when asked or
give you information when they notice something. In our case our Jenkins Pipeline file will use slack to
notify all of us when an action happens, collaborative teamwork.

1. Access Jenkins via Chrome, if you didnt already set a bookmark to the mapped port you can access
 the service via ``http://localhost:10000``, the user credentials are ``admin\default``
