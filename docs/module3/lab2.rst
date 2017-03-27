.. |labmodule| replace:: 3
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – Obtain & Start the f5-super-netops Container Image
--------------------------------------------------------------------------------

In this lab we will use the ``docker`` cli tools to obtain and start the
f5-super-netops container.

Task 1 – Obtain the container image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Open a Command Prompt

   .. NOTE:: If you are using an F5 provided lab environment please SSH to the
      'Linux/Docker Server' host and execute the following commands.

#. Execute ``docker pull f5devcentral/f5-super-netops``

   Example output:
   
   .. code::

      $ docker pull f5devcentral/f5-super-netops
      Using default tag: latest
      latest: Pulling from f5devcentral/f5-super-netops
      ec37562cf8fa: Already exists 
      065dbb94f1df: Pull complete 
      5a961c320a03: Pull complete 
      61f0cd8633f6: Pull complete 
      5c1b9a6d65a9: Pull complete 
      1760e5c24c46: Pull complete 
      47524a6e3cf7: Pull complete 
      358f2108a23a: Pull complete 
      2871a733bbc5: Pull complete 
      44a32a3b94bc: Pull complete 
      9bd70ca2b03d: Pull complete 
      da052888529f: Pull complete 
      Digest: sha256:ee4e509c43862a42b586856c809ffab9d79cbd904844c5162bbdba6fe4f637cb
      Status: Downloaded newer image for f5devcentral/f5-super-netops:latest

#. Execute ``docker images``
  
   Example output:

   .. code::

      $ docker images
      REPOSITORY                     TAG                 IMAGE ID            CREATED             SIZE
      f5devcentral/f5-super-netops   latest              ab796eea25d9        13 minutes ago      171 MB   

Task 2 – Start the container image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To start the container we will execute the command:

``docker run -p 8080:80 -p 2222:22 -it f5devcentral/f5-super-netops``

The ``-p`` option publishes a L4 port from the container to the host.  For
example the ``-p 8080:80`` option will redirect port ``8080`` on the host system
to port ``80`` in the container.  

The ``-it`` option will make the session interactive and allocate a pseudo-TTY

The ``f5devcentral/f5-super-netops`` option is the name associated with the 
image we obtained in Task 1.

Perform the following steps to complete this task:

#. Execute ``docker run -p 8080:80 -p 2222:22 -it f5devcentral/f5-super-netops``

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
   
      $ docker run -p 8080:80 -p 2222:22 --rm -it f5devcentral/f5-super-netops
      [s6-init] making user provided files available at /var/run/s6/etc...exited 0.
      [s6-init] ensuring user provided files have correct perms...exited 0.
      [fix-attrs.d] applying ownership & permissions fixes...
      [fix-attrs.d] done.
      [cont-init.d] executing container initialization scripts...
      [cont-init.d] done.
      [services.d] starting services
      ssh-keygen: generating new host keys: RSA DSA ECDSA ED25519 
      [services.d] done.
      Reticulating splines...
      Becoming self-aware...
      [cloneGitRepos] Retrieving repository list from master
      [cloneGitRepos] Found 5 repositories to clone...
      [cloneGitRepos][1/5] Cloning f5-sphinx-theme:master from https://github.com/f5devcentral/f5-sphinx-theme.git
      [cloneGitRepos][1/5]  Installing f5-sphinx-theme:master...
      [cloneGitRepos][2/5] Cloning f5-super-netops-container:master from https://github.com/f5devcentral/f5-super-netops-container.git
      [cloneGitRepos][2/5]  Installing f5-super-netops-container:master...
      [cloneGitRepos][3/5] Cloning f5-application-services-integration-iApp:develop from https://github.com/F5Networks/f5-application-services-integration-iApp.git
      [cloneGitRepos][3/5]  Installing f5-application-services-integration-iApp:develop...
      [cloneGitRepos][4/5] Cloning f5-postman-workflows:develop from https://github.com/0xHiteshPatel/f5-postman-workflows.git
      [cloneGitRepos][4/5]  Installing f5-postman-workflows:develop...
      [cloneGitRepos][5/5] Cloning f5-automation-labs:v2.0 from https://github.com/f5devcentral/f5-automation-labs.git
      [cloneGitRepos][5/5]  Installing f5-automation-labs:v2.0...
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
      
      Welcome to the f5-super-netops Container.  This container has the following
      services running:
      
       SSH  tcp/22
       HTTP tcp/80
      
      To access these services you may need to remap ports on your host to the
      local container using the command:
      
       docker run -p 8080:80 -p 2222:22 -it f5devcentral/f5-super-netops
      
      From the HOST perspective, this results in:
      
       localhost:2222 -> f5-super-netops:22
       localhost:8080 -> f5-super-netops:80
      
      You can then connect using the following:
      
       HTTP: http://localhost:8080
       SSH:  ssh -p 2222 snops@localhost
      
      Default Credentials:
      
       snops/default
       root/default
      
      Go forth and automate!
      [root@f5-super-netops] [/] # 


