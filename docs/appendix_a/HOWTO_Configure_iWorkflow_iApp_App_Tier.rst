.. _APL: https://devcentral.f5.com/wiki/iApp.APL.ashx

HOWTO - Configure Application Tier for Service Templates in iWorkflow 2.1
-------------------------------------------------------------------------

This HOWTO document describes how to configure Application Tier Information
for iApp templates in iWorkflow 2.1.

.. NOTE: Some iApp templates already include this information as part of the
   template.

iWorkflow uses the Application Tier Information to determine how specific
important fields are mapped into an iApp template.  Since the API interface
for an iApp template is customizable via APL_, this  step must be completed so
iWorkflow can correctly track important fields in the template.

iWorkflow currently supports mapping for the following fields:

.. list-table::
    :widths: 40 20 40
    :header-rows: 1
    :stub-columns: 1

    * - **iWorkflow Field Name**
      - **Required**
      - **iApp Template Field**
    * - Virtual Address
      - Yes
      - Virtual Server IP Address
    * - Virtual Port
      - Yes
      - Virtual Server Layer 4 Port
    * - Pool
      - Yes
      - Pool Table
    * - Server Address
      - Yes
      - Pool Member/Server IP Address
    * - Server Port
      - Yes
      - Pool Member/Server Layer 4 Port
    * - SSL Cert
      - No
      - SSL/TLS Certificate
    * - SSL Key
      - No
      - SSL/TLS Key

Task 1 – Configure App Tier Info for the f5.http iApp template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The iApp template can be exported from a BIG-IP system where it has
been installed.  The file has a ``.tmpl`` extension and is a plaintext,
readable format.

Complete the following steps:

#. Login to the BIG-IP GUI with admin credentials
#. Click iApps -> Templates
#. Find the desired template in the list and click the template name
   to open it
#. Scroll to the bottom of the page and click the 'Export' button
#. Click the ``Download: ...`` button and save the file to your computer

Task 2 - Edit the Exported template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We will now edit the template name to add a version number.  iWorkflow
currently supports the following formats:

- ``template_name_v1.0_0``
- ``template_name.v.1.0.0``
- ``/<partition>/template_name.v1.0.0``

Complete the following steps:

#. Open the previously saved ``.tmpl`` file in a text editor
#. Perform a text search for ``sys application template``

   Example:

   .. code-block:: tcl
      :linenos:
      :emphasize-lines: 5

      cli admin-partitions {
          update-partition Common
      }

      sys application template my_template_name {
          actions {
              definition {
                  implementation {
#. Modify the template name to include a version number using one of the
   formats specified at the beginning of this task.

   Example:

   .. code-block:: tcl
      :linenos:
      :emphasize-lines: 5

      cli admin-partitions {
          update-partition Common
      }

      sys application template my_template_name.v1.0.0 {
          actions {
              definition {
                  implementation {
#. Save the file

Task 3 - Import the iApp template to iWorkflow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The updated iApp template is now ready to be imported to iWorkflow.
Instructions on how to do this can be found at:

https://devcentral.f5.com/wiki/iWorkflow.iWorkflowOpsGuide_7.ashx
