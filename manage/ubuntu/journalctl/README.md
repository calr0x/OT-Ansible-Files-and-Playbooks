#THIS ONLY SUPPORTS DOCKERLESS INSTALLS. IT WILL NOT WORK ON DOCKER-INSTALLED NODES

__set-log-limits.sh__

This module will first prune the logs to a user-defined size and will limit future logs to that same size. Journalctl will auto delete beyond this size automatically.

Settings to edit:
size_limit (Default setting is fine for most people)

To run:
```
/root/OT-Ansible-Files-and-Playbooks/manage/ubuntu/journalctl/set-log-limits.sh
```
Ansible users:  
execute ansible-set-log-limits.yml