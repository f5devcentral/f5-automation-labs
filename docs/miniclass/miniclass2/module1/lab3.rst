Build F5 BIG-IP Provider
------------------------

Please follow the instructions provided by the instructor to start your
lab and access your jump host.

Expected time to complete: **15 mins**

This class covers the following topics:

- Downloading the big-ip terraform provider code package from https://github.com/f5devcentral/terraform-provider-bigip
- Building bigip terraform provider binary
- Creating .TF file for bigip and Initializing

#. Open terminal on the Client/Jumpbox VM and execute::

    go version

#. Change to f5student's home directory::

    cd

#. Create a directory workspace from the home directory::
 
    mkdir workspace

#. Change GOPATH to reference the workspace::

    export GOPATH=$HOME/workspace

#. Create directories as shown below as a placeholder for the repository::

    mkdir -p $GOPATH/src/github.com/f5devcentral

#. Change the directory to workspace::

    cd $GOPATH

#. Get the F5 BIG-IP Terraform provider code from github as shown::

    go get github.com/f5devcentral/terraform-provider-bigip

#. Change directory to the provider directory::

    cd src/github.com/f5devcentral/terraform-provider-bigip/

#. Build the F5 BIG-IP Terraform Provider binary::

    go build

#. Create TF file named **master.tf** using any editor. Insert the following content into it::

    provider "bigip" {
        address = "10.1.1.246"
        username = "admin"
        password = "admin"
    }

#. Now initialize the bigip provider plugin::

    terraform init

    Initializing provider plugins...

    Terraform has been successfully initialized!

.. NOTE:: For step 4, you can use the ``go env`` command to see the output

.. NOTE:: For step 9, you can use the ``ls -lrt`` command to see that ``terraform-provider-bigip`` is created

.. NOTE::
 All work for this lab will be performed exclusively from the Windows
 jumphost. No installation or interaction with your local system is
 required.

