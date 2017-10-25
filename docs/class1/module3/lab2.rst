Lab 3.2: Create a Declarative Service Catalog
---------------------------------------------

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
         label = "Service Templates, Catalog and Deployments"
         onboarding [label="Basics",color="palegreen"]
         templates [label="Templates",color="steelblue1"]
         catalog [label="Catalog"]
         deployments [label="Deployments"]
         onboarding -> templates -> catalog -> deployments
      }
   }

In the introduction to this module we discussed the importance of using 
**Service Templates** to build a **Declarative Service Catalog**.  This
lab will show to create a few examples of **Service Templates** 
(Templates).  It's important to understand that while the packaged examples 
used in this lab are great starting points, you should use them as a starting 
point for creating your own **Service Catalog** that meets the requirements of 
your environment.

We will explore the first example in depth so you can gain an understanding
of how the templates are structured.  For the remaining templates you can 
just repeat the steps used with the first example.

The templates used in this lab all have a version number appended to the name
(Example: ``f5-http-lb-v1.0``).  It's important that this pattern is followed
in your environment.  Explicitly versioning the templates allows for migration
between template versions in a stable manner.  Without versioning any changes
to the template could result in *every* deployment associated with the template
being modified at the same time.  With versioning the application owner or F5
administrator can choose to either migrate all deployments at the same time OR
perform the migration on a per deployment manner.

Task 1 - Create the Service Templates
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task we will use the Runner to quickly create our sample Service 
Templates.
Perform the following steps to complete this task:

#. Click the :guilabel:`Runner` button at the top right of your Postman window.

