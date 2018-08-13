Lab 4 - Declarative - Create VS, Pool and Members using App Services (AS3)
--------------------------------------------------------------------------

You will create a playbook to deploy VS, Pools and associated Members using App Services.

Task 1 - Create service playbook using AS3
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Examine playbook ``service_4.yaml``.

#. Run this playbook.

   - Type ``ansible-playbook playbooks/service_4.yaml -e @creds.yaml --ask-vault-pass``

#. Verify results in BIG-IP GUI.
#. Run this playbook to teardown.

   - Type ``ansible-playbook playbooks/destroy_all_services.yaml -e @creds.yaml --ask-vault-pass``

#. Verify results in BIG-IP GUI.

.. NOTE::

  Roles are ways of automatically loading certain vars_files, tasks, and
  handlers based on a known file structure. Grouping content by roles also
  allows easy sharing of roles with other users.
  Additional info on use of roles can be seen at `this link`_.

  .. _this link: https://docs.ansible.com/ansible/2.5/user_guide/playbooks_reuse_roles.html
