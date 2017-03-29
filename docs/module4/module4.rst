Module 4 – f5-postman-workflows & f5-newman-wrapper
===================================================

In order to assist users with automating the F5 BIG-IP platform we have
developed a set of tools that can be used with the Postman REST Client
(http://getpostman.com).  The purpose of the tools are:

 - f5-postman-workflows

   - Provide re-usable JavaScript functions that ease testing of API responses
     and populating environment variables

   - Implement a delay-based polling mechanism

 - f5-newman-wrapper

   - Allow users to easily assemble Postman collections into workflows

   - Enabled integration with third-party tools such as Ansible, Chef & Puppet

This lab module will walk you through using the tools.  If you are interested 
in developing collections using the f5-postman-workflows framework please visit
the official GitHub repository at https://github.com/0xHiteshPatel/f5-postman-workflows 

.. toctree::
   :maxdepth: 1
   :glob:
   
   lab*