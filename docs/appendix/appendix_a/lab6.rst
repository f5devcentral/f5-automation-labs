.. |labmodule| replace:: A
.. |labnum| replace:: 6
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Create a Python Script
----------------------------------------------------

In this lab we will use the ‘Generate Code’ feature of Postman to create
a python script from a collection of requests.

Task 1 - Create a simple script
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. NOTE::
   Remember to have the correct environment selected in Postman

Perform the following steps to complete this task:

#. Expand the ‘Lab 5.6 - Create a Python Script’ folder in the Postman
   collection

#. Click the ‘Step 1 - Create a HTTP Monitor’ item in the collection

#. Click the ‘Code’ link in the Postman window:

   |lab-6-1|

#. Select Python -> Requests from the menu on the top right of the window:

   |lab-6-2|

#. Examine the Python code that was generated. Click the ‘Copy to
   Clipboard’ button

#. Open a new text file and paste the generated code. We need to
   modify the line that sends the request to DISABLE SSL certificate
   verification. Find the following line:

   .. code:: python

       response = requests.request("POST", url, data=payload, headers=headers)


   And add a verify=False option to it:

   .. code:: python

       response = requests.request("POST", url, data=payload, headers=headers, verify=False)

   **Save the file on your Desktop as lab5\_6.py**

#. Open a command prompt and run the script by typing
   ``python lab5_6.py``:

   |lab-6-3|

#. Verify the monitor was created on BIG-IP

#. **Delete the monitor to prepare for the next task**

Task 2 - Chain together multiple requests
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will repeat the process from Task 1 to chain together
multiple requests.

Perform the following steps:

#. Repeat the procedure from Task 1 with each of the items in the ‘Lab
   5.6’ postman collection. Append each snippet of code to your existing
   script until you have all 5 requests in the script. **You will need
   to remove the duplicate ‘import requests’ lines and update each
   request with the ‘verify=False’ option.**

#. Save the file

#. Run the script and verify the config was created.

.. |lab-6-1| image:: images/lab-6-1.png
   :width: 5.53944in
   :height: 2.76389in
.. |lab-6-2| image:: images/lab-6-2.png
   :width: 4.66783in
   :height: 3.98787in
.. |lab-6-3| image:: images/lab-6-3.png
   :width: 6.58611in
   :height: 1.36241in
