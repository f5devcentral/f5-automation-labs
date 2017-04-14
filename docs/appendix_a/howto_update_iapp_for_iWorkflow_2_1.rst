HOWTO - Converting existing iApp templates to work with iWorkflow v2.1 
----------------------------------------------------------------------

This howto document describes the minimal changes required to update an
existing iApp template and add a version number to the template name.

Adding the version number allows the iApp template to be used by 
iWorkflow v2.1 and later.  Versioning is required to enable iApp templates
to be installed across many BIG-IP devices in a production-safe manner.

Without version information it is possible that iApp templates could
be overwritten leading to deployment failures and/or outages.

Task 1 – Export the existing iApp from BIG-IP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
