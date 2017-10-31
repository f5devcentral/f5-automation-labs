Things to consider when creating such UDF blueprint:

* Provisioning

    * LTM
    * ASM

* License BIG-IP(s)/iWorkflow:

    * do this via CLI. If done through TMUI, licensing may not persist after a restart of the instance
    * make sure to enable the "recycle option" in your license so that it can be automatically renewed

* update_hostname.sh on each F5 device to enforce a hostname. Otherwise it will be overriden with something like ip-10-1-1-10. Another option is to disable dhcp db key (totally, not only host-name - it doesn't work)

    * make sure to update the hostname on the script for each device
    * modify sys global-settings mgmt-dhcp disabled


* BIG-IP / iWorkflow root access via ssh:

    * enable root login and password auth in /config/ssh/sshd_config
    * update root password
    * modify /sys db systemauth.disablerootlogin value false on iWorkflow
    * uncheck the disable root option in the BIG-IP TMUI when going through the setup wizard

* Secondary IPs

    * Allocate on External subnet .120 to .130 on bigip-a
    * Allocate on Internal subnet .120 to .125 on bigip-a


* f5-demo-app

    * started the following container on Linux Server

        * docker run -d -p 8000:80 --restart unless-stopped f5devcentral/f5-demo-app:AWS
        * docker run -d -p 8001:80 --restart unless-stopped f5devcentral/f5-demo-app:blue
        * docker run -d -p 8002:80 --restart unless-stopped f5devcentral/f5-demo-app:green

