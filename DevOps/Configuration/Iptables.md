#devops 

A table is a collection of chains that serves a particular function. The 3 main tables in iptables are the Filter, NAT, and Mangle tables.

-   The **Filter Table** is used to control the flow of packets in and out of a system.
-   The **NAT Table** is used to redirect connections to other interfaces on the network.
-   The **Mangle Table** is used to modify packet headers.

---

### Chains

Chains are a list of rules that are processed in order.

There are 5 main chains in iptables:

-   Input: Used to manage incoming packets/connections to service or protocol.
-   Output: Outgoing packet after it has been created/processed.
-   Forward: Forwards incoming packets from their source to destination (routing).
-   Prerouting: After the packet enters the network interface.
-   Postrouting: Before the packet leaves the network interface after the routing decision has been made.

---

### Understanding Packet Flow

Incoming packets are analyzed at each chain and are tested against a set of rules. If a rule is matched, the target is set. These are the targets available:

-   ACCEPT: Stop processing and lets the packet flow.
-   REJECT: Drops the packet with feedback.
-   DROP: Stops processing at the current chain and drops the packet.
-   LOG: Similar to ACCEPT, however, it is logged to the /var/log/messages.

---

default settings.

```bash
iptables -P INPUT ACCEPT 
iptables -P FORWARD ACCEPT 
iptables -P OUTPUT ACCEPT 

iptables -t nat -F 
iptables -t mangle -F 
iptables -F 

iptables -X
```

block all ip's except yours (ssh)

```bash
iptables -I INPUT ! -s `my ip` -p tcp --dport ssh -m state --state NEW,ESTABLISHED,RELATED -j REJECT
```

block ping

```bash
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP 
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
```

---

When a **packet** matches a **rule**, it is given a **target**, which can be another chain or one of these special values:

-   **ACCEPT** – will allow the packet to pass through.
-   **DROP** – will not let the packet pass through.
-   **RETURN** – stops the packet from traversing through a chain and tell it to go back to the previous chain.

It consists of three chains:

-   **INPUT** –  controls incoming packets to the server.
-   **FORWARD** – filters incoming packets that will be forwarded somewhere else.
-   **OUTPUT** – filter packets that are going out from your server.

Defining a rule means appending it to the chain. To do this, you need to insert the **-A** option (**Append**) right after the iptables command, like so:

`sudo iptables -A`

It will alert iptables that you are adding new rules to a chain. Then, you can combine the command with other options, such as:

-   **-i** (**interface**) — the network interface whose traffic you want to filter, such as eth0, lo, ppp0, etc.
-   **-p** (**protocol**) — the network protocol where your filtering process takes place. It can be either **tcp**, **udp**, **udplite**, **icmp**, **sctp**, **icmpv6**, and so on. Alternatively, you can type **all** to choose every protocol.
-   **-s** (**source**) — the address from which traffic comes from. You can add a hostname or IP address.
-   **–dport** (**destination port**) — the destination port number of a protocol, such as **22** (**SSH**), **443** (**https**), etc.
-   **-j** (**target**) — the target name (**ACCEPT**, **DROP**, **RETURN**). You need to insert this every time you make a new rule.

---

If you want to use all of them, you must write the command in this order:
```bash
sudo iptables -A <chain> -i <interface> -p <protocol (tcp/udp) > -s <source> --dport <port no.>  -j <target>
```


Once you understand the basic syntax, you can start configuring the firewall to give more security to your server.

A good exemple:

```bash
iptables -A INPUT -s `ip 1` -j ACCEPT
iptables -A INPUT -s `ip 2` -j ACCEPT

iptables -A INPUT -j DROP
```
 
using this type of configuration, we will block all ports, all requests that the server receive, but we leave them available for the ips defined above


**`iptables -A INPUT -m set ! --match-set allowed_ips src -j DROP`**

```
 iptables -P INPUT DROP
# iptables -P FORWARD DROP
# iptables -P INPUT DROP
# iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED --jump ACCEPT
# iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED --jump ACCEPT
# iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED,RELATED --jump ACCEPT
# iptables -A INPUT -m conntrack --ctstate INVALID --jump DROP
# iptables -A FORWARD -m conntrack --ctstate INVALID --jump DROP
# iptables -A OUTPUT  -m conntrack --ctstate INVALID --jump DROP

# iptables -A INPUT --in-interface lo --jump ACCEPT
# iptables -A OUTPUT --in-interface lo --jump ACCEPT
# iptables -A INPUT -p tcp -m tcp --source  X.X.X.X/32 --dport 443 -j ACCEPT
# iptables -A INPUT-p tcp -m tcp --source  X.X.X.X/32 --dport 22 -j ACCEPT
# debugging rules to help you set up.
# iptables -A INPUT -j LOG
# iptables -A FORWARD -j LOG 
# iptables -A OUTPUT -j LOG  
```

iptables -A INPUT -m set --match-set allowed_ips src -p tcp -j ACCEPT
iptables -A OUTPUT -m set --match-set allowed_ips src -p tcp -j ACCEPT


iptables -A INPUT -m set --match-set allowed_ips src -j ACCEPT

iptables -A INPUT -p tcp  -m set ! --match-set allowed_ips src --dport 443 -j DROP
iptables -A INPUT -p tcp  -m set ! --match-set allowed_ips src --dport 80 -j DROP
iptables -A INPUT -m set --match-set allowed_ips src -j ACCEPT



```bash
iptables -A INPUT -s 86.126.80.224 -j ACCEPT
#iptables -A INPUT -s 79.114.44.2 -j ACCEPT
iptables -A INPUT -s 87.234.212.138 -j ACCEPT
iptables -A INPUT -s 87.193.192.130 -j ACCEPT
iptables -A INPUT -s 31.18.255.149 -j ACCEPT
iptables -A INPUT -s 84.232.150.11 -j ACCEPT

iptables -A INPUT -s 41.227.28.90 -j ACCEPT
iptables -A INPUT -s 41.227.28.91 -j ACCEPT
iptables -A INPUT -s 41.227.28.92 -j ACCEPT
iptables -A INPUT -s 41.227.28.93 -j ACCEPT
iptables -A INPUT -s 41.225.7.154 -j ACCEPT
iptables -A INPUT -s 41.225.7.156 -j ACCEPT
iptables -A INPUT -s 41.225.7.155 -j ACCEPT
iptables -A INPUT -s 41.225.7.157 -j ACCEPT

iptables -A INPUT -j DROP
```


```
iptables -A INPUT -m set --match-set allowed_ips src -j ACCEPT
iptables -A INPUT -m set --match-set allowed_ips src -p tcp --dport 15765 -j ACCEPT
iptables -A INPUT                                -p tcp --dport 15765 -j DROP
```