.. |labmodule| replace:: 3
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| - Files used and locations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``f5-super-netops-container`` is a self contained toolkit, meaning
everything we need is already in the solution.  It will also always
be up-to-date, received either from restarting the container or running the
update git clones scripts.

Task 1 - Review the super-netops-container files and collections used
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. During the installation of the ``super-netops-container`` there were several github repositories cloned, all of which are mapped to the ``/home/snops/`` directory.

Let's make sure all repositories were mapped correctly.

Execute: ``cd /home/snops``

The Collections we will be using are located here:

.. code::

    |- /f5-automation-labs
       |- /postman_collections
       |  |  f5-programmability-class-2.postman_collection.json

.. code::

    |- /f5-postman-workflows
      |- /collections
      |  |  /BIG_IP
      |  |      BIGIP_Operational_Workflows.postman_collection.json

The f5-newman-wrapper configuration files are located here:

.. code::

    |- /f5-automation-labs
       |- /jenkins
       |  |  /f5-newman-build
       |  |      f5-newman-build-1
       |  |      f5-newman-build-2
       |  |      f5-newman-build-5
       |  |  /f5-newman-operation
       |  |      f5-newman-build-3
       |  |      f5-newman-build-4
