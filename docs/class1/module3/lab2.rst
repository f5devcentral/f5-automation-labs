.. |labmodule| replace:: 3
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Obtain & Start the f5-super-netops-container Image
--------------------------------------------------------------------------------

In this lab we will use the ``docker`` cli tools to obtain and start the
f5-super-netops-container image.

Task 1 – Obtain the container image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Open a Command Prompt

   .. NOTE:: If you are using an F5 provided lab environment please SSH to the
      'Docker Server' host and execute the following commands.

#. Execute ``docker pull f5devcentral/f5-super-netops-container:base``

   Example output:

   .. code::

      $ docker pull f5devcentral/f5-super-netops-container:base
      base: Pulling from f5devcentral/f5-super-netops-container
      cfc728c1c558: Pull complete
      d87c258a5fa6: Pull complete
      c65d1b487eef: Pull complete
      8dbc9686aafd: Pull complete
      8780a91a51b1: Pull complete
      adf738b585dc: Pull complete
      03b3481bc590: Pull complete
      8fc57fb32b1a: Pull complete
      8f73f7c22240: Pull complete
      7d94bd4c05e6: Pull complete
      a0b407bf28b5: Pull complete
      b97bd4f3c99d: Pull complete
      f37519ea449c: Pull complete
      Digest: sha256:20f501b4c46948d3e69ffd7793cbbf08ac18da5f89c6665f36af10bc7c2a89b4
      Status: Downloaded newer image for f5devcentral/f5-super-netops-container:base

#. Execute ``docker images``

   Example output:

   .. code::

      $ docker images
      REPOSITORY                               TAG                 IMAGE ID            CREATED             SIZE
      f5devcentral/f5-super-netops-container   base                7712f3d38f6b        7 days ago          206 MB

Task 2 – Start the container image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To start the container we will execute the command:

``docker run -p 8080:80 -p 2222:22 -it f5devcentral/f5-super-netops-container:base``

The ``-p`` option publishes a L4 port from the container to the host.  For
example the ``-p 8080:80`` option will redirect port ``8080`` on the host system
to port ``80`` in the container.

The ``-it`` option will make the session interactive and allocate a pseudo-TTY

The ``f5devcentral/f5-super-netops-container:base`` option is the name
associated with the image we obtained in Task 1.

Perform the following steps to complete this task:

