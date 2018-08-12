Lab 3 - Adding Pool Members to a Pool
-------------------------------------

Task 1 - Assign Pool Members to a Pool
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You will select a node which you will assign to a pool ``app1_pl``.  Use the
``bigip_pool_member`` module.

#. Create a playbook ``member.yaml``.

   - Type ``nano playbooks/member.yaml``

   - Type the following into the ``playbooks/member.yaml`` file.

     .. image:: images/image016.png
        :height: 500px

   - :guilabel:`Ctrl-x` to save file.

#. Run this playbook.

   - Type ``ansible-playbook playbooks/member.yaml``

     If successful, you should see similar results

     .. image:: images/image017.png
        :height: 200px

#. Verify BIG-IP results.

   - Select **Local Traffic -> Pools -> app1_p1 -> Members**

     .. image:: images/image018.png
        :height: 180px

#. Add another pool member to pool ``app1_pl``.

   - Type ``nano playbooks/member.yaml``
   - Add node ``10.1.20.12`` as shown in the image below.

     .. image:: images/image019.png
        :height: 100px

   - :guilabel:`Ctrl-x` to save file.

#. Run this playbook.

   - Type ``ansible-playbook playbooks/member.yaml``

     If successful, you should see similar results

     .. image:: images/image020.png
        :height: 200px

#. Verify BIG-IP results.

   .. NOTE::

      The ``bigip_pool_member`` module can configure pools with the details of
      existing nodes. A node that has been placed in a pool is referred to as
      a “pool member”.

      At a minimum, the ``name`` is required. Additionally, the ``host`` is required
      when creating new pool members.

      The module has several more options, all of which can be seen at `this link`_.

      .. _this link: https://docs.ansible.com/ansible/latest/modules/bigip_pool_member_module.html
