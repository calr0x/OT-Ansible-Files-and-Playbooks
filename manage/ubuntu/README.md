# Ubuntu modules:

This folder contains various modules and playbooks that affect the docker container.



## __Daily server restart:__

---
### __Standard users:__
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
0 * * * * reboot
```
```
ctrl+s
```
```
ctrl+x
```
---
## Ansible users:

1. nano manage-daily-server-restart.yml
2. Edit the cron time (if desired)
3. ctrl+s ctrl+x
4. Execute manage-daily-docker-restart.yml.
---