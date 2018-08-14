Lab 4 - Declarative - Create VS, Pool and Members using App Services (AS3)
--------------------------------------------------------------------------

You will create a playbook to deploy VS, Pools and associated Members using App Services.

Task 1 - Create service playbook using AS3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Examine playbook ``service_4.yaml``.

   - Type ``nano playbooks/service_4.yaml``

   .. NOTE::

     This playbook uses **roles** which contain their own vars, files and tasks. Grouping content by roles allows easy sharing of playbooks with other users.  You may examine the files in roles/service_4 directory.

#. Run this playbook.

   - Type ``ansible-playbook playbooks/service_4.yaml -e @creds.yaml --ask-vault-pass``

#. Verify results in BIG-IP GUI.

#. From the BIG-IP GUI, select **Local Traffic->Virtual Servers** page.  There are no virtual servers listed in Common partition.  You will need to select ``Service4`` partition on the top right to view the ``serviceMain`` virtual service.

#. Select **serviceMain** then **Security->Polocies** and note the ``service_4_WAF`` created.

#. Run this playbook to teardown.

   - Type ``ansible-playbook playbooks/destroy_all_services.yaml -e @creds.yaml --ask-vault-pass``

#. Verify results in BIG-IP GUI.

.. NOTE::

  Roles are ways of automatically loading certain vars_files, tasks, and
  handlers based on a known file structure. Grouping content by roles also
  allows easy sharing of roles with other users.
  Additional info on use of roles can be seen at `this link`_.

  .. _this link: https://docs.ansible.com/ansible/2.5/user_guide/playbooks_reuse_roles.html
