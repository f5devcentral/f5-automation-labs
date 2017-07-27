.. |labmodule| replace:: 3
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Run a workflow with f5-newman-wrapper
-------------------------------------------------------------------

In this lab we will use the f5-super-netops-container to run the workflow we
reviewed in the previous lab.  The advantage of using the f5-super-netops
Container is that all the tools, collections and frameworks are pre-installed
and ready to use.

Task 1 -
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Open an SSH session as described in the :ref:`previous lab <lab3_3_1>`

   .. code:: json

        "globalVars": {
                "bigip_mgmt": "10.1.1.4",
                "bigip_username":"admin",
                "bigip_password":"admin"
        },

Task 1 -
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
