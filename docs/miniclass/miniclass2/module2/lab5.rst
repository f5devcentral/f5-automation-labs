Execute Terraform Apply .....
-----------------------------

#. Creating configuration::

	bigip_sys_ntp.ntp1: Creating...
       	  description:        "" => "/Common/NTP1"
 	  servers.#:          "0" => "1"
  	  servers.1450813517: "" => "time.google.com"
  	  timezone:           "" => "America/Los_Angeles"
	bigip_net_vlan.vlan1: Creating...
  	  interfaces.#:          "0" => "1"
  	  interfaces.0.tagged:   "" => "false"
  	  interfaces.0.vlanport: "" => "1.2"
  	  name:                  "" => "/Common/internal"
  	  tag:                   "" => "101"
	bigip_ltm_pool.pool: Creating...
  	  allow_nat:           "" => "yes"
  	  allow_snat:          "" => "yes"
  	  load_balancing_mode: "" => "round-robin"
  	  monitors.#:          "" => "1"
  	  monitors.1095875955: "" => "/Common/terraform_monitor"
  	  name:                "" => "/Common/terraform-pool"
  	  reselect_tries:      "" => "0"
  	  service_down_action: "" => "none"
  	  slow_ramp_time:      "" => "10"
	bigip_net_vlan.vlan2: Creating...
  	  interfaces.#:          "0" => "1"
  	  interfaces.0.tagged:   "" => "false"
  	  interfaces.0.vlanport: "" => "1.1"
  	  name:                  "" => "/Common/external"
  	  tag:                   "" => "102"
	bigip_ltm_monitor.monitor: Creating...
  	  interval:      "" => "999"
  	  ip_dscp:       "" => "0"
  	  manual_resume: "" => "disabled"
  	  name:          "" => "/Common/terraform_monitor"
  	  parent:        "" => "/Common/http"
  	  reverse:       "" => "disabled"
  	  send:          "" => "GET /some/path\\r\\n"
  	  time_until_up: "" => "0"
  	  timeout:       "" => "999"
  	  transparent:   "" => "disabled"
	bigip_sys_dns.dns1: Creating...
  	  description:             "" => "/Common/DNS1"
  	  name_servers.#:          "0" => "1"
  	  name_servers.3817307869: "" => "8.8.8.8"
  	  number_of_dots:          "" => "2"
  	  search.#:                "0" => "1"
  	  search.3719609835:       "" => "f5.com"
	bigip_sys_ntp.ntp1: Creation complete after 9s (ID: /Common/NTP1)
	bigip_sys_dns.dns1: Creation complete after 10s (ID: /Common/DNS1)
	bigip_net_vlan.vlan1: Creation complete after 10s (ID: /Common/internal)
	bigip_net_selfip.selfip1: Creating...
  	  ip:   "" => "10.1.20.246/24"
  	  name: "" => "/Common/internalselfIP"
  	  vlan: "" => "/Common/internal"
	bigip_net_vlan.vlan2: Creation complete after 10s (ID: /Common/external)
	bigip_net_selfip.selfip2: Creating...
  	  ip:   "" => "10.1.10.246/24"
  	  name: "" => "/Common/externalselfIP"
  	  vlan: "" => "/Common/external"
	bigip_ltm_pool.pool: Creation complete after 10s (ID: /Common/terraform-pool)
	bigip_ltm_pool_attachment.attach_node: Creating...
  	  node: "" => "/Common/10.1.20.251:80"
  	  pool: "" => "/Common/terraform-pool"
	bigip_ltm_virtual_server.http: Creating...
  	  client_profiles.#:            "" => "<computed>"
  	  destination:                  "" => "10.1.10.100"
  	  fallback_persistence_profile: "" => "<computed>"
  	  ip_protocol:                  "" => "<computed>"
  	  mask:                         "" => "255.255.255.255"
  	  name:                         "" => "/Common/terraform_vs_http"
  	  persistence_profiles.#:       "" => "<computed>"
  	  pool:                         "" => "/Common/terraform-pool"
  	  port:                         "" => "80"
  	  profiles.#:                   "" => "<computed>"
  	  server_profiles.#:            "" => "<computed>"
  	  snatpool:                     "" => "<computed>"
  	  source:                       "" => "0.0.0.0/0"
  	  source_address_translation:   "" => "automap"
  	  translate_address:            "" => "<computed>"
  	  translate_port:               "" => "<computed>"
  	  vlans_disabled:               "" => "<computed>"
  	  vlans_enabled:                "" => "<computed>"
	bigip_ltm_monitor.monitor: Still creating... (10s elapsed)
	bigip_ltm_pool_attachment.attach_node: Creation complete after 1s (ID: /Common/terraform-pool-/Common/10.1.20.251:80)
	bigip_net_selfip.selfip1: Creation complete after 1s (ID: /Common/internalselfIP)
	bigip_net_selfip.selfip2: Creation complete after 1s (ID: /Common/externalselfIP)
	bigip_ltm_virtual_server.http: Creation complete after 2s (ID: /Common/terraform_vs_http)
	bigip_ltm_monitor.monitor: Creation complete after 12s (ID: /Common/terraform_monitor)

	Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
