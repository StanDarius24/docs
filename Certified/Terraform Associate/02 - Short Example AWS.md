

An **Amazon VPC (Virtual Private Cloud)** is your own **private, isolated network** inside AWS where you can run resources like EC2 instances, databases, and containers — all with full control over networking

Think of it like renting an entire gated neighborhood in the AWS cloud:

- You decide the **streets and house numbers** (IP address ranges).
- You control **who gets in or out** (security rules and routing).
- You choose **where in the world** it’s located (AWS region and Availability Zones)

---

### Key Features of a VPC

1. **Custom IP Address Range**
    - Defined by a **CIDR block** (e.g., `10.0.0.0/16`).

2. **Subnet Segmentation**
	- You divide your VPC into **subnets** for organizing resources and controlling traffic.

3. **Routing Control**
    - Route tables decide where network traffic goes (e.g., to the internet, to another VPC, or to on-premises).
  
4. **Security Layers**
    - **Security groups** (instance-level firewall)
    - **Network ACLs** (subnet-level firewall)

5. **Connectivity Options**
    - **Internet Gateway** → allows public internet access
    - **NAT Gateway** → lets private subnets initiate outbound traffic without being exposed
    - **VPC Peering / Transit Gateway** → connects multiple VPCs

If AWS is the whole world, your **VPC is your private country**. Inside, you build **subnets** (cities), put resources in them (houses), and control who gets in, who gets out, and which roads exist between them.

---

#### 2. **Subnet**

- A **subnet** is a segment of your **VPC’s IP address range** where you can launch AWS resources.
- It’s tied to **one specific Availability Zone**.
- You create **public subnets** (with internet access via IGW) and **private subnets** (isolated or internet access via NAT).
- **Purpose:** Organize resources, control routing, and improve security.
    

**Analogy:** If your **VPC is a city**, a **subnet** is a neighborhood with its own roads, addresses, and rules.

---

#### 3. **Route Table**

- A set of **rules (routes)** that tell AWS:  
    _“For traffic going to X, send it to Y.”_
- Each subnet in a VPC is **associated** with exactly one route table.
- Routes can point to:
    - **Local** (default) → Other subnets in the same VPC
    - **Internet Gateway** → For internet access
    - **NAT Gateway** → For private subnet outbound internet
    - **VPC Peering Connection**
    - **Transit Gateway**
    - **VPN Gateway**
    - **Network Interface** (for advanced routing)

```hcl
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.demoVps.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.example.id
}

```

---

### 4. **Security Layers**

#### **Security Group (SG)**

- A **security group** is a **stateful firewall** that controls **inbound and outbound traffic** **for individual AWS resources** (like EC2 instances, RDS databases, etc.).
- **Stateful** means if you allow inbound traffic from an IP, the response traffic is automatically allowed out — you don’t need to add a separate outbound rule for it.
- Security groups work at the **instance (resource) level**, not at the subnet level.
- Rules are **allow only** — you can’t explicitly “deny” traffic here.

**Analogy:** The **security group** is the locked front door of your house — you decide which visitors can come in and what deliveries can go out.

---

## **Network ACL (NACL)**

- A **Network Access Control List** is a **stateless firewall** that controls **inbound and outbound traffic at the subnet level**.
- **Stateless** means inbound and outbound rules are separate — if you allow inbound on a port, you must also allow outbound on that port for return traffic.
- NACLs have both **allow** and **deny** rules, and they’re evaluated in **order**.
- They apply to **all resources inside the subnet**.

**Analogy:** The **NACL** is the gate to your neighborhood — it decides whether traffic is allowed in or out before it even reaches your house.

|Feature|Subnet|Security Group|Network ACL|
|---|---|---|---|
|Level|VPC segment|Instance/resource level|Subnet level|
|Stateful?|N/A|✅ Yes|❌ No|
|Allow/Deny|N/A|Allow only|Allow & Deny|
|Purpose|Group resources|Control instance traffic|Control subnet traffic|

#### **The Two Layers of Defense**

Think of them like **two security checkpoints** between the internet and your instance:

1. **Network ACL (NACL)** → Subnet-level guard
    - Checks all traffic **before** it even reaches any resources in the subnet.
    - Works like a “neighborhood gate.”
        
2. **Security Group (SG)** → Resource-level guard
    - Checks traffic **at the resource itself** (EC2, RDS, etc.).
	- Works like the “front door” of your house.

#### **Traffic Flow Example**

Let’s say you have a web server in a **public subnet** that should be reachable on port 80 (HTTP) from anywhere:

1. **Inbound from the Internet**
    - The request first passes through the **Internet Gateway (IGW)**.
    - Then, the **NACL** for that subnet is checked — must have an **ALLOW inbound rule** for port 80.
    - If allowed, the request reaches the EC2 instance’s **Security Group** — must also have an **ALLOW inbound rule** for port 80.
        
