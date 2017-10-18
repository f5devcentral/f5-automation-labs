.. |labmodule| replace:: 1
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Exploring the iControl REST API
-------------------------------------------------------------

Task 1 - Explore the API using the TMOS Web Interface
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this lab we will explore the API using an interface that is built-in
to TMOS. This utility is useful for understanding how TMOS objects map
to the REST API. The interfaces implement full Create, Read, Update and
Delete (CRUD) functionality, however, in most practical use cases it’s
far easier to use this interface as a ‘Read’ tool rather than trying to
Create objects directly from it. You can use TMUI or TMSH to create the 
object as needed and then use this tool to view the created object with 
all the correct attributes already populated.

.. NOTE:: This guide may require you to Copy/Paste information from the 
   guide to your jumphost.  To make this easier you can open a copy of the
   guide by using the **Lab Guide** bookmark in Chrome.

#. Open Google Chrome and navigate to the following bookmarks: **BIG-IP
   A GUI**, **BIG-IP B GUI** and **iWorkflow GUI**. Bypass any SSL errors that
   appear and ensure you see the login screen for each bookmark.

   .. WARNING:: Skipping this step will result in errors in subsequent steps

   |image1|

#. Navigate to the URL ``https://10.1.1.10/mgmt/toc`` (or click the BIG-IP A
   REST TOC bookmark). The ``/mgmt/toc`` path in the URL is available on
   all TMOS versions 11.6 or newer.

#. Authenticate to the interface using the default credentials (``admin/admin``)

#. You will now be presented with a top-level list of various REST
   resources. At the top of the page there is a search box
   |image2|\ that can be used to find items on the page. Type ``net`` in
   the search box and then click on the ‘net’ link under iControl REST
   Resources: 

   |image3|

#. Find the ``/mgmt/tm/net/route-domain`` **Collection** and click it.

#. You will now see a listing of the **Resources** that are part of the
   route-domain(s) collection. As you can see the default route domain
   of ``0`` is listed. You can also create new objects by clicking the
   |image4| button. Additionally resources can be deleted using the
   |image5| button or edited using the |image6| button.

#. Click the ``0`` resource to view the attributes of route-domain 0 on
   the device:

   |image7|

.. NOTE:: If you would like to learn more about the |icr| be sure to read 
   the **Demystifying iControl REST** article series at 
   https://devcentral.f5.com/wiki/icontrolrest.homepage.ashx

.. |image1| image:: /_static/class1/image001.png
   :scale: 75%
.. |image2| image:: /_static/class1/image002.png
.. |image3| image:: /_static/class1/image003.png
.. |image4| image:: /_static/class1/image004.png
.. |image5| image:: /_static/class1/image005.png
.. |image6| image:: /_static/class1/image006.png
.. |image7| image:: /_static/class1/image007.png
