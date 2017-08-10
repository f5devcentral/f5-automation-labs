.. |labmodule| replace:: 1
.. |labnum| replace:: 1
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Install Docker Community Edition (CE)
-------------------------------------------------------------------

To use the f5-super-netops-container you first need to install Docker
Community Edition on your system.

.. NOTE:: If you are using an F5 provided lab environment, Docker CE has already
          been installed on the host named 'Docker Server'.  Please SSH
          to that host a execute all ``docker`` commands there.

Task 1 – Install Docker CE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..Note:: User Credentials to Docker Server: User ``root`` and Password ``default``

Please follow the instructions at https://docs.docker.com/engine/installation/
to install Docker CE.

Once you have completely installed and successfully run the ``hello-world``
test you can continue to the next lab.

To test your setup with the ``hello-world`` container, you just need to run the
following command

``docker run hello-world``

Example output:

.. code::

   $ docker run --rm hello-world
   Unable to find image 'hello-world:latest' locally
   latest: Pulling from library/hello-world
   78445dd45222: Pull complete
   Digest: sha256:c5515758d4c5e1e838e9cd307f6c6a0d620b5e07e6f927b07d05f6d12a1ac8d7
   Status: Downloaded newer image for hello-world:latest

   Hello from Docker!
   This message shows that your installation appears to be working correctly.

   To generate this message, Docker took the following steps:
    1. The Docker client contacted the Docker daemon.
    2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    3. The Docker daemon created a new container from that image which runs the
       executable that produces the output you are currently reading.
    4. The Docker daemon streamed that output to the Docker client, which sent it
       to your terminal.

   Share images, automate workflows, and more with a free Docker ID:
    https://cloud.docker.com/

   For more examples and ideas, visit:
    https://docs.docker.com/engine/userguide/


.. NOTE:: The ``--rm`` option will delete the container as soon as it stops
   running.

   If you see this message: *Cannot connect to the Docker daemon. Is the docker
   daemon running on this host?* , it is likely that you don't have enough
   privileges with your user, try to use sudo when executing docker commands.

   If you want to remove the hello-world container, you can run the command
   ``sudo docker rmi hello-world``
   If your container is running, you cannot remove the image.
   You can issue the following commands in that case (this will stop ALL your container
   instances):
   ``sudo docker stop $(docker ps -aq)``
