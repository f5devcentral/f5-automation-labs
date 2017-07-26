.. |labmodule| replace:: 3
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Stitching together Authentication and Operation Workflows
-------------------------------------------------------------------

The f5-super-netops-container is a self contained toolkit, meaning everything we will
be using is already on the solution, it will also always be updated (CD).

.. NOTE:: If you are running in the provided training infrastructure, the docker
server can be accessed via Putty

Task 1 - Review the super-netops-container files and collections used
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Open Putty and connect to the ``Docker Server`` user credentials are ``user`` and
``default``

#. During the installation of the super-netops-container there were several github
repositories mapped, all of which are mapped to the ``/home/snops/`` directory.

Lets make sure all repositories were mapped correctly.

Execute:

``cd /home/snops``

We are looking for:

.. code::
f5-automation-labs
f5-postman-workflows




Task 2 -
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
