.. |labmodule| replace:: 4
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – File Locations and Jenkins setup
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We've been executing commands locally from Automated scripts, at this point we are
now going to take the toolkits and tie them together to form a Pipeline.
Pipelines will vary in deployments and even within solutions. Our lab
will show you just one way it can be utilized.


Task 1 - Locating the Jenkins files and how they are setup
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. Open Putty and connect to the ``super-netops-container``, user credentials are ``snops`` and ``default``

2. During the installation of the super-netops-container there were several github repositories cloned, all of which are mapped to the ``/home/snops/`` directory.

Execute: ``cd /home/snops/f5-automation-labs/jenkins`` to access our folder containing the Jenkins Pipeline Files

3. The Jenkins files are located alongside the f5-newman-wrapper files we've used in the previous labs (setup this way was for ease of learning). You may place this tools in different structures in your environment.

 File Locations:

.. code::

    |- /f5-automation-labs
       |- /jenkins
       |  |  /f5-newman-build
       |  |      Jenkinsfile1-2
       |  |      Jenkinsfile5
       |  |  /f5-newman-operation
       |  |      Jenkinsfile3
       |  |      Jenkinsfile4

4. Lets review the first Jenkins file, execute ``cat Jenkinsfile1-2``

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

- This is a Jenkins Pipeline file, which we'll be inputing into a Pipeline deployment via our Jenkins Toolkit.

- The file should be human readable even without Jenkins experience, a ``stage`` can be thought of as a step in the Pipeline (or a work-center in manufacturing terms), right after the stage is its name, followed by some commands. Since the super-netops-container is running this Jenkins installation locally we can use local mappings to file structure.

- In more common deployments the Jenkins file would be stored in a SCM (like Github) and called during like a polling timer, build/ Pull request, or some other kind of scripting launch.

- Testing in Pipeline before executing code with tools like ``linter`` or python scripts can make sure formatting is valid and reduce errors from happing during build.

Our installation also has some Slack calls. Which we will setup next.

Task 2 - Accessing Jenkins and Installing the Slack-Notifier Plug-in
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Slack is a ChatOps tool, think of Skype, Messenger or IIRC! Except Slack also has the ability to take in
bots. slackbots are used to interact with services, they might query something for you when asked, or
give you information when they notice something. In our case our Jenkins Pipeline file will use Slack to notify all of us when an action happens, collaborative teamwork.

1. Access Jenkins via Chrome, if you didnt already set a bookmark to the mapped port you can access the service via ``http://localhost:10000``, the user credentials are ``admin\default``.

  .. |image97| image:: /_static/image097.png
   :scale: 70%

2. Once you are logged into Jenkins it should look like below

  .. |image98| image:: /_static/image098.png
   :scale: 70%

3. Click on Manage Jenkins

  .. |image99| image:: /_static/image099.png
   :scale: 70%

4. On the Manage Jenkins tab Select ``Available`` then filter on ``slack``, once the filter is complete choose ``Slack Notification Plugin`` and execute ``Install without Restart``

  .. |image100| image:: /_static/image100.png
   :scale: 70%

5. Once the Slack Notification Plugin has changed to ``Success``, tick the radio button for ``Restart Jenkins when installation is complete and no jobs are running``

  .. |image101| image:: /_static/image101.png
   :scale: 70%

6. Slack can take a few minutes to stall in the background (give it 30 seconds), once the once the ``Restarting Jenkins`` globe is grey and the status is ``Running`` go back to Jenkins Home

  .. |image102| image:: /_static/image102.png
   :scale: 70%

7. Executing a restart of Jenkins you session will be ended and you will need to log back into the system

  .. |image97| image:: /_static/image097.png
   :scale: 70%
