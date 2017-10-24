.. |labmodule| replace:: 1
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: REST API Authentication & ‘example’ Templates
---------------------------------------------------------------------------

One of the many basic concepts related to interaction with REST API’s is
how a particular consumer is authenticated to the system. BIG-IP and
iWorkflow support two types of authentication: **HTTP BASIC** and
**Token-Based (TBA)**. It’s important to understand both of these authentication
mechanisms, as consumers of the API will often make use of both types
depending on the use case. This lab will demonstrate how to interact
with both types of authentication.

Throughout this and other classes in the series we will make use of the Postman
REST API Client.  You can find more information about Postman at
https://getpostman.com

Task 1 - Import the Postman Collection & Environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task you will Import a Postman Collection & Environment for this lab.
Perform the following steps to complete this task:

#. Open the Postman tool by clicking the |image8| icon of the desktop of
   your Linux Jumphost.  **The initial window may take a few moments to appear.**

   .. NOTE:: The Postman client receives very frequent updates.  If you are
      prompted to update the client please click the :guilabel:`Remind me later`
      button to skip updating the version installed in your lab environment

#. By default the Postman clients requires verification of SSL/TLS Certificates
   to a public Root Certificate Authority.  By default BIG-IP, and many other,
   devices use a Self-Signed Certificate for SSL/TLS connections.  To allow
   connections with Self-Signed Certificates we need to modify the default
   settings of Postman.

   - Open the Postman Settings windows by click :guilabel:`File -> Settings`:

     |image89|

   - Verify your client is configured to allow self-signed certificates by
     setting ``SSL certificate verification`` to ``OFF``

     |image90|

   - Click the **X** in the top right of the Settings window

#. Click the :guilabel:`Import` button in the top left of the Postman window

   |image87|

#. Click the :guilabel:`Import from Link` tab.  Paste the following URL into the
   text box and click :guilabel:`Import`

   .. parsed-literal::

      :raw_github_url:`/postman_collections/Class_1.postman_collection.json`

   |image88|

#. You should now see a collection named ``F5 Programmability: Class 1``
   in your Postman Collections sidebar:

   |image10|

#. Import the Environment file by clicking
   :guilabel:`Import -> Import from Link` and pasting the following URL and
   clicking :guilabel:`Import`:

   .. parsed-literal::

      :raw_github_url:`/postman_collections/Class_1.postman_environment.json`

#. To assist in multi-step procedures we make heavy use of the
   **Environments** capability in Postman. This capability allows us to
   set various global variables that are then substituted into a
   request before it’s sent. Set your environment to
   ``F5 Programmability: Class 1`` by using the menu at the top right
   of your Postman window:

   |image9|

Task 2 - HTTP BASIC Authentication
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In this task, we will use the Postman client to send API requests using
HTTP BASIC authentication. As its name implies this method of
authentication encodes the user credentials via the existing BASIC
authentication method provided by the HTTP protocol. The mechanism this
method uses is to insert an HTTP header named ‘Authorization’ with a
value that is built by Base 64 encoding the string
``<username>:<password>``. The resulting header takes this form:

``Authorization: Basic YWRtaW46YWRtaW4=``

It should be noted that cracking the method of authentication is
TRIVIAL; as a result API calls should always be performed using HTTPS encryption
(F5 default) rather than HTTP.

Perform the following steps to complete this task:

#. Click the :guilabel:`Collections` tab on the left side of the screen, expand
   the ``F5 Programmability: Class 1`` collection on the left side
   of the screen, expand the
   ``Lab 1.2 - API Authentication & 'example' Templates`` folder:

   |image10|

#. Click the ``Step 1: HTTP BASIC Authentication`` item. Click the
   :guilabel:`Authorization` tab and select ``Basic Auth`` as the Type. Fill in
   the username and password (``admin/admin``) and click the :guilabel:`Send`
   button:

   |image11|

#. Notice that the number of Headers in the Headers tab changed from ``1``
   to ``2``. This is because Postman automatically created the HTTP header
   and updated your request to include it.  Click the :guilabel:`Headers` tab
   and examine the HTTP header:

   |image91|

#. Check the :guilabel:`Body` tab, if the request succeeded you should
   be presented with a listing of the ``/mgmt/tm/ltm``
   Organizing Collection:

   |image105|

#. Check the :guilabel:`Test Results` tab and ensure all the tests for this
   request have passed:

   |image106|

#. Update the credentials and specify an INCORRECT password. Send the
   request again and examine the response:

   |image12|

#. Check the :guilabel:`Test Results` tab and notice that our *Unit Tests* for
   this request are now failing (as expected):

   |image107|


.. IMPORTANT:: As you progress through this lab be sure to check the
   :guilabel:`Test Results` tab.  We have included *Unit Tests* where applicable
   to help you verify the requests being sent are succeeding.  If you notice
   a test has failed please double check your input or ask for help.

Task 3 - Token Based Authentication
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

