:orphan:

.. _udf-lab-environment-guide:

UDF Lab Environment Guide
=========================

Determine how to start your deployment:

- **Official Events (ISC, SSE Summits):**  Please follow the
  instructions given by your instructor to join the UDF Course.

- **Self-Paced/On You Own:** Login to UDF, 
  :guilabel:`Deploy` the ``Intro to Automation & Orchestion``
  Blueprint and :guilabel:`Start` it.

Connecting to the Environment
-----------------------------

The lab environment provides to methods of access to the Jumphost:

- RDP Connection using an RDP Client
- HTML5 Browser based VNC Connection using noVNC

  - Chrome
  - Firefox
  - Safari
  - EDGE

Connect using RDP
^^^^^^^^^^^^^^^^^

#. In the UDF navigate to your :guilabel:`Deployments`

#. Click the :guilabel:`Details` button for your Deployment

#. Click the :guilabel:`Components` tab

#. Find the ``Linux Jumphost`` Component and click the the :guilabel:`Access` 
   button.  Then click the :guilabel:`RDP` option.  An RDP file will be 
   downloaded to your system.  

   .. NOTE:: The RDP file opens the session in Full Screen mode by default.
      You may want to open the file in an RDP client and adjust these settings
      as needed to match your preference.

#. If you have the official Microsoft Remote Desktop Client installed please
   install it using the instructions at 
   https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-clients

   
#. .. WARNING:: If you have a HiDPI display please refer to the :ref:`lab-udf-hidpi`
      instructions below

#. Open the RDP file in the Remote Desktop Client and connect.  If you have 
   any problems please ask your instructor for help
   

#. Enjoy the class!

Connect using an HTML5 Browser
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. In the UDF navigate to your :guilabel:`Deployments`

#. Click the :guilabel:`Details` button for your Deployment

#. Click the :guilabel:`Components` tab

#. Find the ``Linux Jumphost`` Component and click the the :guilabel:`Access` 
   button.  Then click the :guilabel:`NOVNC` option.  A new browser window/tab
   will be opened.  

#. In the new browser window/tab click the :guilabel:`Connect` button followed
   by the :guilabel:`Send Password` button.  You should now be connected.  If 
   you have any problems please ask your instructor for help

#. Enjoy the class!

.. _lab-udf-hidpi:

Using HiDPI Displays (RDP & Windows)
------------------------------------

.. WARNING:: Do these steps BEFORE you connect via RDP.  Choose ONE.  
   Do not do both.

If you are using a Hi Resolution Display on Windows we recommend that you either:

- **RECOMMENDED:** Resize your display to 1080p (1920 x 1080) 
- Use your RDP clients "Zoom" funcitonality to increase the size
 
Resize your display (Windows 10) - RECOMMENDED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Right click on your Desktop and select Display Settings.

   |display-settings|

#. Click on :guilabel:`Advanced Display Settings`

   |advanced-display-settings|

#. Change the Resolution to ``1920 x 1080`` and click the :guilabel:`Apply` 
   button

   |apply-resolution|

#. Connect to the RDP session and enjoy the class!

Use RDP Zoom
^^^^^^^^^^^^

#. Right click on the RDP file and click on :guilabel:`Edit`

   |edit-rdp|

#. Under the :guilabel:`Display` tab change the resolution to 
   ``1920x1080``, then click :guilabel:`Connect`

   |rdp-resolution|

#. After you connect, access the menu at the top left of your RDP Window and
   change the Zoom level (i.e. 175%).

   |rdp-zoom|

#. Enjoy the class!

.. |display-settings| image:: /_static/display-settings.png
   :scale: 75%
   
.. |advanced-display-settings| image:: /_static/advanced-display-settings.png
   :scale: 75%   
   
.. |apply-resolution| image:: /_static/apply-resolution.png
   :scale: 75%  

.. |edit-rdp| image:: /_static/edit-rdp.png
   :scale: 75%   
   
.. |rdp-resolution| image:: /_static/rdp-resolution.png
   :scale: 75%   

.. |rdp-zoom| image:: /_static/rdp-zoom.png
   :scale: 75%     