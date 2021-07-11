# __Ubuntu modules__

This folder contains various modules and playbooks that affect your server. 

If you run more than 2 nodes, using ansible is highly recommended.

# Ansible users:

Replace MODULE_NAME_HERE by the module name you want to execute on your nodes
```
nano /root/OT-Ansible-Files-and-Playbooks/manage/ubuntu/MODULE_NAME_HERE.yml
```

Begin by reading the commented out section on each module

When you are done editing the variables, 

```
ctrl+s
```
```
ctrl+x
```
```
ansible-playbook /root/OT-Ansible-Files-and-Playbooks/manage/ubuntu/MODULE_NAME_HERE.yml
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
