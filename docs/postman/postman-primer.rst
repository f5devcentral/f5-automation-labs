Postman Primer
==============
This lab utilizes the Postman Chrome extension to facilitate the sending data to and recieving data from the iControl REST based API.

Lab 1.2 – REST API Authentication & ‘example’ Templates
-------------------------------------------------------
One of the many basic concepts related to interaction with REST API’s is how a particular consumer is authenticated to the system. BIG-IP, BIG-IQ and iWorkflow support two types of authentication: HTTP BASIC and Token based. It’s important to understand both of these authentication mechanisms, as consumers of the API will often make use of both types depending on the use case. This lab will demonstrate how to interact with both types of authentication.

Task 1 - Basic Authentication
-----------------------------
In this task we will use the Postman tool to send API requests using HTTP BASIC authentication. As its name implies this method of authentication encodes the user credentials via the existing BASIC authentication method provided by the HTTP protocol. The mechanism this method uses is to insert an HTTP header named ‘Authorization’ with a value that is built by Base 64 encoding the string “<username>:<password>”. The resulting header takes this form:

.. code-block:: rest

    Authorization: Basic YWRtaW46YWRtaW4=

It should be noted that cracking the method of authentication is TRIVIAL; as a result API calls should always be performed using HTTPS (F5 default) rather than HTTP.

Perform the following steps to complete this task:

1. Open the Postman tool by clicking the icon of the taskbar of your Windows Jumphost
2. To assist in multi-step procedures we make heavy use of the ‘Environments’ capability in Postman. This capability allows us to set various global variables that are then substituted into a request before it’s sent. When you open Postman please verify that your environment is set the **F5 SecDevOps** environment:

.. attention:: Include image

3. Click the ‘Collections’ tab on the left side of the screen, expand the ‘F5 SecDevOps’ collection on the left side of the screen, expand the **Lab 1.1 – API Authentication** folder:

(Ignore the # of requests on the screen below versus what you might see, the # of requests will grow and change as this lab grows)

.. attention:: Include image

4. Click the **Step 1: HTTP BASIC Authentication** item. Click the ‘Authorization’ tab and select ‘Basic Auth’ as the Type. Fill in the username and password (admin/admin) and click the ‘Update Request’ button. Notice that the number of Headers in the Headers tab changed from 1 to 2. This is because Postman automatically created the HTTP header and updated your request to include it. Click the ‘Headers’ tab and examine the HTTP header:

.. attention:: Include image

5. Click the ‘Send’ button to send the request. If the request succeeds you should be presented with a listing of the ‘/mgmt/tm/ltm’ Organizing Collection.

.. tip:: 
    Pay attention to the Status response i.e.

.. attention:: Include image

Task 2 - Token Based Authentication
-----------------------------------
One of the disadvantages of BASIC Authentication is that credentials are sent with each and every request. This can result in a much greater attack surface being exposed unnecessarily. As a result Token Based Authentication (TBA) is preferred in many cases. This method only sends the credentials once, on the first request. The system then responds with a unique token for that session and the consumer then uses that token for all subsequent requests. BIG-IP, BIG-IQ and iWorkflow support token-based authentication that drops down to the underlying authentication subsystems available in TMOS. As a result the system can be configured to support external authentication providers (RADIUS, TACACS, AD, etc) and those authentication methods can flow through to the REST API. In this task we will demonstrate TBA using the local authentication database, however, authentication to external providers is fully supported.

.. tip:: 
    For more information about external authentication providers see the section titled “About external authentication providers with iControl REST” in the iControl REST API User Guide available at https://devcentral.f5.com

Perform the following steps to complete this task:

1. Click the **Step 2: Get Authentication Token** item in the **Lab 1.1 – API Authentication** Postman Collection
2. Notice that we send a POST request to the ‘/mgmt/shared/authn/login’ endpoint. Additionally, BASIC Authentication is required on the initial token request:

3. Click the ‘Body’ tab and examine the JSON that we will send to BIG-IP to provide credentials and the authentication provider:

4. Modify the JSON body and add the required credentials (admin/admin). Then click the ‘Send’ button.
5. Examine the response status code. If authentication succeeded and a token was generated the response will have a 200 OK status code. If the status code is 401 then check your credentials:

Successful:

.. attention:: Include image

Unsuccessful:

.. attention:: Include image

6. Once you receive a 200 OK status code examine the response body. The various attributes show the parameters assigned to the particular token. Find the ‘token’ attribute and copy it into your clipboard (Ctrl+c) for use in the next step:

.. attention:: Include image

7. Click the **Step 3: Verify Authentication Works** item in the **Lab 1.1 – API Authentication** Postman collection. Click the ‘Headers’ tab and paste the token value copied above as the VALUE for the ‘X-F5-Auth-Token’ header. This header is required to be sent on all requests when using token based authentication.

.. attention:: Include image

8. Click the ‘Send’ button. If you’re request is successful you should see a ‘200 OK’ status and a listing of the ‘ltm’ Organizing Collection.
9. We will now update your Postman environment to use this auth token for the remainder of the lab. Click the Environment menu in the top right of the Postman window and click ‘Manage Environments’:

.. attention:: Include image

10. Click the **F5 SecDevOps** item:

.. attention:: Include image

11. Update the value for ‘big_ip_a_auth_token’ by Pasting (Ctrl-v) in your auth token:

.. attention:: Include image

12. Click the ‘Update’ button and then close the ‘Manage Environments’ window. You’re subsequent requests will now automatically include the token.

.. attention:: Include image

13. Click the ‘Step 4: Set Authentication Token Timeout’ item in the **Lab 1.1 – API Authentication** Postman collection. This request will PATCH your token Resource (check the URI) and update the timeout attribute so we can complete the lab easily. Examine the request type and JSON Body and then click the ‘Send’ button. Verify that the timeout has been changed to ‘36000’ in the response:

.. attention:: Include image

