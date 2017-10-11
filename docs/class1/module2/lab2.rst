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

Task 1 - View iApps Installed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This lab work will be performed from the Lab 2.2 Postman Collection

Perform the following steps to complete this task:

#. Execute Step 1 to show the installed iApps on BIG-IP A

#. Execute Step 2 to install the App Services Integration iApp