#. Select :menuselection:`F5 Programmability: Class 1 --> 
   Lab 3.2 - Create a Declarative Service Catalog` folder.

#. Select the ``F5 Programmability: Class 1`` environment

#. Click the :guilabel:`Run Lab 3.2 - Crea...` button and wait for the run
   to complete.  Verify no errors were encountered.

#. Open the iWorkflow GUI in Chrome by navigating to ``https://10.1.1.12``

#. Expand the :guilabel:`Service Templates` panel and verify all the templates
   have been created:

   |image45|

Task 2 - Explore the f5-http-lb-v1.0 Template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Now that we've created our Templates lets one of them in depth.

Perform the following steps to complete this task:

#. Open the ``f5-http-lb-v1.0`` Template by double clicking it:

   |image46|

#. Lets examine the :guilabel:`Properties` pane.  

#. Select :guilabel:`All` in the :guilabel:`Displayed Parameters` section:

   |image47|

#. This pane shows detailed information about the Template such as:

   - iApp Template Name & Version the Service Template is using
   - The Connectors/Clouds that may use this template
   - A control that toggles which Parameters are displayed in the pane
   - The input Sections and Fields (collapsed in screeshot) for the iApp Template

   |image48|

#. In the :guilabel:`Sections` portion of the pane find the 
   :guilabel:`Virtual Server Listener & Pool Configuration` section.  Click the
   triangle to expand the section:

   |image49|

#. You can now see all the input fields associated with this section of the
   iApp template.  These fields are defined by the iApp Template itself.  In 
   the previous lab, when we installed the App Services iApp Template, iWorkflow
   created a internal representation of the input fields used in the iApp
   template.  iWorkflow then allows you to create a template that:

   - Define which fields are ``Tenant Editable``, therefore exposed to the 
     Tenant interface

   - Setting a default value for the field

     - If the field is NOT ``Tenant Editable`` the default value is sent 
       during a Service Deployment, however, the Tenant cannot see of modify
       the value

     - If the field is ``Tenant Editable`` the default value is populated
       for the Tenant and the Tenant may edit it during a Service Deployment

   |image50|

   In the case of the fields shown in the example:

   - ``pool__DefaultPoolIndex``: A value of ``0`` will be sent during a 
     deployment
   - ``pool__MemberDefaultPort``: Nothing will be sent
   - ``pool__addr``: Tenant will be allowed to populate the field with a value
   - ``pool__mask``: A value of ``255.255.255.255`` will be sent
   - ``pool__port``: Tenant will see ``80`` and can change the field

   By combining different combinations of **Default Values** and 
   ``Tenant Editable`` fields you can create many different types of templates
   to match your requirements.

   .. NOTE:: The App Services iApp Template has been specifically designed to 
      integrate with iWorkflow and Automation use cases.  While any iApp
      template that is properly versioned can be used with iWorkflow, you should
      consider whether the template was designed for Automation use cases or 
      not.  Many iApp templates were designed for a GUI or Wizard based
      interaction through the BIG-IP TMUI GUI.  As a result those templates may
      not present a good API interface.

#. In addition to simple text fields, iApp templates also support table based
   input.  The App Services iApp uses this capability to allow input of more 
   complex data such as Pools, Pool Members and Layer 7 Routing Policies.  
   iWorkflow allows you to have granular control over how the Tenant can
   interact with a table.  Let's find the ``pool__Pools`` table and click the
   triangle to expand it:

   .. NOTE:: To accomodate screen size this screenshot does not show all the 
      columns in the table.

   |image51|

   The highlighted sections in the image above correspond to the capabilities
   in the list below:

   - [1] Definition of the :guilabel:`Min` and :guilabel:`Max` number of rows in a 
     table

     - Example: Define a fixed number or limit for the number of Pools a Tenant 
       can deploy

   - [2] :guilabel:`Default Values` for each column in a table

     - Example: Define a default Load Balancing Method for deployed Pools

   - [3] :guilabel:`Tenant Editable` flag for each column in the table

     - Example: Only allow the Tenant to control the Load Balancing Method and
       Name of a Pool, while defaulting all other values.

   - [4] :guilabel:`Default Rows` that auto-populate a desired input for the Tenant.
     Each row can have a No Access, Read-Only or Write ACL applied.

     - Example: Define a Service that allows URL Based Content Routing to only
       two pools.  

       - Define 2 :guilabel:`Default Rows` in the Pools table
       - Set the :guilabel:`Min` & :guilabel:`Max` value to 2

#. Finally, to assist in designing a Tenant interface, iWorkflow allows you to
   preview what the Tenant UI would look like for a Service Template.  To view
   preview for click the :guilabel:`Tenant Preview` button:

   |image52|

#. The preview window shows how the Tenant UI would present the Service
   Template.  As you can see the interface is vastly simplified and only
   :guilabel:`Tenant Editable` fields are shown.  Because the true deployment
   details are filtered from the Tenant the Service Deployment requires much 
   less **Domain Specific Knowledge**.  Keep in mind that while the Tenant
   interface may be simple, you can leverage advanced functionality in the 
   Service Template.

   |image53|

Task 3 - Explore the Remaining Service Templates
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Using the pattern in the last task explore the other Service Templates that
were created earlier.  A description of each Service Template is included in 
the table below.  In all cases the Template has been configured with the 
appropriate Monitors, Profiles and Options for the use case.

.. list-table::
    :widths: 30 70
    :header-rows: 1
    :stub-columns: 1

    * - **Service Template**
      - **Description**
    * - ``f5-http-lb-v1.0``
      - HTTP Load Balancing to a Single Pool
    * - ``f5-https-offload-v1.0``
      - HTTPS Offload and Load Balancing to a Single Pool
    * - ``f5-fasthttp-lb-v1.0``
      - Performance-enhanced HTTP Load Balancing to a Single Pool
    * - ``f5-fastl4-udp-lb-v1.0``
      - Generic L4 TCP Load Balancing to a Single Pool
    * - ``f5-fastl4-udp-lb-v1.0``
      - Generic L4 UDP Load Balancing to a Single Pool
    * - ``f5-http-url-routing-lb-v1.0``
      - HTTP Load Balancing with URL Based Content Routing to Multiple Pools
    * - ``f5-https-waf-lb-v1.0``
      - HTTPS Offload, Web Application Firewall Protection and Load Balancing
        to a Single Pool 
    
.. |image45| image:: /_static/class1/image045.png
.. |image46| image:: /_static/class1/image046.png
   :scale: 80%
.. |image47| image:: /_static/class1/image047.png
.. |image48| image:: /_static/class1/image048.png
.. |image49| image:: /_static/class1/image049.png
.. |image50| image:: /_static/class1/image050.png
.. |image51| image:: /_static/class1/image051.png
   :scale: 80%
.. |image52| image:: /_static/class1/image052.png
.. |image53| image:: /_static/class1/image053.png
