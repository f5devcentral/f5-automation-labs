.. |labmodule| replace:: 3
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Install Docker Community Edition (CE)
-------------------------------------------------------------------

To use the f5-super-netops container you first need to install Docker
Community Edition on your system.

.. NOTE:: If you are using an F5 provided lab environment, Docker CE has already
          been installed on the host named 'Linux/Docker Server'.  Please SSH
          to that host a execute all `docker` commands there.

Task 1 – Install Docker CE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Please follow the instructions at https://docs.docker.com/engine/installation/
to install Docker CE.

Once you have completed installed and successfully run the ``hello_world``
test you can continue to the next lab.
