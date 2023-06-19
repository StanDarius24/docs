---

---

1. Infrastructure as a Service (IaaS)
	- Provide building blocks for cloud IT
	- Provides networking, computers, data storage space
	- High level of flexibility
	- Easy parallel with traditional on-premises IT
1. Platform as a Service (PaaS)
	- Remove the need for your organization to manage the underlying infrastructure
	- Focus on the deployment and management of your applications
2. Software as a Service (SaaS)
	- Completed product that is run and managed by the service provider

![[Screenshot 2023-06-19 at 14.22.20.png]]

Infrastructure as a Service:
 - Amazon EC2 (on AWS)
 - GCP, Azure, Rackspace, Digital Ocean
Platform as a Service:
 - Elastic Beanstalk
 - Heroku, Google App Engine
Software as a Service:
 - Many AWS services (Rekognition)

---

1. How to choose an AWS Region?
 - `Compliance` with data governance and legal requirements: data never leaves a region without your explicit permission.
 - `Proximity` to customers: reduced latency.
 - `Available service` with a Region: new services and new features aren't available in every Region.
 - `Pricing` varies region to region and is transparent in the service pricing page.
2. AWS availability zones:
 - Each region has many availability zones. (ap-southeast-a2, ap-southeast-2b)
 - Each availability zone (AZ) is one or more discrete data centers with redundant power, networking, and connectivity.
 - They're separate from each other, so that they're isolated from disasters.
 - They're connected with high bandwidth, ultra-low latency networking.

## Shared Responsibility Model diagram

![[Screenshot 2023-06-19 at 14.23.01.png]]

## IAM (Identity and Access Management, Global service)
- Root account created by default, shouldn't be used or shared
- Users are people within your organization, and can be grouped
- Groups only contain users, not other groups
- Users don't have to belong to a group, and user can belong to multiple groups

### IAM Security Tools:
- IAM Credentials Report (account-level), a report that lists all your account's users and the status of their various credentials;
### IAM Access Advisor (user-level)
- Access advisor shows the service premissions granted to a user and when those services were last accessed.

---

Best practices:
- Don't use the root account except for AWS account setup;
- One physical user = One AWS user
- Assign users to groups and assign permissions to groups
- Create a strong password policy
- Use and enforce the use of MFA
- Create and use Roles for giving permissions to AWS services
- Use Access Keys for Programmatic Access
- Audit permissions for your account with the IAM Credentials Report
- Never share IAM users & Access Keys

---

### Shared Responsibility Model for IAM
1. AWS:
	- Infrastructure (global network security);
	- Configuration and vulnerability analysis;
	- Compliance validation;
2. You:
	- Users, Groups, Roles, Policies management and monitoring;
	- Enable MFA on all accounts;
	- Rotate all your keys often;
	- Use IAM tools to apply appropriate permissions;
	- Analyze access patterns & review permissions;

### Summary:
- Users: mapped to a pshysical user, has a password for AWS Console;
- Groups: contains users only;
- Policies: JSON document that outlines permissions for users or groups;
- Roles: for EC2 instances or AWS services;
- Security: MFA + Password Policy;
- AWS CLI: manage your AWS services using the command-line;
- AWS SDK: manage your AWS services using a programming language;
- Access Keys: access AWS using the CLI or SDK;
- Audit: IAM Credential Reports & IAM Access Advisor;

---

## Elastic Compute Cloud

#### 1. Amazon EC2

- EC2 is one of the most popular of AWS' offering
- EC2 = Elastic Compute Cloud = Infrastructure as a Service
- It mainly consists in the capability of:
	- Renting virtual machines (EC2)
	- Storing data on virtual drives (EBS)
	- Distributing load across machines (ELB)
	- Scaling the services using an auto-scaling group (ASG)
- Knowing EC2 is fundamental to understand how the Cloud works

EC2 User Data:
- It is possible to bootstrap our instances using an EC2 User data script.
- bootstrapping means launching commands when a machine starts
- That script is only run once at the instance first start
- EC2 user data is used to automate boot tasks such as:
	- Installing updates; software; downloading common files;
- The EC2 User Data Script runs with the root user.

EC2 Volumes:
- An EBS (Elastic Block Store) Volume is a network drive you can attach to your instances while they run;
- It allows your instances to persist data, even after their termination;
- They can only be mounted to one instance at a time (at the CPP level);
- They are bound to a specific availability zone;
- Analogy: Think of them as a "network USB stick";
- Free tier: 30GB of free EBS storage of General Purpose (SSD) or Magnetic per month.

EBS Volume:
- It's a network drive
	- It uses the network to communicate the instance, which means there might be a bit of latency
	- It can be detached from an EC2 instance and attached to another one quickly
- It's locked to an Availability Zone (AZ)
	- To move a volume across, you first need to snapshot it
- Have a provisioned capacity (size in GBs, and IOPS)

AMI = Amazon Machine Image
- AMI are a customization of an EC2 instance
	- You add your own software, configuration, operating system, ect.
	- Faster boot/config time bcs all your software is prepackaged
- AMI are built for a specific region
- You can launch EC2 instances from:
	- A Public AMI: AWS provided
	- Your own AMI: you make and maintain them yourself
	- An AWS Marketplace AMI: an AMI someone else made

EC2 Image Builder:
- Used to automate the creation of Virtual Machines or container images;
- => Automate the creation, maintain, validate and test EC2 AMIs;
- Can be run on a schedule;
- Free service

EC2 Instance Store
- EBS volumes are network drives with good but limited performance;
- If you need a high-performance hardware disk, use EC2 Instance Store;
- Better I/O performance;
- EC2 Instance Store lose their storage if they're stopped;
- Good for buffer/cache/scratch data/temporary content
- Risk of data loss if hardware fails;
- Backups and Replication are your responsibility;

EFS = Elastic File System
- Managed NFS (network file system) that can be mounted on 100s of EC2;
- EFS works with Linux EC2 instances in multi-AZ
- Highly available, scalable, expensive, pay per use, no capacity planning

EFS Infrequent Access (EFS-IA)
- Storage class that is cost-optimized for files not accessed every day;
- Up to 92% lower cost compared to EFS Standard;
- EFS will automatically move your files to EFS-IA based on the last time they were accessed;
- Enable EFS-IA with a LIfecycle Policy;
- Transparent to the applications accessing EFS.

Amazon FSx
- Launch 3rd party high-performance file systems on AWS;
- Fully managed service;
- For windows
	- A fully managed, highly reliable, and scalable Windows native shared file system;
	- Build on Windows File Server
	- Supports SMB protocol & Windows NTFS
	- Integrated with Microsoft Active Directory
- For Lustre
	- A fully managed, high-performance, scalable file storage for High Performance Computing (HPC)
	- The name Lustre is derived from "Linux" and "Cluster"
	- Machine Learning, Analytics, VIdeo Processing, etc.
	- Scales up to 100s GB/s, millions of IOPS, sub-ms latencies

### Summary:
- EBS VOLUMES:
	- network drives attached to one EC2 instance at a time
	- mapped to an Availability zones
	- can use EBS snapshots for backups/transferring EBS volume across AZ
- AMI: Create redy-to-use EC2 instances with our customizations
- EC2 Image Builder: automatically build, test and distribute AMIs
- EC2 Instance Store:
	- High performance hardware disk attached to our EC2 instance
	- Lost if our instance is stopped/terminated
- EFS: network file system, can be attached to 100s of instances in a region;
- EFS-IA: cost-optimized storage class for infrequent accessed files;
- FSx for Windows: Network File System for Windows servers;
- FSx for Lustre High Performance Computing Linux file system.