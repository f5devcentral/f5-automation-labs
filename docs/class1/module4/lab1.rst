.. |labmodule| replace:: 4
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Install the f5-postman-workflows Framework
------------------------------------------------------------------------

In this lab you will walk through installing the f5-postman-workflows
framework into the Postman REST Client.

Task 1 - Import the f5-postman-workflows Postman Collection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In this task you will Import a Postman Collection that contains Installation
helpers, Examples and a automated Test Framework.  The collection is installed
from the f5-postman-workflows GitHub repository.

Perform the following steps to complete this task:

#. Open the Postman Client on your jumphost by clicking the |image8| icon.
#. Click the 'Import' button in the top left of the Postman window
#. Click the 'Import from Link' tab.  Paste the following URL into the
   text box and click 'Import'

   ``https://raw.githubusercontent.com/0xHiteshPatel/f5-postman-workflows/master/F5_Postman_Workflows.postman_collection.json``
#. You should now see a collection named 'F5 Postman Workflows' in your
   Postman Collections sidebar

Task 2 - Install f5-postman-workflows into your Postman Client
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To utilize the helper functions the framework include we must install those
functions into the Postman Client.  The installation helpers perform the
following tasks:

#. Determine the most current version of the framework
#. Dynamically minify the JavaScript code from the f5-postman-workflows
   GitHub repository using Google's Closure Compiler
#. Install the minified JS code into a Postman Global Variable
#. Set a number of Global variables that allow you to configure various
   options

To install the framework complete the following tasks:

#. Open the ``F5_Postman_Workflows`` collection
#. Open the ``Install`` folder
#. Select the ``Check f5-postman-workflows Version`` item and click 'Send'
#. Examine the 'Tests' portion of the **RESPONSE**:

   |image79|

#. Select the ``Install/Upgrade f5-postman-workflows`` item and click 'Send'
#. Examine the 'Tests' again and ensure that Installation was successful:

   |image80|

#. Click the 'Eye' button in the top right of the Postman window and examine
   the Global variables that have been populated

   |image81|

The f5-postman-workflows framework is now installed in your Postman client.

.. |image8| image:: /_static/image008.png
   :width: 0.46171in
   :height: 0.43269in

.. |image79| image:: /_static/image079.png
   :scale: 100%

.. |image80| image:: /_static/image080.png
   :scale: 100%

.. |image81| image:: /_static/image081.png
   :scale: 100%
