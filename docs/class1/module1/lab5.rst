Lab 1.5: Building Imperative Workflows with Postman Collections
---------------------------------------------------------------

.. graphviz::

   digraph breadcrumb {
      rankdir="LR"
      ranksep=.4
      node [fontsize=10,style="rounded,filled",shape=box,color=gray72,margin="0.05,0.05",height=0.1] 
      fontname = "arial-bold" 
      fontsize = 10
      labeljust="l"
      subgraph cluster_provider {
         style = "rounded,filled"
         color = lightgrey
         height = .75
         label = "BIG-IP"
         basics [label="REST Basics",color="palegreen"]
         authentication [label="Authentication",color="palegreen"]
         globalsettings [label="Global Settings",color="palegreen"]
         networking [label="Networking",color="palegreen"]
         clustering [label="Clustering"]
         transactions [label="Transactions"]
         basics -> authentication -> globalsettings -> networking -> clustering -> transactions
      }
   }
   
As you have seen in the previous lab's we can use the Collections and Folders
features of the Postman client to group REST requests logically.  Additionally,
as you've seen most of the examples so far have consisted of executing a
sequence of REST request to achieve some outcome.

In this lab, we will use a feature in Postman called the **Collection Runner
(Runner)** to execute a sequence of REST requests.  Using the Runner we can
rapidly prototype REST requests into an **Imperative Workflow** that can be
executed without user intervention.

The purpose of this exercise is to provide an example of how new workflows can
be built from scratch or existing workflows can be modified.

Additionally, we will use some Postman Javascript Tests to programmatically
populate environment variables with the output of our workflow.

Task 1 - Open and Run a Collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. The collection we will run in this task will populate some environment
   variables with various data about the BIG-IP system.  First, let's examine
   the Environment Variables that are currently set.  Click the |image99|\ icon
   in the top right of the Postman window.  Notice that there are no variables
   starting with the name ``lab1.5_``:

   |image98|

#. Click the ``Lab 1.5 - Building Imperative Workflows`` folder to expand it

#. Click the ``Step 1: Get BIG-IP Software Version`` request.  Click the
   :guilabel:`Tests` tab and examine the Javascript code and comments:

   |image100|

   The Javascript code in the Test script will populate an environment variable
   based on the response from the BIG-IP system.

#. Click the :guilabel:`Runner` button at the top right of your Postman window:

   |image97|

#. Select the ``F5 Programmability: Class 1`` Collection then the
   ``Lab 1.5 - Building Imperative Workflows`` folder.  Next, be sure the
   environment is set to ``F5 Programmability: Class 1``:

   |image101|

   Your Runner window should look like:

   |image102|

#. Click the :guilabel:`Run Lab 1.5 - Buil...` button

#. The results window will now populate.  You will see each request in the
   folder is sent and its associated test results are displayed on the screen.
   The last request in the folder includes some Javascript code to dump the
   results to the screen:

   |image103|

#. Next, switch back to the main Postman window.  Click the |image99|\ button
   again and examine the environment variables.  Notice that three new variables
   starting with the name ``lab1.5_`` have been populated:

   |image104|

.. NOTE:: It is normal for the values of Software Version, CPU Count and Base 
   MAC Address to be different from the screenshot(s).  

In this lab, we demonstrated running a simple Imperative Workflow using the
Postman Collection Runner.  In subsequent labs, we will expand on this simple
use case to perform more complex functions.  As you continue through the labs,
be sure to take time to explore the details of the requests being sent.  The
Postman Collection used in this class can also serve as a starting point for
building your own collections or modifying existing ones.

As we move through the rest of this module you will see the complexity involved
in building Imperative Workflows.  While these types of workflows are incredibly
powerful, they are also time-consuming to build from scratch.  As we move into
Module 2 you will see the importance of leveraging **Abstraction**
and **Declarative Interfaces** to minimize the amount of time spent on building
Imperative Workflows.

.. |image97| image:: /_static/class1/image097.png
.. |image98| image:: /_static/class1/image098.png
.. |image99| image:: /_static/class1/image099.png
.. |image100| image:: /_static/class1/image100.png
.. |image101| image:: /_static/class1/image101.png
.. |image102| image:: /_static/class1/image102.png
.. |image103| image:: /_static/class1/image103.png
   :scale: 65%
.. |image104| image:: /_static/class1/image104.png
