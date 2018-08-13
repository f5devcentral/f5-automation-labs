Execute Terraform Apply to manifest configuration on  big-ip
------------------------------------------------------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

This class covers the following topics:

#. Execute Terraform Apply::

     terraform apply

You should see the following output::

 An execution plan has been generated and is shown below.
 Resource actions are indicated with the following symbols:
 + create

 Terraform will perform the following actions::

 + bigip_ltm_monitor.monitor
     id:                           <computed>
     interval:                     "999"
     ip_dscp:                      "0"
     manual_resume:                "disabled"
     name:                         "/Common/terraform_monitor"
     parent:                       "/Common/http"
     reverse:                      "disabled"
     send:                         "GET /some/path\\r\\n"
     time_until_up:                "0"
     timeout:                      "999"
     transparent:                  "disabled"

 + bigip_ltm_pool.pool
     id:                           <computed>
     allow_nat:                    "yes"
     allow_snat:                   "yes"
     load_balancing_mode:          "round-robin"
     monitors.#:                   "1"
     monitors.1095875955:          "/Common/terraform_monitor"
     name:                         "/Common/terraform-pool"
     reselect_tries:               "0"
     service_down_action:          "none"
     slow_ramp_time:               "10"

 + bigip_ltm_pool_attachment.attach_node
     id:                           <computed>
     node:                         "/Common/10.1.20.251:80"
     pool:                         "/Common/terraform-pool"

 + bigip_ltm_virtual_server.http
     id:                           <computed>
     client_profiles.#:            <computed>
     destination:                  "10.1.10.100"
     fallback_persistence_profile: <computed>
     ip_protocol:                  <computed>
     mask:                         "255.255.255.255"
     name:                         "/Common/terraform_vs_http"
     persistence_profiles.#:       <computed>
     pool:                         "/Common/terraform-pool"
     port:                         "80"
     profiles.#:                   <computed>
     server_profiles.#:            <computed>
     snatpool:                     <computed>
     source:                       "0.0.0.0/0"
     source_address_translation:   "automap"
     translate_address:            <computed>
     translate_port:               <computed>
     vlans_disabled:               <computed>
     vlans_enabled:                <computed>

 + bigip_net_selfip.selfip1
     id:                           <computed>
     ip:                           "10.1.20.246/24"
     name:                         "/Common/internalselfIP"
     vlan:                         "/Common/internal"

 + bigip_net_selfip.selfip2
     id:                           <computed>
     ip:                           "10.1.10.246/24"
     name:                         "/Common/externalselfIP"
     vlan:                         "/Common/external"

 + bigip_net_vlan.vlan1
     id:                           <computed>
     interfaces.#:                 "1"
     interfaces.0.tagged:          "false"
     interfaces.0.vlanport:        "1.2"
     name:                         "/Common/internal"
     tag:                          "101"

 + bigip_net_vlan.vlan2
     id:                           <computed>
     interfaces.#:                 "1"
     interfaces.0.tagged:          "false"
     interfaces.0.vlanport:        "1.1"
     name:                         "/Common/external"
     tag:                          "102"

 + bigip_sys_dns.dns1
     id:                           <computed>
     description:                  "/Common/DNS1"
     name_servers.#:               "1"
     name_servers.3817307869:      "8.8.8.8"
     number_of_dots:               "2"
     search.#:                     "1"
     search.3719609835:            "f5.com"

 + bigip_sys_ntp.ntp1
     id:                           <computed>
     description:                  "/Common/NTP1"
     servers.#:                    "1"
     servers.1450813517:           "time.google.com"
     timezone:                     "America/Los_Angeles"


 Plan: 10 to add, 0 to change, 0 to destroy.

 Do you want to perform these actions?
 Terraform will perform the actions described above.
 Only 'yes' will be accepted to approve.

 Enter a value: 


Continue terraform apply by typing ``yes`` followed by the enter key...
