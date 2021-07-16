# __Ubuntu modules__

This folder contains various modules and playbooks that affect your server. 

If you run more than 2 nodes, using ansible is highly recommended.

__You must complete the steps written on the principal readme file to configure hosts-config before pursuing this__

# Ansible users:

Begin by editing the variables on hosts-config
```
cd OT-Ansible-Files-and-Playbooks 
```
```
nano  hosts-config
```
```
rm /etc/ansible/hosts && cp hosts-config /etc/ansible/hosts
```
When you are done, 

```
ctrl+s
```
```
ctrl+x
```
```
ansible-playbook /root/OT-Ansible-Files-and-Playbooks/PATH/TO/MODULE_NAME_HERE.yml
```

## Standard users:
---
This section only covers how to schedule a daily server restart to your node manually on each node. 

Other jobs will not be covered as part of this tutorial. Ansible is highly recommended to apply all jobs simultaneously to all nodes. 


### __Daily server restart__

To schedule this job in the server's Cron:

```
Login as root
```
```
crontab -e
```
Press "1" (if asked)   

On a new line paste the following:

```
0 * * * * reboot
```
```
ctrl+s
```
```
ctrl+x
```
---
