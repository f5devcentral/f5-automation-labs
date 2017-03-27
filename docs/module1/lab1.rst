.. |labmodule| replace:: 1
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Exploring the iControl REST API 
-------------------------------------------------------------

Task 1 – Explore the API using the TMOS Web Interface
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this lab we will explore the API using an interface that is built-in
to TMOS. This utility is useful for understanding how TMOS objects map
to the REST API. The interfaces implement full Create, Read, Update and
Delete (CRUD) functionality, however, in most practical use cases it’s
far easier to use this interface as a ‘Read’ tool rather than trying to
Create objects directly from it. It’s usually far easier to use TMUI or
TMSH to create the object as needed and then use this tool to view the
created object with all the correct attributes already populated.

#. Open Google Chrome and navigate to the following bookmarks: BIG-IP
   A GUI, BIG-IP B GUI and iWorkflow GUI. Bypass any SSL errors that
   appear and ensure you see the login screen for each bookmark.

   |image1|

#. Navigate to the URL https://10.1.1.4/mgmt/toc (or click the BIG-IP A
   REST TOC bookmark). The ‘/mgmt/toc’ path in the URL is available on
   all TMOS versions 11.6 or newer.

#. Authenticate to the interface using the default admin/admin
   credentials.

#. You will now be presented with a top-level list of various REST
   resources. At the top of the page there is a search box
   |image2|\ that can be used to find items on the page. Type ‘net’ in
   the search box and then click on the ‘net’ link under iControl REST
   Resources: |image3|

#. Find the ``/mgmt/tm/net/route-domain`` **Collection** and click it.

#. You will now see a listing of the **Resources** that are part of the
   route-domain(s) collection. As you can see the default route domain
   of ‘0’ is listed. You can also create new objects by clicking the
   |image4| button. Additionally resources can be deleted using the
   |image5| button or edited using the |image6| button.

#. Click the ‘0’ resource to view the attributes of route-domain 0 on
   the device:

   |image7|

   Take note of the full path to the resource. Here is how the path is
   broken down:

   .. code::

       / mgmt / tm / net / route-domain / ~Common~0
       | Root | OC | OC  |  Collection  | Resource
       *OC=Organizing Collection

.. |image1| image:: /_static/image001.png
   :width: 6.60194in
   :height: 0.88663in
.. |image2| image:: /_static/image002.png
   :width: 0.90641in
   :height: 0.17669in
.. |image3| image:: /_static/image003.png
   :width: 2.18322in
   :height: 1.47308in
.. |image4| image:: /_static/image004.png
   :width: 0.15128in
   :height: 0.19101in
.. |image5| image:: /_static/image005.png
   :width: 0.13846in
   :height: 0.15462in
.. |image6| image:: /_static/image006.png
   :width: 0.21928in
   :height: 0.20782in
.. |image7| image:: /_static/image007.png
   :width: 6.32968in
   :height: 2.38889in
