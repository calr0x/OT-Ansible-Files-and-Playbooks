# __Limit journal logs__
### __NOTE: THIS ONLY SUPPORTS DOCKERLESS INSTALLS. IT WILL NOT WORK ON DOCKER-INSTALLED NODES. IF YOU DON'T KNOW WHICH YOU ARE RUNNING IT IS A DOCKER-INSTALLED NODE.__
\
This module will first prune the logs to a user-defined size and will limit future logs to that same size. Journalctl will auto delete beyond this size automatically.
\
\
__Change log size limit :__ (OPTIONAL) 
```
nano /root/OT-Ansible-Files-and-Playbooks/manage/ubuntu/journalctl/set-log-limits.sh
```
```
ctrl+s ctrl+x
```

\
__Run log limiter script :__
```
./root/OT-Ansible-Files-and-Playbooks/manage/ubuntu/journalctl/set-log-limits.sh
```


# __Ansible users:__
```
ansible-playbook /root/OT-Ansible-Files-and-Playbooks/manage/ubuntu/journalctl/ansible-set-log-limits.yml
```