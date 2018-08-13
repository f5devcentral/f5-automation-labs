Lab 1 – Puppet Workflow automation
----------------------------------

Task 1 – Create your own module
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this lab, we are creating a new puppet module *bigip*

.. code:: console

   $ sudo puppet module list
   /etc/puppetlabs/code/environments/production/modules
   ├── eric-workflow (v0.1.0)
   ├── puppetlabs-apache (v1.6.0)
   ├── puppetlabs-ciscopuppet (v1.0.0)
   ├── puppetlabs-concat (v1.2.4)
   └── puppetlabs-stdlib (v4.8.0)
   /etc/puppetlabs/code/modules
   ├── puppetlabs-f5 (v1.5.1)
   └── puppetlabs-f5 (v1.3.0)

   scs@master:/etc/puppetlabs/code/environments/production/modules$ sudo puppet module generate scs-bigip --skip-interview

   Notice: Generating module at /etc/puppetlabs/code/environments/production/modules/bigip...
   Notice: Populating templates...
   Finished; module generated in bigip.
   bigip/metadata.json
   bigip/Rakefile
   bigip/README.md
   bigip/tests
   bigip/tests/init.pp
   bigip/manifests
   bigip/manifests/init.pp
   bigip/Gemfile
   bigip/spec
   bigip/spec/classes
   bigip/spec/classes/init_spec.rb
   bigip/spec/spec_helper.rb


   scs@master:/etc/puppetlabs/code/environments/production/modules$ cd bigip/
   scs@master:/etc/puppetlabs/code/environments/production/modules/bigip$ ls
   Gemfile  manifests  metadata.json  Rakefile  README.md  spec  tests

Task 2 – Create new resource (wrapper)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Defined resource types (also called defined types or defines) are blocks of
Puppet code that can be evaluated multiple times with different parameters. Once
defined, they act like a new resource type: you can cause the block to be
evaluated by declaring a resource of that new resource type.

By using Defined resource types, we can create a new wrapper resource 
``bigip_vip``, which is to tie multiple resources together: 
``f5_node``, ``f5_pool``, ``f5_virtualserver``. It provides a new puppet 
resource for VIP service while abstracting all the underlying BIG-IP objects.

.. code:: console

   scs@master:/etc/puppetlabs/code/environments/production/modules/bigip$ cd manifests/
   scs@master:/etc/puppetlabs/code/environments/production/modules/bigip/manifests$ vi bigip_vip.pp

.. code:: console

   define bigip::bigip_vip (
   $nodeip,
   $virtualip,
   ){

   f5_node { "/Common/web_server_1":
      ensure                          => 'present',
      address                         => "$nodeip",
      description                     => 'Web Server Node',
      availability_requirement        => 'all',
      health_monitors                 => ['/Common/icmp'],
   }   

   f5_pool { "/Common/pool1":
      ensure                          => 'present',
      members                         => [
           { name => '/Common/web_server_1', port => '80', },
      ],
      availability_requirement        => 'all',
      health_monitors                 => ['/Common/http_head_f5'],
   }

   f5_virtualserver { "/Common/vs1":
      ensure                          => 'present',
      provider                        => 'standard',
      default_pool                    => '/Common/pool1',
      destination_address             => $virtualip,
      destination_mask                => '255.255.255.255',
      http_profile                    => '/Common/http',
      service_port                    => '80',
      protocol                        => 'tcp',
      source                          => '0.0.0.0/0',
      source_address_translation      => 'automap'
   }

   }	



Task 3 – Puppet run to use new resource
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can use the new wrapper resource ``bigip_vip`` in ``site.pp``, in the same
manner you are using other BIG-IP resources.

.. code:: console

   node bigip1 {

   bigip::bigip_vip { "vs" :
     nodeip   => '100.1.1.1',
     virtualip => '1.1.1.1',
   }

   }

.. code:: console

   $ sudo puppet device -v --user=root --trace
   Info: starting applying configuration to bigip1 at https://10.1.1.246:443
   Info: Retrieving pluginfacts
   Info: Retrieving plugin
   Info: Caching catalog for bigip1
   Info: Applying configuration version '1530656207'
   Notice: /Stage[main]/Main/Node[bigip1]/Bigip::Bigip_vip[vs]/F5_node[/Common/web_server_1]/ensure: created
   Notice: /Stage[main]/Main/Node[bigip1]/Bigip::Bigip_vip[vs]/F5_pool[/Common/pool1]/ensure: created
   Notice: /Stage[main]/Main/Node[bigip1]/Bigip::Bigip_vip[vs]/F5_virtualserver[/Common/vs1]/ensure: created


