# __OT-Ansible-Files-and-Playbooks__
Ansible is an open-source platform that allows deployments of configurations on a whole network of servers all at once using one single control computer.

This repository will use Ansible to install and configure Ubuntu and OriginTrail nodes simultaneously on as many servers as you need. 

You can setup one, two, or *hundreds* of servers at the same time and monitor them all at once !

## __Prerequisites :__
- Linux OS (seperate from your nodes)
  -  Look into VirtualBox https://www.virtualbox.org/, a Raspberry Pi or rent a distinct budget server
- Requires PYTHON3 on control computer
  - A workaround is possible for Raspberry Pis running Python 2.7
- Requires the repo OT-Settings https://github.com/calr0x/OT-Settings as many playbooks require data from the config.sh in OT-Settings
  - Follow the instructions there to setup config.sh
  - Other repos such as OT-Smoothbrain-Backup, OT-NodeWatch, OT-Docksucker will be installed by the playbooks automatically if required

## __Installing the repository :__
Let's begin by getting the repository to your local root directory
```
cd
```
```
git clone https://github.com/calr0x/OT-Ansible-Files-and-Playbooks.git
```
```
cd OT-Ansible-Files-and-Playbooks
```
Next, we want to make a local copy of the hosts-config-example file and name it __hosts-config__. 

You do not want to apply changes to config-otnode-ansible-original.yml file since this will be modified every time you want to git pull (ak update) your repository.
```
cp hosts-config-example hosts-config
```
Remember that you want to make all changes to __hosts-config__ and not hosts-config-example
```
nano hosts-config
```
You have the option to modify the hosts-config using nano, but I strongly suggest copying the content and using notepad to modify the variables as there are many of them. 

## __Changing the config file :__
You need as many of the below sections as the number of nodes you are setting up. Only two sections for two nodes are included in the template to demonstrate spacing between them. 

__Indentations are incredibly important.__ Make sure the sections you add line up properly. If you copy and paste the below, include the space before each line. 

There are __(4)__ spaces __before__ "replace" and __(2)__ spaces __between__ "node_name" and "replace" (6 total from left edge)

    replace_this_with_server1_domain_or_ip: #Exp. node1.server.com OR 23.34.45.56
      node_name: 'SERVER NAME IN TELEGRAM NOTIFICATIONS'
      op_pub_key: 'OPERATIONAL WALLET PUBLLIC KEY'
      op_priv_key: 'OPERATIONAL WALLET PRIVATE KEY'
      mgmt_pub_key: 'MANAGEMENT WALLET PUBLIC KEY'
      initial_deposit_amount: 'INITIAL DEPOSIT AMOUNT'

    replace_this_with_server1_domain_or_ip: #Exp. node2.server.com OR 23.34.45.57
      node_name: 'SERVER NAME IN TELEGRAM NOTIFICATIONS'
      op_pub_key: 'OPERATIONAL WALLET PUBLLIC KEY'
      op_priv_key: 'OPERATIONAL WALLET PRIVATE KEY'
      mgmt_pub_key: 'MANAGEMENT WALLET PUBLIC KEY'
      initial_deposit_amount: 'INITIAL DEPOSIT AMOUNT'

Here is an example :

```
otnodes:
  children:
    newnodes:
      hosts:
        24.54.132.122:
          node_name: 'otnode1'
          op_pub_key: '0x3489nf98f948m589tm85mg'
          op_priv_key: '3274t2364t26hnd329obnf0djf'
          initial_deposit_amount: '4000000000000000000000'

        otnode1.otnode.com:
          node_name: 'otnode2'
          op_pub_key: '0x3489ru8934ur3489ur34889ur'
          op_priv_key: '9r34ij90fi3490jfir9034ifj4i0ji34f3049'
          initial_deposit_amount: '4000000000000000000000'
    existingnodes:
      hosts:
        34.67.45.124:
          node_name: 'otnode3'

        otnode1.otnode.com:
          node_name: 'otnode4'
  vars:
    mgmt_pub_key: '0x349ir9034i90i490ir4i30ri0'
    dh_price_factor: '.1'
    dh_max_holding_time_in_minutes: '525600'
    aws_access_key_id: '09290ie0392iei23e90'
    aws_secret_access_key: '34j9d03j9d30j0dj0'
    telegram_bot_token: '0e923jek02s09k209s:0239ks20sk'
    telegram_chat_id: '989883433'
```
Edit each "replace_this_with_server1_domain_or_ip" with either the domain or IP address of each server, and make sure to keep spacing and colon at the end

Edit each variable inside the single quotes. Syntax is very important so make sure to keep the single quotes on each side at the end.

The "newnodes" section is for the creation of new dockerless nodes, which requires more information.

The "existingnodes" section is to integrate your current nodes into ansible and other monitoring scripts, which only requires a node name and IP.

If you used notepad to modify the config, press ctrl+k repeatedly on the config to delete every line from the template and paste the content of your notepad

If not, when you are done, press
```
ctrl+s
```
```
ctrl+x
```
## __Testing your configuration :__
The next step will send your working config file to the ansible host file, which will be sourced for all future Ansible module deployments. 

__If you ever modify your hosts-config file, make sure you repeat the previous step to correct the ansible host file.__
```
rm /etc/ansible/hosts && cp hosts-config /etc/ansible/hosts
```

The following command should generate a server tree
```
ansible-inventory --graph
```
If you are using SSH keys with a passphrase to log in to your nodes, do the following every time you reopen your control computer before running an Ansible playbook.

If you don't use SSH keys or don't have a SSH key passphrase, skip this step.
```
ssh-agent bash
```
```
ssh-add
```
Input your password and press *Enter*

If you log in as root with password only (no SSH key used), add *-k* to all ansible commands.
\
\
The below command will test if your config file was done properly.
```
ansible all -m ping
```
You might have to run the above command several times to save all fingerprints into your authorized_host file. This command will test all your node servers. 

This module will return *pong* on successful contact with your servers. If there are any errors, make sure the hosts-config file is configured properly.

```
ansible-playbook NAME_OF_MODULE.yml
```
The above command will be how every Ansible module will be ran from now on if you are logged in as root on the node servers with an SSH key. 

## __Specifications:__

If you are logged in as root on your node servers with a password instead, add -k
```
ansible-playbook -k ansible/install-restic.yml
```
If you are logged in as a sudo user account on the node servers with a password, add -u REPLACE_WITH_USERNAME -b -k -K
```
ansible-playbook -u REPLACE_WITH_USERNAME -b -k -K ansible/install-restic.yml
```
If you are logged in as a sudo user account on the node servers with an SSH key, add -u REPLACE_WITH_USERNAME -b -K
```
ansible-playbook -u REPLACE_WITH_USERNAME -b -K ansible/install-restic.yml
```
---

That's it for the tutorial, if you have made it so far without any errors, congratulations !

Your control computer is now ready to deploy Ansible playbooks to your servers !

Remember to visit the OT-Settings repository to complete the configurations.

