.. |labmodule| replace:: 5
.. |labnum| replace:: 4
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum| – update\_pool\_member\_state.py
------------------------------------------------------------

One of the most common tasks asked for by customers is the ability to
set a pool member’s state via a script. We have included an example of
such a script in the lab that can be used to see how easy
it is to automate specific operational tasks.

Task 1 – Run update\_pool\_member\_state.py
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#. In the command prompt type 
   ``python update_pool_member_state.py 10.1.1.4 test_pool 10.1.10.100:80 disabled``
   and examine the output.

#. Verify the pool member was disabled via TMUI

#. Re-run the script with as 
   ``python update_pool_member_state.py –-help`` to see additional options.

#. Re-enable the pool member using the script
