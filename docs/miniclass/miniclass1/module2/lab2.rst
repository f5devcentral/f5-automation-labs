Lab 2 - Securing and Passing Credentials
----------------------------------------

You need to store passwords for use in Ansible.  Use ``ansible-vault``.
The `ansible-vault` command has three subcommands that are frequently used.

* create
* edit

Task 1 - Create Vault for Credentials
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Create a vault ``creds.yaml``.

   - Type ``ansible-vault create creds.yaml``

     Use ``create`` to create the initial files that will be vault encrypted.
     Vault will prompt you for a password. For the purposes of this lab enter
     ``password`` . It will then open up a text editor (vi)
     for you to write data to it. Data of any form can be written, but text is
     usually the format that is used.

   - Type ``i`` then enter the following in the editor.

     .. code::

        bigip_user: "admin"
        bigip_pass: "admin"

      Type ``esc key`` then ``:wq`` to save and quit the editor, the file will
      automatically be encrypted for you.

   - Type ``cat creds.yaml`` to ensure file is encrypted.

     If successful, you should see similar results

     .. image:: images/image024.png
        :height: 140px

#. Copy ``playbooks/cmd.yaml`` to ``playbooks/cmd1.yaml`` and modify.

   - Type ``cp playbooks/cmd.yaml playbooks/cmd1.yaml``
   - Type ``nano playbooks/cmd1.yaml``

     .. code:: yaml

        ---

        - name: "Run a tmsh command"
          hosts: bigips
          gather_facts: False
          connection: local

          vars:
            validate_certs: no
            server: 10.1.1.245
            username: "{{ bigip_user }}"
            password: "{{ bigip_pass }}"

          tasks:
            - name: View system version and LTM configuration
              bigip_command:
                commands:
                  - list /ltm virtual all
                  - list /ltm pool all
                  - list /ltm node all
                server: "{{ server }}"
                password: "{{ password }}"
                user: "{{ username }}"
                validate_certs: "{{ validate_certs }}"
              register: result

            - debug: msg="{{ result.stdout_lines }}"

#. Run this playbook.

   - Type ``ansible-playbook playbooks/cmd1.yml -e @creds.yaml --ask-vault-pass``

     You will be prompted for vault password before executing the playbook.
     If successful, you should see config for virtual servers, pools and nodes.

.. NOTE::

  Use ``ansible-vault edit creds.yaml`` to modify the vault.  You will be prompted
  for vault password before editor opens vault file.
