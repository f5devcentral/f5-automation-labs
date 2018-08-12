Lab 1 – Application Deployment with iApp
----------------------------------------

Task 1 – Configure iApp manually on BIG-IP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Configure Microsoft Lync iApp with the fully supported iApp template for Lync 
2010:

#. Log on to the BIG-IP system.
#. On the Main tab, expand iApp, and then click Application Services.
#. Click Create. The Template Selection page opens.
#. In the Name box, type a name. In our example, we use MicrosoftLync.
#. From the Template list, select f5.microsoft_lync_server_2010. The new Lync 
   template opens.

**Configuring the iApp for Lync Front End Servers:**

*Are you deploying this system for internal Front End services?*

Yes, deploy this BIG-IP system for Front End services

*What IP address do you want to use for the Front End virtual server?* (example: 1.1.1.1)

This is the address clients use to access Lync (or a FQDN will resolve to this 
address). The BIG-IP system will create multiple virtual servers using this 
address on different ports for the different Front End Services.

**Front End Server Pools**

*Which Front End servers should be in this pool?* (example: 100.1.1.1)

Type the IP address for each Lync Front End Server. You can optionally add a 
Connection Limit. Click Add to include additional servers. You must add at 
least one Front End Server here.

**Finished**

Review the answers to your questions. When you are satisfied, click the 
Finished button. The BIG-IP system creates the relevant objects. 

Task 2 – Use FACTER_url command to GET manifest
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: console

   $ sudo FACTER_url=https://admin:admin@10.1.1.246 puppet resource f5_iapp
   f5_iapp { '/Common/MicrosoftLync.app/MicrosoftLync':
     ensure    => 'present',
     tables    => {
	               'director_ip__snatpool_members' => [],
				   'director_ip_server_pools__servers' => [],
				   'edge_external_ip__snatpool_members' => [],
				   'edge_external_ip_reverse_proxy__snatpool_members' => [],
				   'edge_external_ip_server_pools__access_servers' => [],
				   'edge_external_ip_server_pools__av_servers' => [],
				   'edge_external_ip_server_pools__conf_servers' => [],
				   'edge_internal_ip__snatpool_members' => [],
				   'edge_internal_ip_reverse_proxy__snatpool_members' => [],
				   'edge_internal_ip_server_pools__servers' => [],
				   'front_end_ip__snatpool_members' => [],
				   'front_end_ip_mediation_server_pools__servers' => [],
				   'front_end_ip_server_pools__servers' => [
					   {'addr' => '100.1.1.1', 'connection_limit' => '0'}
					]
				   },
     template  => '/Common/f5.microsoft_lync_server_2010',
     variables => {
	               'director_ip__deploying_director_ip' => 'No',
				   'edge_external_ip__deploying_edge_external_ip' => 'No',
				   'edge_internal_ip__deploying_edge_internal_ip' => 'No',
				   'edge_internal_ip_reverse_proxy__deploying_reverse_proxy' => 'No',
				   'front_end_ip__addr' => '1.1.1.1',
				   'front_end_ip__cert' => '/Common/default.crt',
				   'front_end_ip__deploying_front_end_ip' => 'Yes',
				   'front_end_ip__deploying_mediation' => 'No',
				   'front_end_ip__key' => '/Common/default.key',
				   'front_end_ip__sip_monitoring' => 'No',
				   'front_end_ip__snat' => 'No',
				   'front_end_ip__snatpool' => 'No',
				   'front_end_ip_server_pools__lb_method_choice' => 'least-connections-node'
				  },
   }

Task 3 – Modify manifest 
~~~~~~~~~~~~~~~~~~~~~~~~

You can copy above to ``site.pp``, and make modification accordingly. In this
example, we will add another Microsoft Lync iApp

