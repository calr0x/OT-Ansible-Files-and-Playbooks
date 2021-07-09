__Docker modules:__

This folder contains various modules and playbooks that affect the docker container.

__Daily Docker restart:__  

---
## Standard users:
To schedule this job in the servers Cron:

```
Login as root
```
```
crontab -e
```
Press "1" (if asked)   

On a new line paste the following:

```
0 * * * * docker restart otnode
```
```
ctrl+s
```
```
ctrl+x
```
---
## Ansible users:

1. nano manage-daily-docker-restart.yml
2. Edit the cron time (if desired)
3. ctrl+s ctrl+x
4. Execute manage-daily-docker-restart.yml.
---