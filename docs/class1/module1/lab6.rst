.. |labmodule| replace:: 1
.. |labnum| replace:: 6
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Build a Basic LTM Config
------------------------------------------------------

In this lab we will build a basic LTM Config using the Imperative
automation model. While this lab may seem simple for basic
configurations, the complexity involved with rich L4-7 services quickly
makes the Imperative approach untenable for advanced configurations. The
Imperative model relies on the user having in-depth knowledge of device
specifics such as:

-  Object types and their attributes

   -  How many different objects/profiles/options do we have?

-  Order of operations

   -  Monitor before pool before profiles before virtual servers, etc.

   -  What about L7 use cases like WAF?

      -  WAF Policy -> HTTP Policy -> Virtual Server

-  How does this all get deleted?

   -  You have to reverse the order of operations and ‘undo’ the whole
      config

      -  TMOS has lots of issues here

As a result of this it’s recommended for customers to use Imperative
automation only for legacy environments. New environments should shift
to a Declarative model.

Task 1 – Build a Basic LTM Config
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Perform the following steps to complete this task:

#. Expand the “Lab 1.6 – Build a Basic LTM Config” folder in the Postman
   collection

#. Click each Step in the folder and ‘Send’ the request. Verify each
   component is created on the BIG-IP device using the GUI.

#. After the steps are completed you should be able to connect to
   http://10.1.20.129 in your browser.

   