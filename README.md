# OT-Ansible-Files-and-Playbooks
Playbooks and files to install, maintain, and install Origin Trail node software and Cosmic Overlay.

1. ALL COMMANDS ASSUME YOU ARE LOGGED IN AS ROOT.
2. cd
3. apt update && apt install ansible
4. git clone https://github.com/calr0x/OT-Ansible-Files-and-Playbooks.git
5. cd OT-Ansible-Files-and-Playbooks
6. nano config-otnodes-and-cosmic.yml
7. YOU NEED AS MANY OF THE BELOW SECTIONS AS THE NUMBER OF NODES YOU ARE SETTING UP. I HAVE INCLUDED TWO SECTIONS FOR TWO NODES TO DEMONSTRATE SPACING BETWEEN THEM. INDENTATIONS ARE INCREDIBLY IMPORTANT. MAKE SURE THE SECTIONS YOU ADD LINE UP PROPERLY. IF YOU COPY AND PASTE THE BELOW INCLUDE THE SPACE BEFORE EACH LINE.
HINT:

(4) SPACES **BEFORE** "REPLACE"
(2) SPACES BETWEEN "NODE_NAME" AND "REPLACE" (5 TOTAL FROM LEFT EDGE.

    replace_this_with_server1_domain_or_ip: #Server name or IP address
      node_name: 'SERVER NAME IN TELEGRAM NOTIFICATIONS'
      op_pub_key: 'OPERATIONAL WALLET PUBLLIC KEY'
      op_priv_key: 'OPERATIONAL WALLET PRIVATE KEY'
      mgmt_pub_key: 'MANAGEMENT WALLET PUBLIC KEY'
      initial_deposit_amount: 'INITIAL DEPOSIT AMOUNT'
 
    replace_this_with_server1_domain_or_ip: #Server name or IP address
      node_name: 'SERVER NAME IN TELEGRAM NOTIFICATIONS'
      op_pub_key: 'OPERATIONAL WALLET PUBLLIC KEY'
      op_priv_key: 'OPERATIONAL WALLET PRIVATE KEY'
      mgmt_pub_key: 'MANAGEMENT WALLET PUBLIC KEY'
      initial_deposit_amount: 'INITIAL DEPOSIT AMOUNT'

7. EDIT EACH "replace_this_with_server1_domain_or_ip" WITH EITHER THE DOMOAIN OR IP OF EACH SERVER.

EXP. "otnode1.domain.com" OR "22.33.44.55". MAKE SURE AND KEEP SPACING AND THE COLON AT THE END.

8. EDIT EACH VALUE **BETWEEN** THE SINGLE QUOTES. SYNTAX IS SUPER IMPORTANT SO JUST MAKE SURE THE VALUES YOU EDIT HAVE A SINGLE QUOTE ON EACH SIDE OF IT.

9. When finished:

ctrl+o (TO SAVE)
Press <enter>
ctrl-x (TO EXIT)
  
10. rm /etc/ansible/hosts && cp config-otnodes-and-cosmic.yml /etc/ansible/hosts
11. ansible-playbook install-config-node-and-cosmic.yml

EVERYTHING IS NOW READY TO RUN COSMIC_OVERLAY!

13. Connect to each server in your preferred SSH client (Terminus/Putty/etc) as root.
12. cd Cosmic_OverlayV2
13. node start_overlay.js
14. Choose "[1] - Install Menu"
15. Choose "[1] - Install a new node"
16. Follow any prompts.
