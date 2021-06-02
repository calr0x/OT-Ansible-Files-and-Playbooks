/*

Place the Netdata config files in this folder exactly as it appears in /etc/netdata including the filename and content.
Everything in here will be added to the /etc/netdata directory on all servers, and the netdata service will be restarted.
This will delete ALL the files in the directory before uploading!
The way your directory looks locally will be mirrored on all servers. Any files removed here will also be removed on the servers.

Alerts currently disabled:  
10s_ipv4_tcp_resets_received

/*
