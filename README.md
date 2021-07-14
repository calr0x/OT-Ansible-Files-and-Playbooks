# OT-Ansible-Files-and-Playbooks

This project install and configure Ubuntu, OriginTrail Node, and Cosmic Overlay, simultaneously on as many servers as you need. You can setup one, two, or *hundreds* of servers at the same time!

- REQUIRES LINUX OS TO RUN. YOU NEED A LINUX OS THAT IS NOT USING A SERVER THAT A NODE IS RUNNING ON. LOOK INTO VIRTUALBOX (https://www.virtualbox.org/) AS A WAY TO RUN LINUX ON YOUR DESKTOP OTHERWISE RENT A VPS SERVER TO USE THIS SOFTWARE.  
- REQUIRES PYTHON3 ON CONTROL COMPUTER.

THIS INSTALLER WILL **NOT** PERFORM THE ACTUAL INSTALLATION OF THE NODE. THE USER WILL BE REQUIRED TO LOG INTO EACH SERVER AND MANUALLY USE COSMIC'S SCRIPT TO INSTALL THE NODE. IT'S IMPORTANT TO MONITOR THIS PROCESS VISUALLY.

1. ALL COMMANDS ASSUME YOU ARE LOGGED IN AS ROOT.
2. cd
3. apt update && apt install ansible
4. git clone https://github.com/calr0x/OT-Ansible-Files-and-Playbooks.git
5. cd OT-Ansible-Files-and-Playbooks
6. nano config-otnodes-and-cosmic.yml
7. YOU NEED AS MANY OF THE BELOW SECTIONS AS THE NUMBER OF NODES YOU ARE SETTING UP. I HAVE INCLUDED TWO SECTIONS FOR TWO NODES TO DEMONSTRATE SPACING BETWEEN THEM. INDENTATIONS ARE INCREDIBLY IMPORTANT. MAKE SURE THE SECTIONS YOU ADD LINE UP PROPERLY. IF YOU COPY AND PASTE THE BELOW INCLUDE THE SPACE BEFORE EACH LINE.
HINT:

(4) SPACES **BEFORE** "REPLACE"
(2) SPACES BETWEEN "NODE_NAME" AND "REPLACE" (6 TOTAL FROM LEFT EDGE).

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

An example config:

```
---
otnodes:
  hosts:
    24.54.132.122:  # node1.server.com OR 23.34.45.56
      node_name: 'otnode1'
      op_pub_key: '0x3489ru8934ur3489ur34889ur'
      op_priv_key: '9r34ij90fi3490jfir9034ifj4i0ji34f3049'
      initial_deposit_amount: '4000000000000000000000'

    otnode1.otnode.com:  # node1.server.com OR 23.34.45.56
      node_name: 'otnode1'
      op_pub_key: '0x3489ru8934ur3489ur34889ur'
      op_priv_key: '9r34ij90fi3490jfir9034ifj4i0ji34f3049'
      initial_deposit_amount: '4000000000000000000000'
  vars:
    mgmt_pub_key: '0x349ir9034i90i490ir4i30ri0'
    dh_price_factor: '.1'
    dh_max_holding_time_in_minutes: '525600'
    aws_access_key_id: '09290ie0392iei23e90'
    aws_secret_access_key: '34j9d03j9d30j0dj0'
    telegram_bot_token: '0e923jek02s09k209s:0239ks20sk'
    telegram_chat_id: '989883433'
```
8. EDIT EACH "replace_this_with_server1_domain_or_ip" WITH EITHER THE DOMOAIN OR IP OF EACH SERVER.

EXP. "otnode1.domain.com" OR "22.33.44.55". MAKE SURE AND KEEP SPACING AND THE COLON AT THE END.

9. EDIT EACH VALUE **BETWEEN** THE SINGLE QUOTES. SYNTAX IS SUPER IMPORTANT SO JUST MAKE SURE THE VALUES YOU EDIT HAVE A SINGLE QUOTE ON EACH SIDE OF IT.

10. When finished:

ctrl+o (TO SAVE)
Press <enter>
ctrl-x (TO EXIT)

11. ansible-inventory --graph (SHOULD GENERATE A SERVER TREE)
12. ansible all -m ping

THIS WILL TEST EVERYTHING BY PINGING YOUR SERVERS. LOOK FOR ANY ERRORS IN THE RESULTS OF THIS COMMAND. IF THERE ARE ANY ERRORS CORRECT THE ERRORS BY RETURNING TO STEP 6.

12. rm /etc/ansible/hosts && cp config-otnodes-and-cosmic.yml /etc/ansible/hosts

---

__HOW YOU RUN ANSIBLE CHANGES BASED ON THE FOLLOWING:__

- SSH KEY PROTECTED WITH A PASSPHRASE? ALWAYS RUN THESE TWO COMMANDS BEFORE RUNNING ANSIBLE (SSH KEYS WITHOUT A PASSPHRASE NEED NO ADDTIONAL WORK):

  __ssh agent bash__  
  __ssh-add__  
  __TYPE YOUR PASSPHRASE AND PRESS ENTER__

- LOGIN AS ROOT WITH PASSWORD (NO SSH KEY USED):

  ADD __-k__ TO ALL ANSIBLE COMMANDS

___

13. ansible-playbook install-complete.yml

EVERYTHING IS NOW READY TO RUN COSMIC_OVERLAY!

BE AWARE: IF YOU PREVIOUSLY FOLLOWED COSMIC'S DIRECTIONS (ON HIS SITE) ON A PREVIOUS INSTALL WHEN YOU FINISHED INSTALLING THE NODE YOU WOULD NORMALLY NEED TO MANUALLY START HIS SCRIPTS. THIS INSTALLER **DOES** START THOSE SCRIPTS FOR YOU. THEY ARE ALREADY RUNNING AT THIS POINT. :)

14. Connect to each server in your preferred SSH client (Terminus/Putty/etc) as root.
15. cd Cosmic_OverlayV2
16. node start_overlay.js
17. Choose "[1] - Install Menu"
18. Choose "[1] - Install a new node"
19. Follow any prompts.

DONE!
