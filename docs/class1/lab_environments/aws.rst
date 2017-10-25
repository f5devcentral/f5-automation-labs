Amazon AWS Lab Environment Guide
--------------------------------

.. WARNING:: The AWS CFT will run in your account.  The template includes
   components and instances that will incur a charge.  This charge will be
   billed to your account.

.. WARNING:: The AWS CFT is currently in testing.  You can complete Modules 1
   & 2 of this class using the template at this time.

You can use an Amazon CloudFormation Template (CFT) to launch your own lab
environment in AWS.  This guide assumes the following:

- Pre-existing Amazon AWS account
- Access to create AWS Instances and Resources
- You have created an AWS Key Pair:

  - http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html

- *You are responsible for all charges incurred*

More information about AWS can be found here:

https://aws.amazon.com/

Task 1 - Determine your Source IP Address
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The AWS lab environment restricts access based on your Source IP Address.  We 
will use a website to determine your Source IP for use in the next Task.

.. NOTE:: If you Source IP address changes you will lose access to your 
   environment.

Perform the following steps to complete this task:

#. Open a web browser window or tab and navigate to https://www.whatismyip.com/

#. Copy the IP Address shown in the :guilabel:`Your IP Address is:` box into 
   your clipboard

Task 2 - Launch the CloudFormation Template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Login to your AWS Management Console
 
   .. NOTE:: Access to the console is determined by your individual account 
      setup.  

      If you are using a personal account you should be able to 
      login using https://console.aws.amazon.com/console/home

      If you are using a corporate account please contant your IT Help Desk

#. Click :guilabel:`Services` and the top of the windows.  Then type ``cloud``
   into the search box and find the :guilabel:`CloudFormation` item.  Click 
   the :guilabel:`CloudFormation` item:

   |aws_image1|

#. Click the :guilabel:`Create Stack` button:

   |aws_image2|

#. On the :guilabel:`Select Template` screen select the 
   :guilabel:`Specify an Amazon S3 template URL` option.  Copy and paste the
   URL below into the box:

   ``https://s3.us-east-2.amazonaws.com/supernetops-cf-templates/class1.template``

   Click the :guilabel:`Next` button

   |aws_image3|

#. Complete the form in the :guilabel:`Specify Details` screen:

   - :guilabel:`Stack Name`: ``Super-NetOps-Lab`` or a name of your choice
   - :guilabel:`Branch`: ``master``
   - :guilabel:`InstanceType`: ``t2.medium``
   - :guilabel:`KeyName`: Select your AWS Key Pair
   - :guilabel:`UserIP`: Paste the IP Address from Task 1 and add ``/32`` to 
     to the end.

     .. NOTE:: You can also specify a CIDR formatted Subnet in this field

#. Click the :guilabel:`Next` button

#. On the :guilabel:`Options` screen click the :guilabel:`Next` button at
   the bottom of the screen

#. On the :guilabel:`Review` screen check the 
   ``I acknowledge that AWS CloudFormation might create IAM resources 
   with custom names`` field and click the :guilabel:`Create` button at
   the bottom of the screen

   |aws_image4|

#. Click the ``Super-NetOps-Lab`` stack to view details of the deployment

   |aws_image5|

#. Monitor the :guilabel:`Events` section of the page as the Stack deploys:

   |aws_image6|

#. The CFT used performs a nested deployment, leveraging other CFT's.  The 
   :guilabel:`Events` will notify you when new status messages are available.
   Total deployment time varies.  As the Stack is being deployed you will see 
   periodic ``CREATE_COMPLETED`` messages:

   |aws_image7|

#. You can also go back to the page listing Stacks and monitor the progres of 
   the nested templates from there:

   |aws_image8|

   |aws_image9|

#. Once the :guilabel:`Status` of the ``Super-NetOps-Lab`` **root** stack shows
   ``CREATE_COMPLETED`` click the :guilabel:`Outputs` tab.  You will see a 
   :guilabel:`Key` named ``JumpHostPublicIP``.  The :guilabel:`Value` is the 
   IP Address you can use to connect to the Lab Jumphost using RDP, HTTPS or
   SSH (diagnostics only).  

   |aws_image10|
#. You can now connect to the Jumphost using RDP or HTTPS:

   - RDP: Configure your RDP client to connect to the ``JumpHostPublicIP`` 
   - HTTPS: Using an HTML5 browser connect to ``https://<JumpHostPublicIP>``

#. Select how you would like to continue:

   - Review: :ref:`bigipbasics`
   - Start: :ref:`module1`

.. |aws_image1| image:: /_static/aws_image001.png
.. |aws_image2| image:: /_static/aws_image002.png
.. |aws_image3| image:: /_static/aws_image003.png
.. |aws_image4| image:: /_static/aws_image004.png
.. |aws_image5| image:: /_static/aws_image005.png
.. |aws_image6| image:: /_static/aws_image006.png
   :scale: 80%
.. |aws_image7| image:: /_static/aws_image007.png
   :scale: 80%
.. |aws_image8| image:: /_static/aws_image008.png
.. |aws_image9| image:: /_static/aws_image009.png
   :scale: 80%
.. |aws_image10| image:: /_static/aws_image010.png
   :scale: 80%   
