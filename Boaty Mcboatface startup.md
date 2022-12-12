
stop opensuse firewall with command:

```bash
systemctl stop SuSEfirewall2
```

---

go to /opt/nexus -> last version of nexus

![[Screenshot 2022-11-28 at 20.41.00.png]]

As you can see, my last version is 3.27.0-03

then in /bin, run `/nexus start`

---

confluence / jira

```bash

cd /opt/atlassian/confluence
rm -rf /work/catalina.pid
./bin/startup

cd /opt/atlassian/jira
rm -rf /work/catalina.pid
./bin/startup
```

wait 5 min

---

*block all ip's except yours (ssh) [this is an example dont run this command]

```bash
iptables -I INPUT ! -s `my ip` -p tcp --dport ssh -m state --state NEW,ESTABLISHED,RELATED -j REJECT
```

block ping protocol [optional]

```bash
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP 
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
```

---

The best approach: we block everything and leave it accessible only for certain ips defined by us.

```bash
iptables -A INPUT -s 'ip 1' -j ACCEPT
iptables -A INPUT -s 'ip 2' -j ACCEPT

...

iptables -A INPUT -j DROP
```

so in our case:
```bash
boatymcboatface:~ # ipset list allowed_ips
Name: allowed_ips
Type: hash:ip
Revision: 4
Header: family inet hashsize 1024 maxelem 65536
Size in memory: 712
References: 6
Number of entries: 13
Members:
41.227.28.90
138.201.81.163
79.114.22.166
41.227.28.92
31.18.255.149
41.225.7.156
87.234.212.138
41.225.7.155
41.225.7.157
86.126.80.224
95.217.109.173
41.225.7.154
41.227.28.93
5.9.100.76
87.193.192.130
84.232.150.11
116.202.114.162
49.12.125.247
41.227.28.91
90.187.238.1
79.114.121.176
65.21.246.94
```

```bash
ipset create allowed_ips hash:ip
ipset add allowed_ips 86.126.80.224
ipset add allowed_ips 84.232.150.11
ipset add allowed_ips 41.227.28.91
ipset add allowed_ips 41.227.28.93
ipset add allowed_ips 41.225.7.157
ipset add allowed_ips 31.18.255.149
ipset add allowed_ips 87.234.212.138
ipset add allowed_ips 41.225.7.155
ipset add allowed_ips 41.227.28.92
ipset add allowed_ips 41.225.7.154
ipset add allowed_ips 41.225.7.156
ipset add allowed_ips 87.193.192.130
ipset add allowed_ips 41.227.28.90
ipset add allowed_ips 138.201.81.163
ipset add allowed_ips 95.217.109.173
ipset add allowed_ips 116.202.114.162
ipset add allowed_ips 49.12.125.247
ipset add allowed_ips 5.9.100.76
ipset add allowed_ips 79.114.22.166
ipset add allowed_ips 90.187.238.1
ipset add allowed_ips 79.114.121.176
ipset add allowed_ips 65.21.246.94
```


iptables -A INPUT -p tcp  -m set ! --match-set allowed_ips src --dport 443 -j DROP
iptables -A INPUT -p tcp  -m set ! --match-set allowed_ips src --dport 80 -j DROP
iptables -A INPUT -m set --match-set allowed_ips src -j ACCEPT

you can check if the port is `filtered` with command

```bash
sudo nmap -Pn `server ip`
```

