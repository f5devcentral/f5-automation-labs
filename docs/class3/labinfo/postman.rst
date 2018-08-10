PreLab Configuration Steps:
------------------------------------------------------

Throughout this and other classes in the series we will make use of the Postman
REST API Client.  You can find more information about Postman at
https://getpostman.com

Task 1 - Import the Postman Collection & Environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task you will Import a Postman Collection & Environment for this lab.
Perform the following steps to complete this task:

#. Open the Postman tool by clicking the |postman-icon| icon of the desktop of
   your Jumphost.  **The initial window may take a few moments to appear.**

   .. NOTE:: The Postman client receives very frequent updates.  If you are
      prompted to update the client please click the :guilabel:`Remind me later`
      button to skip updating the version installed in your lab environment

#. By default, the Postman client requires verification of SSL/TLS Certificates
   to a public Root Certificate Authority.  However, by default, BIG-IP and many other
   devices use a self-signed certificate for SSL/TLS connections.  To allow
   connections with self-signed certificates we need to modify the default
   settings of Postman.

   - Open the Postman Settings windows by clicking :menuselection:`File --> Settings`:

     |lab-2-19|

   - Verify your client is configured to allow self-signed certificates by
     setting ``SSL certificate verification`` to ``OFF``

     |lab-2-20|

   - Click the **X** in the top right of the Settings window

#. A Postman Collection lets you group individual REST requests together.  This
   Postman collection can then be shared and imported. To import a Postman
   Collection, click the :guilabel:`Import` button in the top left of the Postman
   window

   |lab-2-17|

#. Click the :guilabel:`Import from Link` tab.  Paste the following URL into the
   text box and click :guilabel:`Import`

   .. parsed-literal::

      :raw_github_url:`/postman_collections/F5_SecDevOps.postman_collection.json`

   |lab-2-18|

#. You should now see a collection named **F5 SecDevOps**
   in your Postman Collections sidebar. Postman automatically resizes its GUI
   depending on its window size. It might be necessary to use the short
   ``Ctrl + \`` (on Windows) or click the show sidebar icon at the bottom left
   corner of postman if you do not see the sidebar.

   |lab-2-2|

#. To assist in multi-step procedures we make heavy use of the
   **Environments** capability in Postman. This capability allows us to
   set various global variables that are then substituted into a
   request before it’s sent. Import the Environment file by clicking
   :menuselection:`Import --> Import from Link` and pasting the following URL and
   clicking :guilabel:`Import`:

   .. parsed-literal::

      :raw_github_url:`/postman_collections/F5_SecDevOps.postman_environment.json`

#. Set your environment to
   **F5 SecDevOps** by using the menu at the top right
   of your Postman window:

   |postman-1|

.. toctree::
   :maxdepth: 2
   :glob:


.. |postman-icon| image:: /images/postman-icon.png
   :scale: 70%
.. |postman-1| image:: /class3/images/secdevops-env.png
.. |lab-2-2| image:: /class1/module1/images/lab-2-2.png
.. |lab-2-3| image:: /class1/module1/images/lab-2-3.png
   :scale: 80%
.. |lab-2-4| image:: /class1/module1/images/lab-2-4.png
   :scale: 80%
.. |lab-2-5| image:: /class1/module1/images/lab-2-5.png
.. |lab-2-6| image:: /class1/module1/images/lab-2-6.png
.. |lab-2-7| image:: /class1/module1/images/lab-2-7.png
.. |lab-2-8| image:: /class1/module1/images/lab-2-8.png
.. |lab-2-9| image:: /class1/module1/images/lab-2-9.png
.. |lab-2-10| image:: /class1/module1/images/lab-2-10.png
.. |lab-2-11| image:: /class1/module1/images/lab-2-11.png
.. |lab-2-12| image:: /class1/module1/images/lab-2-12.png
.. |lab-2-13| image:: /class1/module1/images/lab-2-13.png
.. |lab-2-14| image:: /class1/module1/images/lab-2-14.png
.. |lab-2-15| image:: /class1/module1/images/lab-2-15.png
.. |lab-2-16| image:: /class1/module1/images/lab-2-16.png
.. |lab-2-17| image:: /class1/module1/images/lab-2-17.png
.. |lab-2-18| image:: /class1/module1/images/lab-2-18.png
.. |lab-2-19| image:: /class1/module1/images/lab-2-19.png
.. |lab-2-20| image:: /class1/module1/images/lab-2-20.png
.. |lab-2-21| image:: /class1/module1/images/lab-2-21.png
.. |lab-2-22| image:: /class1/module1/images/lab-2-22.png
.. |lab-2-23| image:: /class1/module1/images/lab-2-23.png
.. |lab-2-24| image:: /class1/module1/images/lab-2-24.png
