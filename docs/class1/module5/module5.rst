Module 5: Python SDK
====================

This module will cover the newly released F5 Python SDK. This SDK is
released and maintained as a public GitHub repository at
https://github.com/F5Networks/f5-common-python

The goal of the Python SDK is to provide a simple interface that
abstracts many of the F5-specific nuances of the iControl REST API away
from the user. As you learned in Module 1, when interacting directly
with the API, it’s often necessary to build out requests in a very manual
fashion. In order to provide a simpler interface, the SDK was developed
to abstract away many of the eccentricities of the API and provide a
clean, Pythonic interface.

For example, when creating a pool in, an Imperative automation model,
without the SDK you would be required to do something like the following
(this code is not complete):

.. code:: python

	import requests
	import sys
	base_url = “https://10.1.1.4/mgmt/tm/ltm/pool/”

	pool_attributes = {
		“name”: “test_pool”,
		“partition”: “Common”,
		“loadBalancingMode”: “least-connections-member”,
		“minUpMembers”: 1
	}

	s = requests.session()
	s.auth = (“admin”, “admin”)

	resp = s.post(base_url, data=json.dumps(pool_attributes))

	if resp.status_code != requests.codes.ok:
		print “Error creating pool”

	sys.exit(1)

When using the Python SDK the equivalent code is:

.. code:: python

	from f5.bigip import ManagementRoot

	mgmt = ManagementRoot(“10.1.1.4”,”admin”,”admin”)

	pool = mgmt.tm.ltm.pools.pool.create(partition=”Common”, name=”test_pool”)
	pool.loadBalancingMode = “least-connections-member”
	pool.minUpMembers = 1

	pool.update()

As you can see, the code utilizing the SDK is much more condensed and far
easier to read. This is a result of the SDK exposing abstracted methods
to build the URL. Additionally the SDK creates standard CURDLE (create,
update, refresh, delete, load, exists) methods that behave correctly
depending on REST object type (Organizing Collection, Resource, etc.) you 
are interacting with (e.g., you cannot DELETE an Organizing Collection, 
therefore a delete() method is not available).

Full documentation for the API exists at `here <https://f5-sdk.readthedocs.io>`_

For the purpose of this lab, your Windows Jumphost has everything
pre-installed, however, since the SDK is a standard python package the
process is trivial on any system (Windows, Linux, Mac, etc.) that has
Python installed.

It’s important to keep in mind, while going through this module, that we
are only demonstrating what is possible with the SDK from a high level. For example, the
same scripts used in this module are designed to run from the command
line with arguments, however, they could easily be modified to use JSON
files as the input mechanism.

.. toctree::
   :maxdepth: 1
   :glob:
   
   lab*
