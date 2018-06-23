.. |labmodule| replace:: 3
.. |labnum| replace:: 2
.. |labdot| replace:: |labmodule|\ .\ |labnum|
.. |labund| replace:: |labmodule|\ _\ |labnum|
.. |labname| replace:: Lab\ |labdot|
.. |labnameund| replace:: Lab\ |labund|

Lab |labmodule|\.\ |labnum|\: Tune/fix security policy (Sec0ps)
===============================================================

Background: 
~~~~~~~~~~~~~

the application team tests came back and some of the tests have failed. the test result came back with the WAF blocking page.
 
 
Task 2.1 - Find which requests were blocked and resolve false-positive 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2.1.1 Clear false positive:
**************************	
- log on to the 'DEV' bigip. 
- go to 'traffic learning', 
- make sure you are editing the 'linux-high' policy. 
- check the requests that triggered suggestions. 

you should see a suggestion on 'High ASCII characters in headers' , examine the request. this is a false positive. the app uses a different language in the header and it is legitimate traffic. 
you can also see that the request comes from a trusted ip.
accept the suggestion.

	|Bigip-030|

2.1.2 Apply the policy :
**************************	

- apply the policy.

.. Note:: you are applying the policy to DEV,
   secops shouldn't change the policy running in production 
   ** unless there is a true emergency 
   

Task 2.2 - Save the WAF policy to the templates repo (managed by secops) 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

secops have updated the policy with a setting that makes sense to update on the general template. 
we will now export the policy from the bigip to the waf-policies repo (managed by secops)

2.2.1 Pull WAF policy from the bigip :
**************************

go back to jenkins, under the 'f5-rs-app2-dev' there is a job that will export the policy and save it to the git repo - :guilabel:`SEC export waf policy`

	|jenkins075|
   
click on this job and choose :guilabel:`Build with Parameters` from the left menu. 

	|jenkins080|
	
you can leave the defaults, it asks for two parameters. the first parameter is the name of the policy on the bigip and the other is the new policy name in the git repo.  

.. Note:: why saving the template with a different version ? 
   changes should be tracked, more than that we should allow app teams to 'control their own destiny' 
   allowing them to choose the right time and place to update the waf policy in their environment. 
   by versioning the policies we ensure their control over which template gets deployed. 
   
click on 'build' 

2.2.2 Check slack channel notification :
**************************

check the slack channel - you should see a message about the new security policy that's ready. 
this illustrates how chatops can help communicate between different teams. 

	|Slack-030|

the security admin role ends here. it's now up to Dave to run the pipeline again. 


   
.. |Bigip-030| image:: images/Bigip-030.PNG
   
.. |jenkins075| image:: images/jenkins075.PNG 
   
.. |jenkins080| image:: images/jenkins080.PNG
   
.. |Slack-030| image:: images/Slack-030.PNG