2. **Outbound Response**
    - EC2 sends the response out — SG allows it automatically (because it’s stateful).
    - NACL checks outbound rules separately — must have an **ALLOW outbound rule** for the relevant port (e.g., ephemeral ports).
    - Then traffic goes back through the IGW to the client.

| Feature              | Security Group (SG)                  | Network ACL (NACL)                               |
| -------------------- | ------------------------------------ | ------------------------------------------------ |
| **Scope**            | Resource level                       | Subnet level                                     |
| **Stateful**         | ✅ Yes — return traffic is automatic  | ❌ No — return traffic must be explicitly allowed |
| **Default Behavior** | Deny all inbound, allow all outbound | Allow all inbound and outbound                   |
| **Rules**            | Only allow rules                     | Allow and deny rules                             |
| **Common Use**       | Lock down individual instances       | Broad subnet-wide rules                          |

**Rule of Thumb**

- Use **Security Groups** for most day-to-day access control.
- Use **NACLs** for extra subnet-wide restrictions or to explicitly block certain traffic before it even reaches SGs.

---

### 5. ****Connectivity Options****

#### **Internet Gateway (IGW)**

A **gateway** in networking is simply a “way out” — it’s the device or service that connects one network to another.

In AWS, an **Internet Gateway**:
- Connects your **VPC** to the **public internet**.
- Handles **two-way traffic** (inbound and outbound) between AWS resources and the internet.
- Works at the **edge** of the VPC.
- Requires:
    - A **route table entry** pointing to it for internet-bound traffic.
    - Public IPs on resources if you want inbound internet connections.

**Analogy:** The **Internet Gateway** is like the front door of your building that opens onto the public street.

#### **NAT Gateway**

A **NAT (Network Address Translation) Gateway**:
- Allows **resources in a private subnet** to access the internet **outbound only** (e.g., to download updates or call APIs).
- Prevents **the internet from initiating inbound connections** to those resources.
- Lives in a **public subnet** so it can talk to the Internet Gateway.
- Translates **private IPs → public IP** for outgoing requests, then routes the responses back to the originating private IP.

**Analogy:** The **NAT Gateway** is like a receptionist in your office who:
- Can call the outside world on your behalf.
- Passes back the answers to you.
- Never lets strangers walk in from the street to your desk.

| Feature           | Internet Gateway (IGW)      | NAT Gateway                  |
| ----------------- | --------------------------- | ---------------------------- |
| Location          | Attached to VPC             | Public subnet                |
| Direction         | Inbound + Outbound          | Outbound only                |
| Used by           | Public subnets              | Private subnets              |
| Public IP needed? | Yes (for direct internet)   | Yes (on NAT GW itself)       |
| Example use case  | Web server open to internet | Database downloading patches |

### **VPC Peering**

- **Purpose:** Connect two VPCs so resources can talk to each other using **private IP addresses**.
- **Scope:** One-to-one connection between **two VPCs** (can be in same or different AWS accounts/regions).
- **Routing:** Each VPC must update its **route tables** to send traffic for the other VPC through the peering connection.
- **Limitations:**
    - No transitive routing (VPC A ↔ VPC B ↔ VPC C doesn’t work automatically).
    - You have to set up **separate peering connections** for each pair if you have many VPCs.

 **Analogy:** Like running a private cable between two offices — direct, simple, but doesn’t scale well if you have many offices.

### **Transit Gateway (TGW)**
- **Purpose:** Central hub for connecting **multiple VPCs, VPNs, and Direct Connect** in a “hub-and-spoke” model.
- **Scope:** Many-to-many connection — all attached networks can talk through the TGW.
- **Routing:** Each VPC/VPN has a route to the TGW, and the TGW itself has a central routing table.
- **Benefits:**
    - Scales easily — one TGW can connect hundreds of VPCs.
    - Supports transitive routing (VPC A can reach VPC C via TGW without separate connections).
- **Cost:** More expensive than VPC peering — charged per attachment and per GB of data processed.

**Analogy:** Like building a big city’s central train station — all train lines (VPCs, VPNs) connect here, and passengers (data) can transfer between them easily.

| Feature            | VPC Peering         | Transit Gateway                |
| ------------------ | ------------------- | ------------------------------ |
| Connections        | 1-to-1              | Many-to-many                   |
| Transitive routing | ❌ No                | ✅ Yes                          |
| Scale              | Small to medium     | Large/multi-VPC                |
| Cost               | Low (no hourly fee) | Higher (per attachment & data) |
| Setup complexity   | Simple              | More complex                   |

---


![[Pasted image 20250813151456.png]]

![[Pasted image 20250813162451.png]]
