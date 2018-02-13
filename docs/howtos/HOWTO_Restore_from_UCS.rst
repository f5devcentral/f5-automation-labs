HOWTO - Restore a BIGIP from UCS
--------------------------------

This HOWTO document describes the changes required to restore a BIGIP
in the Lab Environment

Situations from the lab may cause the need to restore a BIGIP, the lab is
seeded with 3 UCS files per BIGIP (matching the modules) from different
parts of Class 1.

Credential reminder:
GUI: **admin\admin**
SSH: **root\default**

Task 1 - Import the existing UCS into BIG-IP
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

UCS files are located in the **in_case_of_emergency** folder on desktop of
the Linux Jumphost

Complete the following steps:

#. Login to the BIG-IP GUI
#. Click System -> Archives -> Upload
#. Click **Choose File** find the desired UCS in the specified folder and open
#. Click **Upload**

Task 2 - Use TMSH to restore the UCS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Because the dynamic license within this environment we must specify the
``no-license`` flag, which is only available via TMSH commands.

Complete the following steps:

#. Open **Root Terminal** from the Desktop
#. SSH in the BIGIP needing the UCS restore, example ``ssh root@10.1.1.10``
#. Issue the ``tmsh`` command to switch shells
#. To restore the specific UCS file issue the following command:
   ``load sys ucs (name_of_ucs) no-license``
