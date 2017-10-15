.. |labmodule| replace:: A
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: read\_pool.py
-------------------------------------------

In this lab we will review, line-by-line an example script that has been
created to view the attributes of a BIG-IP Pool directly from the
command line.

Task 1 - Review read\_pool.py
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Open ``read_pool.py`` in Notepad++

#. We will review the code. For brevity we have removed lines that are
   common with previous examples:

.. code:: python

   if not mgmt.tm.ltm.pools.pool.exists(partition=args.partition, name=args.pool_name):
   raise Exception("Pool '%s' does not exist" % args.pool_name)

This if statement checks to see if a pool with the same name exists
in the specified partition on the device. The key difference between
this and the example in the previous lab is the inclusion of the
‘not’ keyword. This inverses the logic of the statement so that the
Exception is raised when the pool DOES NOT exist

.. code:: python

   pool = mgmt.tm.ltm.pools.pool.load(partition=args.partition, name=args.pool_name)

This line loads the configuration of the pool into a variable

.. code:: python

   print "Pool %s:" % pool_path
   pp.pprint(pool.raw)

These lines print the human-readable pool path and then uses the
PrettyPrint library to dump all the attributes associated with the
pool

Task 2 - Run read\_pool.py
~~~~~~~~~~~~~~~~~~~~~~~~~~

#. In the command prompt type ``python read_pool.py 10.1.1.4 test_pool``
   and examine the output:

   |image70|

#. Notice the various attributes that are associated with the pool. Take
   note of the value of the ``loadBalancingMode`` attribute for the next
   lab

.. |image70| image:: /_static/appendix_a/image070.png
   :width: 6.33450in
   :height: 4.50574in