#. Execute ``docker run -p 8080:80 -p 2222:22 -it f5devcentral/f5-super-netops-container:base``

   .. NOTE:: The image requires Internet connectivity to download the latest
      versions of tools and documentation.  Please ensure you have proper
      connectivity from your host prior to starting the image.  If you need
      to use a proxy please refer to the documentation at
      https://docs.docker.com

   The image will now start and load resources from the Internet.  This process
   may take a while depending on the speed of your connection.  When the startup
   process is complete you will be presented with a ``root`` user prompt.  You
   can interact with the image with standard Linux commands.  In the next lab
   we will connect to the image via SSH and HTTP.

   Example startup output:

   .. code::

      $ docker run -p 8080:80 -p 2222:22 -it f5devcentral/f5-super-netops-container:base
      [s6-init] making user provided files available at /var/run/s6/etc...exited 0.
      [s6-init] ensuring user provided files have correct perms...exited 0.
      [fix-attrs.d] applying ownership & permissions fixes...
      [fix-attrs.d] done.
      [cont-init.d] executing container initialization scripts...
      [cont-init.d] done.
      [services.d] starting services
      [services.d] done.
      Reticulating splines...
      Becoming self-aware...
      [cloneGitRepos] Retrieving repository list from https://github.com/f5devcentral/f5-super-netops-container.git#master
      [updateRepos] Processing /tmp/snops-repo/images/base/fs/etc/snopsrepo.d/base.json
      [updateRepos] Processing /tmp/user_repos.json
      [cloneGitRepos] Loading repositories from /home/snops/repos.json
      [cloneGitRepos] Found 5 repositories to clone...
      [cloneGitRepos][1/5] Cloning f5-sphinx-theme#master from https://github.com/f5devcentral/f5-sphinx-theme.git
      [cloneGitRepos][1/5]  Installing f5-sphinx-theme#master
      [cloneGitRepos][2/5] Cloning f5-super-netops-container#master from https://github.com/f5devcentral/f5-super-netops-container.git
      [cloneGitRepos][2/5]  Installing f5-super-netops-container#master
      [cloneGitRepos][3/5] Cloning f5-application-services-integration-iApp#develop from https://github.com/F5Networks/f5-application-services-integration-iApp.git
      [cloneGitRepos][3/5]  Installing f5-application-services-integration-iApp#develop
      [cloneGitRepos][4/5] Cloning f5-postman-workflows#develop from https://github.com/0xHiteshPatel/f5-postman-workflows.git
      [cloneGitRepos][4/5]  Installing f5-postman-workflows#develop
      [cloneGitRepos][5/5] Cloning f5-automation-labs#master from https://github.com/f5devcentral/f5-automation-labs.git
      [cloneGitRepos][5/5]  Installing f5-automation-labs#master
                                      .----------.
                                     /          /
                                    /   ______.'
                              _.._ /   /_
                            .' .._/      '''--.
                            | '  '___          `.
                          __| |__    `'.         |
                         |__   __|      )        |
                            | | ......-'        /
                            | | \          _..'`
                            | |  '------'''
                            | |                      _
                            |_|                     | |
       ___ _   _ _ __   ___ _ __          _ __   ___| |_ ___  _ __  ___
      / __| | | | '_ \ / _ \ '__| ______ | '_ \ / _ \ __/ _ \| '_ \/ __|
      \__ \ |_| | |_) |  __/ |   |______|| | | |  __/ || (_) | |_) \__ \
      |___/\__,_| .__/ \___|_|           |_| |_|\___|\__\___/| .__/|___/
                | |                                          | |
                |_|                                          |_|

      Welcome to the f5-super-netops-container.  This image has the following
      services running:

       SSH  tcp/22
       HTTP tcp/80

      To access these services you may need to remap ports on your host to the
      local container using the command:

       docker run -p 8080:80 -p 2222:22 -it f5devcentral/f5-super-netops-container:base

      From the HOST perspective, this results in:

       localhost:2222 -> f5-super-netops-container:22
       localhost:8080 -> f5-super-netops-container:80

      You can then connect using the following:

       HTTP: http://localhost:8080
       SSH:  ssh -p 2222 snops@localhost

      Default Credentials:

       snops/default
       root/default

      Go forth and automate!

      (you can now detach by using Ctrl+p+q)

      [root@f5-super-netops] [/] #

Task 3 - Detach/Re-attach the Container
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When running containers it's important to understand that it will exit if the
foreground process (in this case the shell) exits.  For example, if you typed
the ``exit`` command in the running container it will shutdown.  In order to
avoid this you should detach from the container once it has completed booting.
You can still perform functions by using SSH to access the container as
explained in the next lab.

Detach the Container
^^^^^^^^^^^^^^^^^^^^

#. Enter ``Ctrl+p+q`` in the running TTY.

   Example output:

   .. code::

      [root@f5-super-netops] [/] #
      [root@f5-super-netops] [/] #
      [root@f5-super-netops] [/] # <enter Ctrl+p+q>
      hostname:~ user$

#. Verify the container is still running by entering ``docker ps``

   Example output:

   .. code::

      hostname:~ user$ docker ps
      CONTAINER ID        IMAGE                                         COMMAND                  CREATED             STATUS              PORTS                                        NAMES
      b8c86fe5c7f1        f5devcentral/f5-super-netops-container:base   "/init /snopsboot/..."   2 minutes ago       Up 2 minutes        0.0.0.0:2222->22/tcp, 0.0.0.0:8080->80/tcp   keen_ritchie

Re-attach the Container
^^^^^^^^^^^^^^^^^^^^^^^

#. Execute ``docker ps``

   Example output:

   .. code::

       hostname:~ user$ docker ps
       CONTAINER ID        IMAGE                                         COMMAND                  CREATED             STATUS              PORTS                                        NAMES
       b8c86fe5c7f1        f5devcentral/f5-super-netops-container:base   "/init /snopsboot/..."   2 minutes ago       Up 2 minutes        0.0.0.0:2222->22/tcp, 0.0.0.0:8080->80/tcp   keen_ritchie
      |------------|
        ^- YOUR CONTAINER ID

#. Copy the value under the ``CONTAINER ID`` column that correspond to the
   f5devcentral/f5-super-netops-container:base image.
#. Execute ``docker attach <container_id>``
#. You may have to hit ``<Enter>`` to display the command prompt
#. Detach the container again by entering ``<Ctrl+p+q>``
