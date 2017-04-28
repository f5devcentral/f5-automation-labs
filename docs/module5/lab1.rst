.. |labmodule| replace:: 5
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – create\_pool.py
---------------------------------------------

In this lab we will review, line-by-line an example script that has been
created to allow creation of a BIG-IP Pool with Pool Members directly
from the command line.

Task 1 – Review create\_pool.py
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Open Notepad++ using the |image66| located in the Windows Taskbar.

#. Double click the file ``create_pool.py`` in the menu on the left side
   of the Notepad++ screen

#. We will now review the code line-by-line:

.. code:: python

   from f5.bigip import ManagementRoot
   import pprint
   import argparse
   pp = pprint.PrettyPrinter(indent=3)

These lines import in various Python libraries. The first line
imports the F5 Python SDK. The pprint and argparse libraries are
standard Python libraries that aid in print data to the console and
parsing command line arguments.

.. code:: python

   parser = argparse.ArgumentParser(description='Script to create a pool on a BIG-IP device')
   parser.add_argument("host", help="The IP/Hostname of the BIG-IP device")
   parser.add_argument("pool_name", help="The name of the pool")
   parser.add_argument("pool_members", help="A comma seperated string in the format <IP>:<port>[,<IP>:<port>]")
   parser.add_argument("-P", "--partition", help="The partition name", default="Common")
   parser.add_argument("-u", "--username", help="The BIG-IP username", default="admin")
   parser.add_argument("-p", "--password", help="The BIG-IP password", default="admin")
   args = parser.parse_args()

These lines setup the command line arguments for the script and store
those arguments in a python dictionary names ‘args’. The argparse
library automatically generates help text, checks for required
arguments, sets defaults, etc.

.. code:: python

   mgmt = ManagementRoot(args.host, args.username, args.password)

This line creates a new Python object that refers to the BIG-IP
device. We are calling the ManagementRoot method with 3 arguments:

-  The value of the ``host`` argument

-  The value of the ``username`` argument

-  The value of the ``password`` argument

This method automatically performs a test to ensure that we are able
to reach the device and authenticate successfully.

.. code:: python

   pool_path = "/%s/%s" % (args.partition, args.pool_name)

This line just stores the human-readable path to the pool name for later
use

.. code:: python

   if mgmt.tm.ltm.pools.pool.exists(partition=args.partition, name=args.pool_name):
   raise Exception("Pool '%s' already exists" % args.pool_name)

This if statement checks to see if a pool with the same name already
exists on the specified partition on the device. The return value of the
exists() method is a Boolean value of True or False. In this case we
want the Exception to execute if a pool DOES exist and stop execution of
the script.

.. code:: python

   pool = mgmt.tm.ltm.pools.pool.create(partition=args.partition, name=args.pool_name)
   print "Created pool %s" % pool_path

The first line in this block actually creates the new pool. The
partition and name of the pool are specified as arguments to the
create() method and the ‘pool’ variable represents an object that holds
the created pool’s properties. The second line simply prints a message
that the pool has been created.

.. code:: python

   member_list = args.pool_members.split(',')

This line uses a built-in python method called split() to separate the
value of the command line argument into discrete strings using a ‘,’ as
a separator. The return type of the split() is a python list (lists =
arrays)

.. code:: python

   for member in member_list:
   pool_member = pool.members_s.members.create(partition=args.partition, name=member)
   print " Added member %s" % member

This for loop iterates over the elements in the list generated above and
creates a new member in the pool.

Task 2 – Run create\_pool.py
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Open Console2 using the |image67| icon on the Windows Taskbar

#. The console window automatically opens in the Desktop\\Module 3 –
   Python SDK directory

#. Type ``set PYTHONWARNINGS=ignore`` to disable the printing of SSL/TLS
   warnings about self-signed certificates.

#. Type ``python create_pool.py`` and examine the help output:

   |image68|

#. Type ``python create_pool.py 10.1.1.4 test_pool 10.1.10.100:80,10.1.10.101:80``
   to create a new pool:
   
   |image69|

#. Using Chrome open a tab to BIGIP-A (https://10.1.1.4). Examine the
   pool that was created.

.. |image66| image:: /_static/image066.png
   :width: 0.28045in
   :height: 0.24306in
.. |image67| image:: /_static/image067.png
   :width: 0.35694in
   :height: 0.30286in
.. |image68| image:: /_static/image068.png
   :width: 6.33450in
   :height: 0.81372in
.. |image69| image:: /_static/image069.png
   :width: 6.25116in
   :height: 0.51099in
