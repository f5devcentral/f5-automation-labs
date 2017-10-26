Conclusion
==========

.. graphviz::

   digraph breadcrumb {
        rankdir="LR"
        ranksep=.4
        splines=ortho
        node [fontsize=10,style="rounded,filled",shape=box,color=palegreen,margin="0.05,0.05",height=0.1] 
        fontname = "arial-bold" 
        fontsize = 10
        labeljust="l"
        consumer [label="AppDev, DevOps, NetOps",color="gray72"]
        environment [label="Environment",color="gray72"]
        subgraph cluster_class1 {
            style = "rounded,filled"
            color = lightgrey
            height = .75
            label = "Class 1: Introduction to Automation & Orchestration"
            bigip [label="BIG-IP"]
            iapps [label="iApp Templates&#92;n& Deployments"]
            iwf [label="iWorkflow Service Templates,&#92;nCatalog & Deployment"] 
            {
                rank=same
                rest_basics [label="REST Basics"]
                authentication [label="Authentication"]
                globalsettings [label="Global Settings"]
                networking [label="Networking"]
                clustering [label="Clustering"]
                transactions [label="Transactions"]
                rest_basics -> authentication -> globalsettings -> networking -> clustering -> transactions -> bigip
            }
            {    
                rank=same
                iapp_basics [label="iApp Basics"]
                iapp_templates [label="iApp Templates"]
                iapp_deployments [label="iApp Deployments"]
                iapp_basics -> iapp_templates -> iapp_deployments -> iapps
            }
            {
                rank=same
                onboarding [label="Basics"]
                templates [label="Templates"]
                catalog [label="Catalog"]
                deployments [label="Deployments"]
                onboarding -> templates -> catalog -> deployments -> iwf             
            } 
        }
        consumer -> iwf -> iapps -> bigip -> environment
   }

In this class we learned the base concepts and skills required to effectively
automate the F5 |bip| platform.  The diagram above shows a high-level view of
the different components to this base level of knowledge. In subsequent classes 
we will expand on the core concepts and knowledge learned in this class. 

This content has been created with a DevOps methodology and fully Continuous
Toolchain.  All content contained here is sourced from the following GitHub
repository:

https://github.com/f5devcentral/f5-automation-labs/

Bug Reports and Requests for Enhancement are handled in two ways:

- Fork the Github Repo, fix or enhance as required, and submit a Pull Request
  
  - https://help.github.com/articles/creating-a-pull-request-from-a-fork/

- Open an 
  `Issue <https://github.com/f5devcentral/f5-automation-labs/issues>`_ within
  the repository.

Lastly, this content would not be possible without the contributions from many
F5 Employees, Partners, and Customers.  A full list of contributors to this 
content can be found at:

https://github.com/f5devcentral/f5-automation-labs/graphs/contributors
