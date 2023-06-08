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

![[Pasted image 20230606230622.png]]

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

![[Pasted image 20230607200408.png]]

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
