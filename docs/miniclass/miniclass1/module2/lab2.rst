Lab 2 – BIG-IP Onboarding
-------------------------

When it comes to deployment of multiple physical or virtual BIG-IP devices, 
organizations can use Puppet F5 modules to automate all the initial BIG-IP 
onboarding tasks such as device licensing, DNS and NTP settings, internal and 
external VLANs, self-IPs, and route domains. 

Following is a sample Puppet manifest file (``site.pp``)

.. code:: console

	 node bigip1 {

	 f5_globalsetting { '/Common/globalsetting':
	   hostname  => "bigip-a.f5.local",
	   gui_setup => "disabled",
	 }

	 f5_dns { '/Common/dns':
	   name_servers => ["4.2.2.2", "8.8.8.8"],
	   search       => ["localhost","f5.local"],
	 }

	 f5_ntp { '/Common/ntp':
	   servers  => ['0.pool.ntp.org', '1.pool.ntp.org'],
	   timezone => 'UTC',
	 }

	 }


Running the puppet will automatically onboard the new device.

.. code:: console

	 $ sudo puppet device -v --user=root --trace
	 Info: starting applying configuration to bigip1 at https://10.1.1.246:443
	 Info: Retrieving pluginfacts
	 Info: Retrieving plugin
	 Info: Caching catalog for bigip1
	 Info: Applying configuration version '1530319476'
	 Notice: /Stage[main]/Main/Node[bigip1]/F5_dns[/Common/dns]/name_servers: defined 'name_servers' as '4.2.2.2 8.8.8.8'
	 Notice: /Stage[main]/Main/Node[bigip1]/F5_dns[/Common/dns]/search: defined 'search' as 'localhost f5.local'
	 Notice: /Stage[main]/Main/Node[bigip1]/F5_ntp[/Common/ntp]/servers: defined 'servers' as '0.pool.ntp.org 1.pool.ntp.org'
	 Info: Node[bigip1]: Unscheduling all events on Node[bigip1]
	 Notice: Applied catalog in 14.86 seconds

