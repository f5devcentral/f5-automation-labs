.. |labmodule| replace:: 2
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Deploying iApp templates on BIG-IP
----------------------------------------------------------------

iApps typically come in the form of a .tmpl file, the contents of the file is
what represents the iApp on the BIG-IP, iApps can come with a presentation pane,
or without. Different toolkits will upload the file or its contents in different
manors, we'll be using REST in its raw form so the contents of the file is all
we need, though this means that the contents of the iApp must be URL encoded to
make sure the BIG-IP reads it correctly. Using other tools like Ansible, the
whole .tmpl file can be uploaded removing the need for encoding.

..NOTE:: This lab work will be performed from the Lab 2.2 Postman Collection

|image2_7|

Task 1 - View iApps Installed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Execute Step 1 to view installed iApp's on the BIG-IP

|image2_3|

Review the JSON response, in this task we have requested a list of installed
iApps from the BIG-IP, there are currently some default iApps installed which
come pre-installed on the BIG-IP.

|image2_4|

Task 2 - Install the App Services Integration iApp
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Execute Step 2 to install the App Services Integration iApp

|image2_5|

Review the JSON Body that was sent, and the JSON Body that responded,
in this task we installed an iApp with an encoded method and the BIG-IP
sent back a response that the iApp was installed with its name.

.. |image2_3| image:: /_static/class1/image2_3.png
.. |image2_4| image:: /_static/class1/image2_4.png
.. |image2_5| image:: /_static/class1/image2_5.png
.. |image2_6| image:: /_static/class1/image2_6.png
.. |image2_7| image:: /_static/class1/image2_7.png
