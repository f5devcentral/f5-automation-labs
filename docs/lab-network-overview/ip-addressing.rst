IP Addressing Objectives
=========================

Each student will have access to a Windows 7 “jumpbox”.  Information required to gain RDP access to the jumpbox will be provided in each session.

Each student will have a BIG-IP VE environment with IP addressing as below:

.. warning:: Finalize IP addressing scheme

* 10.1.1.0/24 – Management Subnet

	* 10.1.1.245 – BIGIP mgmt IP
	* 10.1.1.100 – Win7 “Jumpbox” mgmt IP
    * 10.1.1.99 – Linux tool box mgmt IP

* 10.1.10.0/24 – External Subnet

	* 10.1.1.245 – BIGIP self IP
	* 10.1.10.40 – hackazon.f5demo.com (virtual server)
    * 10.1.10.99 – Linux tool box external IP

* 10.1.20.0/24 – Internal Subnet

	* 10.1.20.245 – BIGIP self IP
	* 10.1.20.99 – hackazon webserver
