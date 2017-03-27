.. |labmodule| replace:: 5
.. |labnum| replace:: 3
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – update\_pool.py
---------------------------------------------

In this lab we will review, line-by-line an example script that has been
created to allow updating any attribute of a pool using the
command-line. This script is a good example of creating generic tools
that enable many use cases. Rather than creating a script that just
updates a specific attribute we created one that updates ANY pool
attribute, greatly expanding it’s potential use cases.

Task 1 – Review update\_pool.py
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Open update\_pool.py in Notepad++

#. We will review the code. For brevity we have removed lines that are
   common with previous examples:

.. code:: python

   pool = mgmt.tm.ltm.pools.pool.load(partition=args.partition, name=args.pool_name)

   pp.pprint("Current: %s=%s" % (args.attribute, getattr(pool, args.attribute)))

These lines load the pool from the device and print the current
value of the attribute specified on the the command line. The
second line is a little bit tricky because the SDK dynamically
populates the objects attributes based on the type of object (pool,
virtual server, etc.). Normally we could just use something like
‘pool.loadBalancingMode’ to get the current lb-method for the pool,
however, since this script implements a way to change ANY attribute
in the object we have to dynamically substitute the attribute name
at run-time. To do this we use the getattr() python built-in
function to resolve the mapping at runtime and return the value of
the attribute specified on the command line.

.. code:: python

   kwargs = {args.attribute: args.value}

This line creates a new python dictionary with one entry specifying
a key-value pair using the command line arguments. For example if
you were updated the loadBalancingMode attribute to
‘least-connections-member’ the dictionary would look like
{“loadBalancingMode”:”least-connections-member”}

.. code:: python

   pool.update(**kwargs)

The first line updates the pool we loaded previously with the new
value for the attribute. The \*\*kwargs argument to the update()
method triggers a special mechanism in python called ‘keyword
unpacking’ which allows us to pass the attribute to be updated to the
update() method.

.. code:: python

   pool.refresh()
   pp.pprint("New: %s=%s" % (args.attribute, getattr(pool, args.attribute)))

The first line refreshes the data in the object from the BIG-IP
device. The second line prints this refreshed information to the 
console so the user can verify the update completed successfully.

Task 2 – Run update\_pool.py
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. In the command prompt type 
   ``python update_pool.py 10.1.1.4 test_pool loadBalancingMode least-connections-member``
   and examine the output:

   |image71|

#. You can manually verify the load balancing method was changed via
   TMUI or by re-running ``read_pool.py`` (it’s not required since the line
   that prints the new value forces a refresh() )

#. Experiment with changing other pool attributes

.. |image71| image:: /_static/image071.png
   :width: 6.41783in
   :height: 0.45024in
