.. |labmodule| replace:: A
.. |labnum| replace:: 5
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: delete\_pool.py
---------------------------------------------

In this lab we will review, line-by-line an example script that has been
created to allow deletion of a pool using the command-line.

Task 1 – Review delete\_pool.py
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Open ``delete_pool.py`` in Notepad++

#. We will review the code. For brevity we have removed lines that are
   common with previous examples:

.. code:: python

   pool = mgmt.tm.ltm.pools.pool.load(partition=args.partition, name=args.pool\_name)
   pool.delete()

   print "Deleted pool %s" % pool\_path

These lines should be fairly self-explanatory at this point. First we
load the pool and the we delete() it and print that we have done so.

Task 2 – Run delete\_pool.py
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. In the command prompt type
   ``python delete_pool.py 10.1.1.4 test_pool``
   and examine the output:

   |image72|

2. If desired verify the pool was deleted using TMUI or the
   ``read_pool.py`` script (it should return an error)

.. |image72| image:: /_static/image072.png
   :width: 6.41944in
   :height: 0.42326in
