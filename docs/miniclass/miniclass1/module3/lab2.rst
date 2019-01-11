Lab 2 - Imperative - Create VS, Pool and Members using seed file
----------------------------------------------------------------

You will create a consolidated playbook to deploy VS, Pools and associated Members.

Task 1 - Create consolidated playbook
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Create a playbook ``appseed.yaml``.

   - Type ``nano playbooks/app.yaml``
   - Type the following into the ``playbooks/appseed.yaml`` file.

     .. code::

        ---

        - name: "Imperative: Deploy / teardown a web app (VS, pool, nodes)"
          hosts: bigips
          gather_facts: False
          connection: local
          vars_files:
            - ../vars/appseedinfo.yaml

        vars:
          state: "present"

        environment: "{{ bigip_env }}"

        tasks:
          - name: Adjust virtual server
            bigip_virtual_server:
              name: "{{ vs_name }}"
              destination: "{{ vs_ip }}"
              port: "{{ vs_port }}"
              snat: "{{ vs_snat }}"
              all_profiles:
                - "tcp-lan-optimized"
                - "http"
                - "analytics"
              state: "{{ state }}"

          - name: Adjust a pool
            bigip_pool:
              name: "{{ pl_name }}"
              monitors: "{{ pl_monitor }}"
              lb_method: "{{ pl_lb }}"
              state: "{{ state }}"

          - name: Add nodes
            bigip_node:
              name: "{{ item.name }}"
              host: "{{ item.host }}"
              state: "{{ state }}"
            loop:
              - { name: "{{ nd_ip1 }}", host: "{{ nd_ip1 }}" }
              - { name: "{{ nd_ip2 }}", host: "{{ nd_ip2 }}" }

          - name: Add nodes to pool
            bigip_pool_member:
              host: "{{ item.host }}"
              port: "{{ nd_port }}"
              pool: "{{ pl_name }}"
              state: "{{ state }}"
            loop:
              - { host: "{{ nd_ip1 }}" }
              - { host: "{{ nd_ip2 }}" }
            when: state == "present"

          - name: Update a VS
            bigip_virtual_server:
              name: "{{ vs_name }}"
              pool: "{{ pl_name }}"
              state: "{{ state }}"
            when: state == "present"

   - :guilabel:`Ctrl-x` to save file.

#. Run this playbook.

   - Type ``ansible-playbook -e @creds.yaml --ask-vault-pass playbooks/appseed.yaml``

#. Verify results in BIG-IP GUI.

   .. HINT:: You should see app3_vs deployed with 2 pool members.  App should
      be accessible on http://10.1.10.30.

#. Run this playbook to teardown app.

   - Type ``ansible-playbook -e @creds.yaml --ask-vault-pass playbooks/appseed.yaml -e state="absent"``

#. Verify that app3_vs, pool and nodes should be deleted in BIG-IP GUI.

   .. NOTE:: This playbook leverages a config seed file in
      ``vars/appseedinfo.yaml``.  Simply modify this file to deploy a new
      service.
