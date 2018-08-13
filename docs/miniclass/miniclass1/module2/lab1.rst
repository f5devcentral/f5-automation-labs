Lab 1 - Prompting for User Input
--------------------------------

You will create a playbook to prompt the user to provide credentials.  Use
the ``vars_prompt`` in your Playbook.

Task 1 - Run a BIG-IP tmsh command
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. Create a playbook ``cmd.yaml``.

   - Type ``nano playbooks/cmd.yaml``
   - Type the following into the ``playbooks/cmd.yaml`` file.

     .. code:: yaml

        ---

        - name: "Run a tmsh command"
          hosts: bigips
          gather_facts: False
          connection: local

          vars:
            validate_certs: no
            server: 10.1.1.245

          vars_prompt:
            - name: "username"
              prompt: "Enter BIG-IP username"
              private: yes
            - name: "password"
              prompt: "Enter BIG-IP password"
              private: yes

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

   - Type ``ansible-playbook playbooks/cmd.yaml``

     You will be prompted to enter username and password before executing the
     playbook.  If successful, you should see config for virtual servers, pools and nodes.
     username: ``admin``
     password: ``admin``


   .. NOTE::

      Prompting is a great way to get input from the user. It can function in both
      an interactive, and non-interactive way.

      The ``bigip_command`` module is what we recommend for all situations where you
      need to do something that a current module does not support.

      This module will **always** warn you when you use it for things that change
      configuration. These warnings will inform you to file an issue on our Github
      Issue tracker for a feature enhancement.

      Ultimately, the goal we want to get to is to have a suite of modules that
      meets all the needs of customers that use Ansible. Since that is not yet possible,
      the ``bigip_command`` is there to accommodate.

      This module can also be used over SSH, but password SSH is the only method known
      to work at this time.
