.. |labmodule| replace:: 1
.. |labnum| replace:: 7
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab 1.7 – REST API Transactions
-------------------------------

Task 1 – Create a Transaction 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this lab we will create a transaction using the REST API.
Transactions are very useful in cases where you would want discreet REST
operations to act as a batch operation. As a result the nature of a
transaction is that either all the operations succeed or none of them
do. This is very useful when creating a configuration that is linked
together because it allows the roll back of operations in case one
fails.

Perform the following steps to complete this task:

#. Expand the ‘Lab 1.7 – Rest API Transactions’ folder in the Postman
   collection:

   |image35|

#. Click the ‘Step 1: Create a Transaction’ item. Examine the URL and
   JSON body. We will send a POST to the /mgmt/tm/transaction worker
   with an empty JSON body to create a new transaction.

   |image36|

#. Click the ‘Send’ button to send the request. Examine the response
   and find the ‘transId’ attribute. Save the value of this attribute
   in the ‘transaction\_id’ environment variable. Additionally notice
   that there are timeouts for both the submission of the transaction
   and how long it should take to execute. Be aware that after the
   'timeoutSeconds' value, this transId will be silently removed:

   |image37|
   |image38|

#. Click the ‘Step 2: Add to Transaction: Create a HTTP Monitor’ item
   in the Postman collection. This request is the same as a
   non-transaction enabled request in terms of the request type
   (POST), URI and JSON body. The difference is we add a
   ``X-F5-REST-Coordination-Id`` header with a value of the ``transId``
   attribute to add it to the transaction:
   
   |image39|

#. Click the ‘Send’ button and examine the response

#. Examine and click ‘Send’ on Steps 3-6 in the collection

#. Click ‘Step 7: View the Transaction’. Examine the request type and
   URI and click ‘Send’. This request allows you to see the current
   list of commands (ordered) that are in the transaction.

#. Click the ‘Step 8: Commit the Transaction’ item in the collection.
   Examine the request type, URI and JSON body. We will PATCH our
   transaction resource and change the value of the ‘state’ attribute
   to submit the transaction:
   |image40|

#. Click the ‘Send’ button and examine the response.

#. Verify the config was created using TMUI or REST requests.

.. |image35| image:: /_static/image035.png
   :width: 4.09062in
   :height: 2.93314in
.. |image36| image:: /_static/image036.png
   :width: 6.32362in
   :height: 3.01389in
.. |image37| image:: /_static/image037.png
   :width: 5.66944in
   :height: 2.55359in
.. |image38| image:: /_static/image038.png
   :width: 6.00612in
   :height: 5.55233in
.. |image39| image:: /_static/image039.png
   :width: 6.54134in
   :height: 2.54167in
.. |image40| image:: /_static/image040.png
   :width: 6.37328in
   :height: 2.45058in

:warning: When sending the Header ``X-F5-REST-Coordination-Id``, the
   system assumes you want to add an entry in the transaction
   queue. You MUST remove this header if you want to issue
   transaction queue changes (like deleting an entry from the
   queue, changing the order, commiting a transaction). if you
   don't remove the header in that specific case, the system 
   will send a 400 with the following type of error:
   "message": "Transaction XXXXX operation .... is not allowed
   to be added to transaction."
