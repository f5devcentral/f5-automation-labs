.. |labmodule| replace:: 3
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Discover BIG-IP Devices
-----------------------------------------------------

In order for iWorkflow to interact with a BIG-IP device it must be
discovered by iWorkflow. The device discovery process leverages the
existing CMI Device Trust infrastructure on BIG-IP. Currently there is a
limitation that a single BIG-IP device can only be ‘discovered’ by ONE
of iWorkflow or BIG-IQ CM at a time. In this lab will we discover the
existing BIG-IP devices from your lab environment.

Task 1 - Discover BIG-IP Devices
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Expand the "Lab 2.2: Discover & License BIG-IP Devices" folder in the
   Postman collection

#. Open a Google Chrome window/tab to your iWorkflow device
   (https://10.1.1.6) and login with default credentials (admin/admin).
   You can use this window to monitor actions while they are being
   performed in Postman. Find the ‘Devices’ pane and make if viewable if
   it isn’t already.

#. Click the "Step 1: Discover BIGIP-A Device" item in the Postman
   collection. This will request will perform a POST to the
   ``/mgmt/shared/resolver/device-groups/cm-cloud-managed-devices/devices``
   worker to perform the device discovery process. Examine the JSON body
   so you understand what data is sent to perform the discovery process:

   |image51|

#. Click the ‘Send’ button. Examine the response and monitor the
   iWorkflow Chrome window you opened previously.

   |image52|

#. Copy the ‘uuid’ attribute for BIGIP-A and populate the
   ‘iwf\_bigip\_a\_uuid’ Postman environment variable with the
   value:

   |image53|
   |image54|

#. Click the "Step 2: Discover BIGIP-B Device" item in
   the collection.

#. Click the "Step 3: Get Discovered Devices" item in the collection.
   We will GET the devices collection and verify that both BIG-IP
   devices show a ‘state’ of ‘ACTIVE’:

   |image55|

.. |image51| image:: /_static/class1/image051.png
   :scale: 40%
.. |image52| image:: /_static/class1/image052.png
   :width: 5.21233in
   :height: 2.73647in
.. |image53| image:: /_static/class1/image053.png
   :scale: 40%
.. |image54| image:: /_static/class1/image054.png
   :scale: 40%
.. |image55| image:: /_static/class1/image055.png
   :scale: 40%
