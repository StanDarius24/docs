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
/usr/sbin/iptables -P INPUT ACCEPT 
/usr/sbin/iptables -P FORWARD ACCEPT 
/usr/sbin/iptables -P OUTPUT ACCEPT 

/usr/sbin/iptables -t nat -F 
/usr/sbin/iptables -t mangle -F 
/usr/sbin/iptables -F 

/usr/sbin/iptables -X 
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