.. code:: console

   node bigip1 {

   f5_iapp { '/Common/MicrosoftLync.app/MicrosoftLync':
     ensure    => 'present',
     tables    => {
                   'director_ip__snatpool_members' => [], 
                   'director_ip_server_pools__servers' => [], 
   				'edge_external_ip__snatpool_members' => [], 
   				'edge_external_ip_reverse_proxy__snatpool_members' => [], 
   				'edge_external_ip_server_pools__access_servers' => [], 
   				'edge_external_ip_server_pools__av_servers' => [], 
   				'edge_external_ip_server_pools__conf_servers' => [], 
   				'edge_internal_ip__snatpool_members' => [], 
   				'edge_internal_ip_reverse_proxy__snatpool_members' => [], 
   				'edge_internal_ip_server_pools__servers' => [], 
   				'front_end_ip__snatpool_members' => [], 
   				'front_end_ip_mediation_server_pools__servers' => [], 
   				'front_end_ip_server_pools__servers' => [
   					{'addr' => '100.1.1.1', 'connection_limit' => '0'}
   				]
   			   },
     template  => '/Common/f5.microsoft_lync_server_2010',
     variables => {
                 'director_ip__deploying_director_ip' => 'No',
   				 'edge_external_ip__deploying_edge_external_ip' => 'No',
   				 'edge_internal_ip__deploying_edge_internal_ip' => 'No',
   				 'edge_internal_ip_reverse_proxy__deploying_reverse_proxy' => 'No',
   				 'front_end_ip__addr' => '1.1.1.1',
   				 'front_end_ip__cert' => '/Common/default.crt',
   				 'front_end_ip__deploying_front_end_ip' => 'Yes',
   				 'front_end_ip__deploying_mediation' => 'No',
   				 'front_end_ip__key' => '/Common/default.key',
   				 'front_end_ip__sip_monitoring' => 'No',
   				 'front_end_ip__snat' => 'No',
   				 'front_end_ip__snatpool' => 'No',
   				 'front_end_ip_server_pools__lb_method_choice' => 'least-connections-node'
   				},
   }

   f5_iapp { '/Common/MicrosoftLync1.app/MicrosoftLync1':
     ensure    => 'present',
     tables    => {
                   'director_ip__snatpool_members' => [],
   				'director_ip_server_pools__servers' => [],
   				'edge_external_ip__snatpool_members' => [],
   				'edge_external_ip_reverse_proxy__snatpool_members' => [],
   				'edge_external_ip_server_pools__access_servers' => [],
   				'edge_external_ip_server_pools__av_servers' => [],
   				'edge_external_ip_server_pools__conf_servers' => [],
   				'edge_internal_ip__snatpool_members' => [],
   				'edge_internal_ip_reverse_proxy__snatpool_members' => [],
   				'edge_internal_ip_server_pools__servers' => [],
   				'front_end_ip__snatpool_members' => [],
   				'front_end_ip_mediation_server_pools__servers' => [],
   				'front_end_ip_server_pools__servers' => [
   					{'addr' => '100.2.2.2', 'connection_limit' => '0'}
   				 ]
   			   },
     template  => '/Common/f5.microsoft_lync_server_2010',
     variables => {
                   'director_ip__deploying_director_ip' => 'No',
                   'edge_external_ip__deploying_edge_external_ip' => 'No',
   				'edge_internal_ip__deploying_edge_internal_ip' => 'No',
   				'edge_internal_ip_reverse_proxy__deploying_reverse_proxy' => 'No',
   				'front_end_ip__addr' => '2.2.2.2',
   				'front_end_ip__cert' => '/Common/default.crt',
   				'front_end_ip__deploying_front_end_ip' => 'Yes',
   				'front_end_ip__deploying_mediation' => 'No',
   				'front_end_ip__key' => '/Common/default.key',
   				'front_end_ip__sip_monitoring' => 'No',
   				'front_end_ip__snat' => 'No',
   				'front_end_ip__snatpool' => 'No',
   				'front_end_ip_server_pools__lb_method_choice' => 'least-connections-node'
   			   },
   }

   }

Task 4 – Deploy manifest on multiple BIG-IPs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code:: console

   $ sudo puppet device -v --user=root --trace
   Info: starting applying configuration to bigip1 at https://10.1.1.246:443
   Info: Retrieving pluginfacts
   Info: Retrieving plugin
   Info: Caching catalog for bigip1
   Info: Applying configuration version '1530567171'
   Notice: /Stage[main]/Main/Node[bigip1]/F5_iapp[/Common/MicrosoftLync1.app/MicrosoftLync1]/ensure: created
   Info: Node[bigip1]: Unscheduling all events on Node[bigip1]
   Notice: Applied catalog in 1.05 seconds
