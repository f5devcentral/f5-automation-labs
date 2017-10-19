.. |labmodule| replace:: 1
.. |labnum| replace:: 7
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Build a Basic LTM Config using REST Transactions
------------------------------------------------------------------------------

.. TODO:: Text below was cut/paste from old lab 1.6


-  Object types and their attributes

   -  How many different objects/profiles/options do we have?

-  Order of operations

   -  Monitor before pool before profiles before virtual servers, etc.

   -  What about L7 use cases like WAF?

      -  WAF Policy -> HTTP Policy -> Virtual Server

-  How does this all get deleted?

   -  You have to reverse the order of operations and ‘undo’ the whole
      config

      -  TMOS has lots of issues here

As a result of this it’s recommended for customers to use Imperative
automation only for legacy environments. New environments should shift
to a Declarative model.

Task 1 - Build a Basic LTM Config
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Expand the "Lab 1.6 - Build a Basic LTM Config" folder in the Postman
   collection

#. Click each Step in the folder and ‘Send’ the request. Verify each
   component is created on the BIG-IP device using the GUI.

#. After the steps are completed you should be able to connect to
   http://10.1.20.129 in your browser.


.. TODO:: Text above was cut/paste from old lab 1.6

Task 1 - Create a Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this lab we will build a basic LTM Config using |icr| Transactions.
Transactions are very useful in cases where you would want discrete REST
operations to act as a batch operation. As a result the nature of a
transaction is that either all the operations succeed or none of them
do. This is very useful when creating a configuration that is linked
together because it allows the roll back of operations in case one
fails.  All the commands issued are queued one after the other in the 
transaction. We will also review how to change the order of a queued 
command or remove a single command from the queued list before commiting.

.. NOTE:: Transactions are essential to ensure that an Imperative process is 
   **Atomic** in nature. 

.. WARNING:: Transactions have a default timeout of 120 seconds.  Taking 
   longer then the timeout to execute the transaction will result in its 
   automatic deletion.  To avoid having to redo the steps in this task
   please read the steps below first and then execute each one in a timely
   manner.

Perform the following steps to complete this task:

#. Expand the ``Lab 1.7 - Rest API Transactions`` folder in the Postman
   collection:

   |image35|

#. Click the ``Step 1: Create a Transaction`` item. Examine the URL and
   JSON body. We will send a ``POST`` to the ``/mgmt/tm/transaction`` endpoint
   with an empty JSON body to create a new transaction.

   |image36|

#. Click the :guilabel:`Send` button to send the request. Examine the response
   and find the ``transId`` attribute.  Additionally notice that there are 
   timeouts for both the submission of the transaction and how long it should 
   take to execute. Be aware that after the ``timeoutSeconds`` value, this 
   ``transId`` will be silently removed:

   |image37|

   The ``transId`` value has been automatically populated for you in the 
   ``bigip_transaction_id`` environment variable:

   |image38|

#. Click the ``Step 2: Add to Transaction: Create a HTTP Monitor`` item
   in the Postman collection. This request is the same as a
   non-transaction enabled request in terms of the ``POST`` request method, URI 
   and JSON body. The difference is we add a ``X-F5-REST-Coordination-Id`` 
   header with a value of the ``transId`` attribute to add it to the 
   transaction:

   |image39|

#. Click the :guilabel:`Send` button and examine the response

#. Examine and click :guilabel:`Send` on **Steps 3-6** in the folder

#. Click ``Step 7: View the Transaction Queue``. Examine the request type and
   URI and click :guilabel:`Send`. This request allows you to see the current
   list of ordered commands in the transaction.

Task 2 - Modify a Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Click the ``Step 8: View Queued Command 4 from Transaction`` item in the
   folder. Examine the request method and URI. We will ``GET`` command number 
   **4** from the transaction queue.

   |image76|

#. Click the ``Step 9: Change Eval Order 4 -> 1`` item in the folder.
   Examine the request method, URI and JSON body. We will PATCH our
   transaction resource and change the value of the ``evalOrder`` attribute
   from ``4`` to ``1`` to move at the first position of the transaction queue:

   .. NOTE:: Requests in the ordered transaction queue must obey the order of
      operations present in the underlying BIG-IP system.

   .. WARNING:: When sending the Header ``X-F5-REST-Coordination-Id``, the
      system assumes you want to **ADD** an entry in the transaction
      queue. You **MUST** remove this header if you want to issue
      transaction queue changes (like deleting an entry from the
      queue, changing the order, commiting a transaction). If you
      don't remove the header, the system will respond with a ``400``
      HTTP error code with the following error text:

      ``"message": "Transaction XXXXX operation .... is not allowed
      to be added to transaction."``      

   |image77|

#. Click the ``Step 10: View the Transaction Queue Changes`` item in the
   folder. Verify that request number ``4`` has moved into position ``1``
   and the order of all other requests has been updated accordingly.

Task 3 - Commit a Transaction
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Click the ``Step 11: Commit the Transaction`` item in the folder.
   Examine the request type, URI and JSON body. We will ``PATCH`` our
   transaction resource and change the value of the ``state`` attribute
   to submit the transaction:

   |image40|

#. Click the :guilabel:`Send` button and examine the response.  The ``state``
   may already be ``COMPLETED``, however, it's good practice to explicitly
   check for this.

#. Click the ``Step 12: View the Transaction Status`` item in the folder and
   click the :guilabel:`Send` button.  Verify that the ``state`` of the 
   transaction is ``COMPLETED``

#. You can verify the configuration was created on the BIG-IP device via the
   BIG-IP A GUI at ``https://10.1.1.10``

#. Verify the virtual server works by opening ``http://10.1.20.120`` in the
   Chrome web browser

.. |image35| image:: /_static/class1/image035.png
.. |image36| image:: /_static/class1/image036.png
.. |image37| image:: /_static/class1/image037.png
.. |image38| image:: /_static/class1/image038.png
.. |image39| image:: /_static/class1/image039.png
.. |image40| image:: /_static/class1/image040.png
.. |image76| image:: /_static/class1/image076.png
.. |image77| image:: /_static/class1/image077.png