One of the disadvantages of BASIC Authentication is that credentials are
sent with each and every request. This can result in a much greater
attack surface being exposed unnecessarily. As a result, **Token Based
Authentication (TBA)** is preferred in many cases. TBA only sends
the credentials once, on the first request. The system then responds
with a unique token for that session and the consumer then uses that
token for all subsequent requests. BIG-IP and iWorkflow support
token-based authentication that drops down to the underlying
authentication subsystems available in TMOS. As a result, the system can
be configured to support external authentication providers (Active Directory,
RADIUS, TACACS, etc) and those authentication methods can flow through to
the REST API. In this task we will demonstrate TBA using the local
authentication database, however, authentication to external providers
is fully supported.

.. NOTE:: For more information about external authentication providers see the
   section titled **About external authentication providers with
   iControl REST** in the iControl REST API User Guide available at
   https://devcentral.f5.com

Perform the following steps to complete this task:

#. Click the ``Step 2: Retrieve Authentication Token`` item in the Lab 1.2
   Postman Collection

#. Notice that we send a ``POST`` request to the ``/mgmt/shared/authn/login``
   endpoint.

   |image13|

#. Click the :guilabel:`Body` tab and examine the JSON that we will send to
   BIG-IP to provide credentials and the authentication provider:

   |image14|

#. Modify the JSON body and add the required credentials (``admin/admin``).
   Then click the :guilabel:`Send` button.

#. Examine the response status code. If authentication succeeded and
   a token was generated the response will have a ``200 OK`` status code.
   If the status code is ``401`` then check your credentials:

   - **Successful:**

     |image15|

   - **Unsuccessful:**

     |image16|

#. Once you receive a ``200 OK`` status code examine the response body.
   The various attributes show the parameters assigned to the
   particular token. Find the ``token`` attribute and copy it into your
   clipboard (``Ctrl+c``) for use in the next step:

   |image17|

#. Click the ``Step 3: Verify Authentication Works`` item in the Lab
   1.2 Postman collection. Click the :guilabel:`Headers` tab and paste the
   token value copied above as the VALUE for the ``X-F5-Auth-Token``
   header. This header is required to be sent on all requests when
   using token-based authentication.

   |image18|

#. Click the :guilabel:`Send` button. If your request is successful you should
   see a ``200 OK`` status and a listing of the ``ltm`` Organizing
   Collection.

#. We will now update your Postman environment to use this auth token
   for the remainder of the lab. Click the Environment menu in the
   top right of the Postman window and click :guilabel:`Manage Environments`:

   |image19|

#. Click the ``F5 Programmability: Class 1`` item:

   |image20|

#. Update the value for ``bigip_a_auth_token`` by Pasting (``Ctrl+v``)
   in your auth token:

   |image21|

#. Click the ``Update`` button and then close the :guilabel:`Manage Environments`
   window. Your subsequent requests will now automatically include
   the token.

#. Click the ``Step 4: Set Authentication Token Timeout`` item in the
   Lab 1.2 Postman collection. This request will ``PATCH`` your token
   Resource (check the URI) and update the timeout attribute so we
   can complete the lab easily. Examine the request type and JSON
   Body and then click the :guilabel:`Send` button. Verify that the timeout has
   been changed to ``36000`` in the response:

   |image22|

Task 4 - Get a pool ‘example’ Template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In order to assist with REST API interactions, you can request a template
of the various attributes of a Resource type in a Collection. This
template can then be used as the body of a ``POST``, ``PUT`` or ``PATCH``
request as needed.

Perform the following steps:

#. Click the ``Step 5: Get ‘example’ of a Pool Resource`` item in the Lab
   1.2 Postman collection

#. Examine the URI. Notice the addition of ``example`` at the end of the
   collection name:

   |image23|

#. Click :guilabel:`Send` and examine the FULL response. You will see
   descriptions and then all the attributes for the *Pool* resource
   type. The response also shows the default values for the attributes
   if applicable:

   |image24|


.. |image8| image:: /_static/class1/image008.png
   :scale: 70%
.. |image9| image:: /_static/class1/image009.png
.. |image10| image:: /_static/class1/image010.png
.. |image11| image:: /_static/class1/image011.png
   :scale: 80%
.. |image12| image:: /_static/class1/image012.png
   :scale: 80%
.. |image13| image:: /_static/class1/image013.png
.. |image14| image:: /_static/class1/image014.png
.. |image15| image:: /_static/class1/image015.png
.. |image16| image:: /_static/class1/image016.png
.. |image17| image:: /_static/class1/image017.png
.. |image18| image:: /_static/class1/image018.png
.. |image19| image:: /_static/class1/image019.png
.. |image20| image:: /_static/class1/image020.png
.. |image21| image:: /_static/class1/image021.png
.. |image22| image:: /_static/class1/image022.png
.. |image23| image:: /_static/class1/image023.png
.. |image24| image:: /_static/class1/image024.png
.. |image87| image:: /_static/class1/image087.png
.. |image88| image:: /_static/class1/image088.png
.. |image89| image:: /_static/class1/image089.png
.. |image90| image:: /_static/class1/image090.png
.. |image91| image:: /_static/class1/image091.png
.. |image105| image:: /_static/class1/image105.png
.. |image106| image:: /_static/class1/image106.png
.. |image107| image:: /_static/class1/image107.png
