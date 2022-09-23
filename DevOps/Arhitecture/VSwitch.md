# what is vSwitch ?

vSwitch is also referred as vSphere Standard Switch. vSwitch is the software-based virtual networking switch used to connect virtual machines to ESXi host & it also provides the connectivity between the virtual machines on that virtual switch. vSphere Standard Switch is referred as vSwitch. Each ESXi host requires it’s own vSwitch.
	
vSwitch provides the connectivity between the virtual machines within ESXi Host, virtual machines on different ESXi Hosts & also provide the connectivity to the outside physical switch & network.vSwitch uses 3 components to provide the network connectivity.

---

**vSwitch Components:**

1. **VM Network:**  
    VM Network is Virtual Machine Network also called as VM Port group which is used to connect virtual machines to the Standard Switch. You can create multiple port groups on a single vswtich. You can also change name of vm port group & assign New Name which is called Network Label. Each netwrok label must be unique on the host.

2. **Management Network:**
	Management Network is also called as VM Kernel Port Group. It is the virtual adapter in the ESXi host. VM Kernel Port group requires the IP address. Management Network is responsible for all the management network related to esxi management network, vMotion, iSCSI storage connectivity, Virtual san traffic, NAS or NFS traffic, vSphere Fault Tolerance (FT) etc. VM Kernel Adapter are shown as vmk0,vmk1 etc.

3. **Physical Adapter:**
	Physical Adapter is the NIC card of the ESXi host. It is also called the Uplinks. It provides the Network connectivity of virtual machines to the outside physical network without uplinks virtual machine cannot connect to outside physical switch or network. Uplinks are shown as vmnic0, vmnic1 etc.

---

**vSwitch provides 3 extra settings:**

**Security:**  
vSwitch provides 3 types of security features such as Promiscous mode, MAC address changes & forged Transmists.

**Traffic Shaping:**  
vSwitch provides the Traffic Shaping feature to limit the traffic by using Average bandwidth (Kbit/s), Peak Bandwidth (Kbit/s) & Burst Size (KB).

**Teaming & Failover:**  
vSwitch provides the NIC Teaming & Failover options such as Load balancing, Network Failover Detection etc.

#devops 