.. |labmodule| replace:: 1
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

.. |postman-icon| image:: /_static/class3/postman-icon.png
.. |primer-1.2| image:: /_static/class3/primer-1.2.png
.. |primer-1.3| image:: /_static/class3/primer-1.3.png
.. |primer-1.4| image:: /_static/class3/primer-1.4.png
.. |primer-1.5| image:: /_static/class3/primer-1.5.png
.. |primer-2.5-good| image:: /_static/class3/primer-2.5-good.png
.. |primer-2.5-bad| image:: /_static/class3/primer-2.5-bad.png
.. |primer-2.6| image:: /_static/class3/primer-2.6.png
.. |primer-2.7| image:: /_static/class3/primer-2.7.png
.. |primer-2.9| image:: /_static/class3/primer-2.9.png
.. |primer-2.10| image:: /_static/class3/primer-2.10.png
.. |primer-2.12| image:: /_static/class3/primer-2.12.png
.. |primer-2.13| image:: /_static/class3/primer-2.13.png

Lab |labmodule|\.\ |labnum|\: API Authentication
================================================

This lab utilizes the Postman Chrome extension to facilitate the sending data to and receiving data from the |icr|.

REST API Authentication
-----------------------
One of the many basic concepts related to interaction with REST API’s is how a particular consumer is authenticated to the system. BIG-IP, BIG-IQ and iWorkflow support two types of authentication: HTTP BASIC and Token based. It’s important to understand both of these authentication mechanisms, as consumers of the API will often make use of both types depending on the use case. This lab will demonstrate how to interact with both types of authentication.


Task 1 - Basic Authentication
------------------------------

.. WARNING::

    Prior to performing any of the below steps, ensure that you can log into the BIG-IP with Chrome after accepting the invalid certificate.  Postman relies on the Chrome certificate store and if the self-signed cert has not been accepted via Chrome, this extension will not work properly.

In this task we will use the Postman tool to send API requests using HTTP BASIC authentication. As its name implies this method of authentication encodes the user credentials via the existing BASIC authentication method provided by the HTTP protocol. The mechanism this method uses is to insert an HTTP header named ‘Authorization’ with a value that is built by Base 64 encoding the string "<username>:<password>". The resulting header takes this form:

.. code-block:: rest

    Authorization: Basic YWRtaW46YWRtaW4=

It should be noted that cracking the method of authentication is TRIVIAL; as a result API calls should always be performed using HTTPS (F5 default) rather than HTTP.

Perform the following steps to complete this task:

1. Open the Postman Client on your jumphost by clicking the |postman-icon| icon.

2. To assist in multi-step procedures we make heavy use of the ‘Environments’ capability in Postman. This capability allows us to set various global variables that are then substituted into a request before it’s sent. When you open Postman please verify that your environment is set the **F5 SecDevOps** environment:

|primer-1.2|
    
3. Click the ‘Collections’ tab on the left side of the screen, expand the ‘F5 SecDevOps’ collection on the left side of the screen, expand the **Lab 1.2 - API Authentication** folder:

(Ignore the # of requests on the screen below versus what you might see, the # of requests will grow and change as this lab grows)

|primer-1.3|

4. Click the **1. HTTP BASIC Authentication** item. Click the ‘Authorization’ tab and select ‘Basic Auth’ as the Type. Fill in the username and password (admin/admin) and click the ‘Update Request’ button. Notice that the number of Headers in the Headers tab changed from 1 to 2. This is because Postman automatically created the HTTP header and updated your request to include it. Click the ‘Headers’ tab and examine the HTTP header:

|primer-1.4|

5. Click the ‘Send’ button to send the request. If the request succeeds you should be presented with a listing of the ‘/mgmt/tm/ltm’ Organizing Collection.

.. TIP:: Pay attention to the Status response i.e. **200 OK**

|primer-1.5|

Task 2 - Token Based Authentication
-----------------------------------
One of the disadvantages of BASIC Authentication is that credentials are sent with each and every request. This can result in a much greater attack surface being exposed unnecessarily. As a result Token Based Authentication (TBA) is preferred in many cases. This method only sends the credentials once, on the first request. The system then responds with a unique token for that session and the consumer then uses that token for all subsequent requests. BIG-IP, BIG-IQ and iWorkflow support token-based authentication that drops down to the underlying authentication subsystems available in TMOS. As a result the system can be configured to support external authentication providers (RADIUS, TACACS, AD, etc) and those authentication methods can flow through to the REST API. In this task we will demonstrate TBA using the local authentication database, however, authentication to external providers is fully supported.

.. TIP:: For more information about external authentication providers see the section titled "About external authentication providers with iControl REST" in the iControl REST API User Guide available at https://devcentral.f5.com

Perform the following steps to complete this task:

1. Click the **2: Get Authentication Token** item in the **Lab 1.2 - API Authentication** Postman Collection
2. Notice that we send a POST request to the ‘/mgmt/shared/authn/login’ endpoint. Note that BASIC authentication is NOT required for this step. The token is provided based on the credentials located within the JSON payload.
3. Click the ‘Body’ tab and examine the JSON that we will send to BIG-IP to provide credentials and the authentication provider:
4. Modify the JSON body and add the required credentials (admin/admin). Then click the ‘Send’ button.
5. Examine the response status code. If authentication succeeded and a token was generated, the response will have a 200 OK status code. If the status code is 401 then check your credentials.  View the response body to see the token that was provided:

Successful:

|primer-2.5-good|

Unsuccessful:

|primer-2.5-bad|

6. Once you receive a 200 OK status code examine the response body. The various attributes show the parameters assigned to the particular token. Find the ‘token’ attribute and copy it into your clipboard (Ctrl+c) for use in the next step:

|primer-2.6|

7. Click the **3: Verify Authentication Works** item in the **Lab 1.2 - API Authentication** Postman collection. Click the ‘Headers’ tab and paste the token value copied above as the VALUE for the ‘X-F5-Auth-Token’ header. This header is required to be sent on all requests when using token based authentication.

|primer-2.7|

8. Click the ‘Send’ button. If you’re request is successful you should see a ‘200 OK’ status and a listing of the ‘ltm’ Organizing Collection.
9. We will now update your Postman environment to use this auth token for the remainder of the lab. Click the Environment menu in the top right of the Postman window and click ‘Manage Environments’:

|primer-2.9|

10. Click the **F5 SecDevOps** item:

|primer-2.10|

11. Update the value for ‘big_ip_a_auth_token’ by Pasting (Ctrl-v) in your auth token:
12. Click the ‘Update’ button and then close the ‘Manage Environments’ window. You’re subsequent requests will now automatically substitute the token's value where the **{{big_ip_a_auth_token}}** environmental variable is used.

|primer-2.12|

13. Click the **4: Set Authentication Token Timeout** item in the **Lab 1.2 - API Authentication** Postman collection. This request will PATCH your token Resource (check the URI) and update the timeout attribute so we can complete the lab easily. Examine the request type and JSON Body and then click the ‘Send’ button. Verify that the timeout has been changed to ‘36000’ in the response:

|primer-2.13|

