.. |labmodule| replace:: 3
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Deploy iApp services using the REST API
---------------------------------------------------------------------

Now that the App Services iApp is installed on your BIG-IP A we
can deploy a Service. The Service in this Lab will go through
different iterations, we'll start with a `Basic HTTP Service`, `Modify` this
Service's Node states and then `Delete` the whole Service. Once we've
seen the first `Mutation` of the Service we'll introduce some more complex
Services with iRule's, Custom Profiles, Certificates and an ASM Policy.

Task 1 - View iApps Installed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This lab work will be performed from the Lab 2.3 Postman Collection

Perform the following steps to complete this task:

#. Execute Step 1 to show Services Deployed on BIG-IP A

#. Execute Step 2 to Deploy the Basic HTTP Service on BIG-IP A

#. Execute Step 3 to Modify the Basic HTTP Service on BIG-IP A

#. Execute Step 4 to Delete the Basic HTTP Service on BIG-IP A

#. Execute Step 5 Deploy the HTTP Service with an iRule and Custom Profiles on BIG-IP A

#. Execute Step 6 Deploy the HTTPS Service on BIG-IP A

#. Execute Step 7 Deploy the HTTPS Service with an ASM Policy eon BIG-IP A
