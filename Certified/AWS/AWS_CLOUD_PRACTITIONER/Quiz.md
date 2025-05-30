#AWS

- Set 1

1. You ONLY want to manage Applications and Data. Which type of Cloud Computing model should you use?

	a) On-premises -> you have to manage everything.
	b) Infrastructure as a Service (IaaS) -> you have to manage application & data & os & middleware
	c) Software as a Service(Saas) -> aws manages everything
	d) Platform as a Service (PaaS) -> you have to manage only the application and data layer

---

2. What is the pricing model of Cloud Computing?

	Pay-as-you-go pricing

---

3. Which Global Infrastructure identity is composed of one or more discrete data centers with redundant power, networking, and connectivity, and are used to deploy infrastructure?

	a) Edge Locations
	b) Availability Zones -> answer
	c) Regions

Regions are composed of Availability zones.

---

4. Which of the following is NOT one of the Five Characteristics of Cloud Computing?

	a) Rapid elasticity and scalability
	b) Multi-tenancy and resource pooling
	c) Dedicated Support Agent to help you deploy applications -> answer
	d) On-demand self-service

On-demand self-service, Resource pooling, Scalability and rapid elasticity, Pay-per-use pricing, Measured service, Resiliency and availability, Security, Broad network access

---

5. Which are the 3 pricing fundamentals of the AWS Cloud?

	a) Compute, Storage, and Data transfer in the AWS Cloud
	b) Compute, Networking, and Data transfer out of the AWS Cloud
	c) Compute, Storage, and Data transfer out of the AWS Cloud
	d) Storage, Functions, and Data transfer in the AWS Cloud

c)

---

6. Which of the following options is NOT a point of consideration when choosing an AWS Region?

	a) Compliance with data governance
	b) Latency
	c) Capacity availability
	d) Pricing

c) Capacity is unlimited in the cloud, you do not need to worry about it. The 4 points of considerations when choosing an AWS Region are: compliance with data governance and legal requirements, proximity to customers, available services and features within a Region, and pricing.

---

7. Which of the following is NOT an advantage of Cloud Computing?

	a) Trade capital expense (CAPEX) for operational expense (OPEX)
	b) Train your employees less
	c) Go global in minutes
	d) Stop spending money running and maintaining data centers

b) You must train your employees more so they can use the cloud effectively.

---

8. AWS Regions are composed of?

	a) Two or more Edge Locations
	b) One or more discrete data centers
	c) Two or more Availability Zones

c) AWS Regions consist of multiple, isolated, and physically separate Availability Zones within a geographic area.

---

9. Which of the following services has a global scope?
	a) EC2
	b) IAM
	c) Lambda
	d) Rekognition

b) IAM is a global service (encompasses all regions).

---

10. Which of the following is the definition of Cloud Computing?

	a) Rapidly develop, test and launch software applications
	b) Automatic and quick ability to acquire resources as you need them and release resources when you no longer need them
	c) On-demand availability of computer system resources, especially data storage (cloud storage) and computing power, without direct active management by the user
	d) Change resource types when needed

c) 

---

11. What defines the distribution of responsibilities for security in the AWS Cloud?

	a) AWS Pricing Fundamentals
	b) The Shared Responsibility Model
	c) AWS Acceptable Use Policy
	d) The AWS Management Console

b) The Shared Responsibility Model defines who is responsible for what in the AWS Cloud.

---

12. A company would like to benefit from the advantages of the Public Cloud but would like to keep sensitive assets in its own infrastructure. Which deployment model should the company use?

	a) Private Cloud
	b) Public Cloud
	c) Hybrid Cloud

c) Using a Hybrid Cloud deployment model allows you to benefit from the flexibility, scalability and on-demand storage access while keeping security and performance of your own infrastructure.

---

13. What is NOT authorized to do on AWS according to the AWS Acceptable Use Policy?

	a) Building a gaming application
	b) Deploying a website
	c) Run analytics on stolen content
	d) Backup your data

c) You can run analytics on AWS, but you cannot run analytics on fraudulent content. Refer to the AWS Acceptable Use Policy to see what is not authorized to do on AWS.

---

- Set 2:

1. What is a proper definition of IAM Roles?

	a) An IAM entity that defines a set of permissions for making AWS service requests, that will be used by AWS services
	b) IAM Users in multiple Groups
	c) A password policy
	d) Permissions assigned to Users to perform actions

a) Some AWS service will need to perform actions on your behalf. To do so, you assign permissions to AWS services with IAM Roles.

---

2. Which of the following is an IAM Security Tool?

	a) IAM Credentials Report
	b) IAM Root Account Manager
	c) IAM Services Report
	d) IAM Security Advisor

a) IAM Credentials report lists all your account's users and the status of their various credentials. The other IAM Security Tool is IAM Access Advisor. It shows the service permissions granted to a user and when those services were last accessed.

---

3. Which answer is INCORRECT regarding IAM Users?

	a) IAM Users can belong to multiple groups
	b) IAM Users don't have to belong to a group
	c) IAM Users can have policies assigned to them
	d) IAM Users access AWS with the root account credentials

d) IAM Users access AWS using a username and a password.

---

4. Which of the following is an IAM best practice?

	a) Don't use the root user account
	b) Create several users for a physical person
	c) Share credentials so a colleague can perform a task for you
	d) Do not enable MFA for easier access

a) You only want to use the root account to create your first IAM user, and for a few account and service management tasks. For every day and administration tasks, use an IAM user with permissions.

---

5. What are IAM Policies?

	a) AWS services performable actions
	b) JSON documents to define Users, Groups or Roles' permissions
	c) Rules to set up a password for IAM Users

b) An IAM policy is an entity that, when attached to an identity or resource, defines their permissions.

---

6. Under the shared responsibility model, what is the customer responsible for in IAM?

	a) Infrastructure security
	b) Compliance validation
	c) Configuration and vulnerability analysis
	d) Assigning users proper IAM Policies

d) Customers are responsible for defining and using IAM policies.

---

7. Which of the following statements is TRUE?

	a) The AWS CLI can interact with AWS using commands in your command-line shell, while the AWS SDK can interact with AWS programmatically.
	b) The AWS SDK can interact with AWS using commands in your command-line shell, while the AWS CLI can interact with AWS programmatically.

a) This statement is true.

---

8. Which principle should you apply regarding IAM Permissions?

	a) Grant most privilege
	b) Grant least privilege
	c) Grant permissions if your employee asks you to
	d) Restrict root account permissions

b) 

---

9. What should you do to increase your root account security?

	a) Enable Multi-Factor Authentication (MFA)
	b) Remove permissions from the root account
	c) Use AWS only through the Command Line Interface (CLI)

a) 

---

Set 3:

1. Which EC2 Storage would you use to create a shared network file system for your EC2 Instances?
	a) EBS Volume
	b) EC2 Instance Store
	c) EBS Snapshots
	d) EFS

d)

---

2. Which service can be used to automate image management processes?
	a) AMI
	b) EC2 Image Builder
	c) EBS Snapshots
	d) IAM

b)

---

3. Which of the following is a fully managed native Microsoft Windows file system?
	a) EFS
	b) FSx
	c) EBS

b)

---

4. What are AMIs NOT used for?
	a) Add your own software license
	b) Add your own configuration
	c). Add your own operating-system
	d) add your own IP addresses

d)

---

5. EBS Volumes CANNOT be attached to multiple EC2 instances at a time.
	a) True
	b) False

a)

---

6. An EBS Volume is a network drive you can attach to your instances while they run, so your instances' data persist even after their termination.
	a) True
	b) False

a)

---

7. Which statement is CORRECT regarding EC2 Instance Store?
	a) It is not good to use as a disk to cache content
	b) It has a better I/O performance, but the data is lost if the EC2 instance is terminated;
	c) Your data is always sage with EC2 Instance Store

b) 

---

8. Which statement is CORRECT regarding EC2 Instance Store?
	a) The operating-system on an EC2 Instance;
	b) A backup of your EBS Volume at a point in time;
	c) The amount of CPU and RAM of an EC2 Instance

b)

---

9. Where can you find a third party's AMI so you can use it to launch your EC2 Instance?
	a) Public AMIs
	b) My own AMIs
	c) AWS Marketplace AMIs

c)

---

10. What is an EBS Volume tied to?
	a) A region
	b) A data center
	c) An edge location
	d) An availability zone

d)

---

- Set 4

1. What is the main purpose of High Availability in the Cloud?
	a) Increase scalability
	b) Application thriving even in case of a disaster
	c) Access on computers and smartphones
	d) Handle greater loads by launching EC2 instances based on the demand

b)

---

2. Which of the following is NOT an Auto Scaling Strategy?
	a) Manual Scaling
	b) Dynamic Scaling
	c) Active Scaling
	d) Predictive Scaling

c)

---

3. Changing an EC2 Instance Type from a t3a.medium to a t3a.2xlarge is an example of?
	a) Horizontal scaling
	b) High Availability
	c) Agility
	d) Vertical scaling

d)

---

4. Which AWS service offers easy horizontal scaling of compute capacity?
	a) EBS
	b) AMI
	c) IAM
	d) ASG

d)

---

5. Which Load Balancer is best suited for HTTP/HTTPS load balancing traffic?
	a) Network Load Balancer
	b) Classic Load Balancer
	c) Elastic Load Balancer
	d) Application Load Balancer

d)

---

6. Which of the following statements is NOT a feature of Load Balancers?
	a) Do regular health checks to your instances
	b) Spread load across multiple downstream instances
	c) Handle failures of downstream instances
	d) Back-end autoscaling

d)

---

7. Which AWS offered Load Balancer should you use to handle hundreds of thousands of connections with low latency?
	a) Application Load Balancer
	b) Network Load Balancer
	c) Elastic Load Balancer

b)

---

8. What can you use to handle quickly and automatically the changing load on your websites and applications by adding compute resources?
	a) An Elastic Load Balancer
	b) A bigger instance type
	c) An Auto Scaling Group
	d) Health Checks on your EC2 Instances

c)

---

9. Which of the following statements is INCORRECT regarding Auto Scaling Groups?
	a) Replace unhealthy instances
	b) Are cost-effective by running at optimal capacity
	c) Automatically register new instances to a load balancer
	d) Automatically changing the EC2 Instances Types

d)

---

- Set 5

1. Which S3 Storage Class is the most cost-effective for archiving data with no retrieval time requirement?
	a) Amazon Glacier
	b) Amazon Glacier Deep Archive
	c) Amazon S3 Standard-Infrequent Access
	d) Amazon S3 Intelligent Tiering

b)

---

2. What hybrid AWS service is used to allow on-premises servers to seamlessly use the AWS Cloud at the storage layer?
	a) Elastic Block Store
	b) Snowball
	c) S3
	d) Storage Gateway

d)

---

3. Which of the following services is a petabyte-scale data moving service (as a fleet) in or out of AWS with computing capabilities?
	a) Snowcone
	b) Snowball Edge
	c) Snowmobile

b)

---

4. Which of the following is an exabytes-scale data moving service in or out of AWS?
	a) Snowcone
	b) Snowball Edge
	c) Snowmobile

c) 

---

5. What are Objects NOT composed of?
	a) key
	b) value
	c) access keys
	d) metadata

c)

---

6. Where are objects stored in Amazon S3?
	a) folders
	b) buckets
	c) files
	d) bin

b)

---

7. A research team deployed in a location with low-internet connection would like to move 5 TBs of data to the Cloud. Which service can it use?
	a) storage gateway
	b) snowball edge
	c) snowcone
	d) opshub

c) 

---

8. What can you use to define actions to move S3 objects between different storage classes?
	a) Scaling Policy
	b) Bucket Policies
	c) Lifecycle Rules
	d) Replication

c)

---

9. A non-profit organization needs to regularly transfer petabytes of data to the cloud and to have access to local computing capacity. Which service can help with this task?
	a) Snowball Edge - Storage Optimized
	b) Snowball Edge - Compute Optimized
	c) Snowcone
	d) Snowmobile

a)

---

10. Which S3 Storage Class is suitable for less frequently accessed data, but with rapid access when needed, while keeping a high durability and allowing an Availability Zone failure?
	a) Amazon S3 Standard - General Purpose
	b) Amazon Glacier
	c) Amazon S3 One Zone-Infrequent Access
	d) Amazon S3 Standard-Infrequent Access

d)

---

- Set 6

1. How do you get charged in AWS Lambda?
	a) Per programming language
	b) Per number of functions
	c) per call and per duration
	d) per inactive time

c)

---

2. You would like to launch Docker containers in AWS without worrying about provisioning or managing any infrastructure. The Docker containers will be used to host a heavy workloads to serve different types of requests. Some requests may need up to 30 minutes to be completed. Which AWS service should you use to run Docker containers in a Serverless way and satisfy the requirements?
	a) ECS
	b) Fargate
	c) ECR
	d) Lambda

b)

---

3. A complete cloud beginner would like to create a simple application with predictable pricing. What service should this person use?
	a) EC2
	b) Lambda
	c) Lightsail
	d) EasyStart

c)

---

4. What is the name of the software development platform that allows you to run applications the same way, regardless of where they are run?
	a) Dolphin
	b) Shark
	c) Docker
	d) ECS

c)

---

5. How would you best describe "event-driven" in AWS Lambda?
	a) Happens on a certain day
	b) Happens at a certain time
	c) Happens on a regular basis
	d) Happens when needed

d)

---

6. Which AWS service allows you to launch Docker containers on AWS, but requires you to provision and maintain the infrastructure?
	a) ECR
	b) EC2
	c) ECS
	d) Fargate

c)

---

7. Which of the following statements is INCORRECT regarding the definition of the term "serverless"?
	a) Serverless allows you to deploy functions as a service
	b) There are no servers
	c) You dont need to manage servers
	d) Lambda is the serverless pioneer

b)

---

8. Which of the following statements is NOT a feature of AWS Lambda?
	a) Integration with the whole AWS suite of services
	b) Virtual functions
	c) Automated and continuous scaling
	d) Definition of a minimum and a maximum of EC2 Instances running

d)

---

9. A company needs to run thousands of jobs but would like to NOT manage the compute resources. What service can it use?
	a) ECS
	b) EC2 Spot Instances
	c) EC2 Instances
	d) Batch

d)

---

10. Where should you store your private Docker images so they can be run by ECS or Fargate?
	a) Elastic Docker Registry
	b) Elastic Docker File Registry
	c) Elastic Container Registry
	d) Elastic Private Container Registry

c) 

---

11. Which AWS serverless service can be used by developers to create APIs?
	a) ECR
	b) Lambda
	c) API Gateway

c)

---

- Set 7

1. CodeStar can be used to monitor and check the health of an environment.
	a) true
	b) false

b)

---

2. Which AWS managed service allows to automate software deployments to a hybrid mix of EC2 Instances and On-Premises servers?
	a) CodeDeploy
	b) CloudFormation
	c) Elastic Beanstalk
	d) CodeStar

a)

---

3. You are a software developer working on a project with your team. You need a secure and reliable version control system to store, share, and collaborate your code with the team. Which AWS service can help the developers?
	a) CodeDeploy
	b) CodeCommit
	c) CodePipeline
	d) Cloud9

b)

---

4. You need a unified user interface that gives you visibility, control, and patching capabilities for your EC2 Instances on AWS, as well as for servers running in your on-premises data centers. Which service should you use?
	a) Storage Gateway
	b) OpsWorks
	c) Elastic Container Service
	d) Systems Manager

d)

---

5. You need to use Chef or Puppet. Which AWS service should you use?
	a) CloudFormation
	b) CodeDeploy
	c) OpsWorks
	d) CodeCommit

c)

---

6. A developer would like to deploy infrastructure on AWS but only knows Python. Which AWS service can assist him?
	a) Software Development Kid (SDK)
	b) Cloud Development Kit (CDK)
	c) CloudFormation
	d) CodeBuild

b)

---

7. Which of the following allows you to deploy any AWS Infrastructure as a Code?
	a) Elastic Beanstalk
	b) OpsWorks
	c) CloudFormation
	d) Systems Manager

c)

---

8. A new startup would like an online integrated development environment (IDE) to write, run, and debug code. Which AWS service can help with this task?
	a) Cloud9
	b) OpsWorks
	c) CodeArtifact
	d) CodeStar

a)

---

9. Which service is referred to as a Platform as a Service (PaaS)?
	a) Elastic Beanstalk
	b) OpsWorks
	c) CloudFormation
	d) EC2

a)

---

10. What is called the declaration of the AWS resources that make up a stack?
	a) CloudFormation Schemas
	b) CloudFormation Diagrams
	c) CloudFormation Templates
	d) CloudFormation Models

c)

---

11. Which of the following services can a developer use to store code dependencies?
	a) CodeBuild
	b) CodeCommit
	c) Cloud9
	d) CodeArtifact

d)

---

12. CodeStar can orchestrate the different steps to have code automatically pushed to production, while CodePipeline is a unified UI to easily manage software development activities in one place.
	a) true
	b) false

b) AWS CodePipeline is a fully managed continuous delivery service that helps you automate your release pipelines for fast and reliable application and infrastructure updates. CodeStar is used to quickly develop, build, and deploy applications on AWS with a unified user interface.

---

13. Which serverless service can be used to build code and run tests?
	a) CodeStar
	b) Cloud Development Kit (CDK)
	c) CodePipeline
	d) CodeBuild

d) AWS CodeBuild is a fully managed continuous integration service that compiles source code, runs tests, and produces software packages that are ready to deploy. With CodeBuild, you don’t need to provision, manage, and scale your own build servers, it is serverless.

---

14. CloudFormation and Elastic Beanstalk are free of use.
true

CloudFormation and Elastic Beanstalk are free of use, but you do pay for the resources created.

---

- Set 8

1. Which Route 53 Routing Policies would you use to route traffic to multiple resources in proportions that you specify?
	a) Simple Routing Policy
	b) Weighted Routing Policy
	c) Latency Routing Policy
	d) Failover Routing Policy

b)

---

2. Which service is optimized to deploy ultra-low latency applications to 5G devices?
	a) WaveLength
	b) Route 53
	c) CLoudFront

a) 

---

3. You need to enable fast, easy, and secure transfers of files over long distances on S3. Which service would you use?
	a) AWS Global Accelerator
	b) S3 Transfer Acceleration
	c) S3 Cross-Region Replication

b) Amazon S3 Transfer Acceleration enables fast, easy, and secure transfers of files over long distances between your client and an S3 bucket. Transfer Acceleration takes advantage of Amazon CloudFront’s globally distributed edge locations. As the data arrives at an edge location, data is routed to Amazon S3 over an optimized network path.

---

4. What does AWS CloudFront use to improve read performance?
	a) DDoS Protection
	b) S3 Buckets Fast-Read
	c) Caching Content in Edge Locations
	d) Caching Content in Edge Regions

c) 

---

5. Which service can be used to run AWS infrastructure and services on-premises for a hybrid cloud architecture?
	a) CloudFront
	b) Outposts
	c) DMS
	d) Storage Gateway

b)

---

6. Which of the following statements is NOT a reason for a global application?
	a) Decreased Latency
	b) Disaster Recovery
	c) Scale elastically on demand
	d) Attack protection

c)

---

7. Which features are available with Route 53?
	a) Health Checks, Auto Scaling, Routing Policy, DNS
	b) Load Balancing, DNS, Domain Registration, Monitoring
	c) Domain Registration, DNS, Health Checks, DDoS Protection
	d) Domain Registration, DNS, Health Checks, Routing Policy

d)

---

8. With which services does CloudFront integrate to protect against web attacks?
	a) WAF & Shield
	b) WAF & IAM
	c) IAM & Shield
	d) Security Groups & WAF

a) You can use AWS WAF web access control lists (web ACLs) to help minimize the effects of a distributed denial of service (DDoS) attack. For additional protection against DDoS attacks, AWS also provides AWS Shield Standard and AWS Shield Advanced.

---

- Set 9

1. A company using Apache ActiveMQ is migrating to the cloud. Which AWS service can it use to easily set up and operate its message brokers in the cloud?
	a) Amazon SQS
	b) Amazon SNS
	c) Amazon MQ
	d) Amazon Kinesis

c) Amazon MQ is a managed message broker service for Apache ActiveMQ and RabbitMQ that makes it easy to set up and operate message brokers in the cloud.

---

2. Which service is a fully managed pub/sub messaging service that makes it easy to set up, operate, and send notifications from the cloud, using a push-based system?
	a) Simple Notification Service (SNS)
	b) Simple Queue Service (SQS)
	c) Auto Scaling Groups (ASG)

a) Amazon Simple Notification Service (SNS) is a highly available, durable, secure, fully managed pub/sub messaging service that enables you to decouple microservices, distributed systems, and serverless applications. It uses a push-based system.

---

3. You can use Kinesis to perform real-time analysis from video streams.
	True, Amazon Kinesis makes it easy to collect, process, and analyze real-time, streaming data so you can get timely insights and react quickly to new information. Kinesis offers four services: Data Firehose, Data Analytics, Data Streams, Video Streams.

---

4. Which principle is mainly applied when using Amazon SQS or Amazon SNS?
	a) Scalability
	b) Automation
	c) Decouple your applications

c) When using SQS or SNS, you apply the "decouple your applications” principle. This means that IT systems should be designed in a way that reduces interdependencies—a change or a failure in one component should not cascade to other components.

---

5. Which service allows you to send, store, and receive messages between software components at any volume, without losing messages or requiring other services to be available, using a pull-based system?
	a) Simple Notification Service (SNS)
	b) Simple Queue Service (SQS)
	c) Auto Scaling Groups (ASG)

b) Amazon Simple Queue Service (SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications. It uses a pull-based system.

---

- Set 10

1. Which CloudWatch feature would you use to trigger notifications when a metric reaches a threshold you specify?
	 a) CloudWatch Events
	 b) CloudWatch Logs
	 c) CloudWatch Alarms
	 d) CloudWatch Triggers

c) The CloudWatch Alarms feature allows you to watch CloudWatch metrics and to receive notifications when the metrics fall outside of the levels (high or low thresholds) that you configure.

2. Which AWS service helps developers analyze and debug production as well as distributed applications?
	a) CloudWatch
	b) X-Ray
	c) Service Health Dashboard
	d) CloudTrail

b) AWS X-Ray helps developers analyze and debug production, distributed applications, such as those built using a microservices architecture.

3. Which AWS service provides alerts and remediation guidance when AWS is experiencing events that may impact you?
	a) Service Health Dashboard
	b) CloudWatch
	c) AWS health Dashboard
	d) CloudTrail
c) AWS Health Dashboard provides alerts and remediation guidance when AWS is experiencing events that may impact you.

4. You need to set up metrics monitoring for every service in AWS. Which service would you use?
	 a) CloudTrail
	 b) X-Ray
	 c) CloudWatch
	 d) Personal Health Dashboard

c) Amazon CloudWatch is a monitoring service for AWS cloud resources and the applications you run on AWS. You can use Amazon CloudWatch to collect and track metrics, collect and monitor log files, and set alarms.

5. Which service allows you to inspect, audit, and record events and API calls made within your AWS account?
	a) X-Ray
	b) CloudWatch
	c) CloudTrail

c) AWS CloudTrail is a web service that records activity made on your account and delivers log files to your Amazon S3 bucket. AWS CloudTrail is a service that enables governance, compliance, operational auditing, and risk auditing of your AWS account.

6. Which AWS service automatically analyzes code and provides performance recommendations?
	a) X-Ray
	b) CodePipeline
	c) CodeGuru

c) Amazon CodeGuru is a developer tool that provides intelligent recommendations to improve code quality and identify an application’s most expensive lines of code.

7. How would you describe Amazon CloudWatch Logs?
	a) A single, highly scalable service that centralizes the logs from all of your systems, applications, and AWS services that you use
	b) A service that provides a real-time stream of system events that describe changes in AWS resources
	c) A service that enables governance, compliance, operational auditing, and risk auditing of your AWS account
	d) A service that lets you run code without provisioning or managing servers

a) You can use Amazon CloudWatch Logs to monitor, store, and access your log files from Amazon Elastic Compute Cloud (Amazon EC2) instances, AWS CloudTrail, Route 53, and other sources.

8. If a resource is deleted in AWS, which service should you use to investigate first?
	a) CloudTrail
	b) CloudWatch Logs
	c) Personal Health Dashboard

a) CloudTrail can record the history of events/API calls made within you AWS account, which will help determine who or what deleted the resource. You should investigate it first.

---

- Set 11

1) Your private subnets need to connect to the Internet while still remaining private. Which AWS-managed VPC component allows you to do this?
	a) NAT Instance
	b) Internet Gateway
	c) Security Groups
	d) NAT Gateways

d) NAT Gateways allow your instances in your private subnets to access the Internet while remaining private, and are managed by AWS.

2) A public subnet is accessible from the Internet while a private subnet is not accessible from the Internet.
	a) Yes
	b) No, all subnets are accessible from the internet
	c) No, all subnets are not accessible from the internet

a) A public subnet is accessible from the Internet while a private subnet is not accessible from the Internet.

3) Which type of firewall has both ALLOW and DENY rules and operates at the subnet level?
	a) Network Access Control List (NACL)
	b) Web Application Firewall (WAF)
	c) Security Groups
	d) GuardDuty

a) A network access control list (NACL) is an optional layer of security for your VPC that acts as a firewall for controlling traffic in and out of one or more subnets. They have both ALLOW and DENY rules.

4) You would like to connect hundreds of VPCs and your on-premises data centers together. Which AWS service allows you to do link all these together efficiently?
	a) Site-to-Site VPN
	b) Transit Gateway
	c) Internet Gateway
	d) Direct Connect

b) Transit Gateway connects thousands of VPC and on-premises networks together in a single gateway.

5) A company needs two VPCs to communicate with each other. What can they use?
	a) VPC Endpoints
	b) AWS Direct Connect
	c) Internet Gateway
	d) VPC Peering

d) VPC Peering connection is a networking connection between two VPCs using AWS' network.

6) You need a logically isolated section of AWS, where you can launch AWS resources in a private network that you define. What should you use?
	a) Subnets
	b) Availability Zones
	c) A VPC
	d) NAT Instances

c) A virtual private cloud (VPC) is a virtual network dedicated to your AWS account. It is logically isolated from other virtual networks in the AWS Cloud. You can launch your AWS resources, such as Amazon EC2 instances, into your VPC.

7) A company needs to have a private, secure, and fast connection between its on-premises data centers and the AWS Cloud. Which connection should they use?
	a) AWS Connect
	b) Site-to-Site VPN
	c) VPC Peering
	d) AWS Direct Connect

d) AWS Direct Connect is a cloud service solution that makes it easy to establish a dedicated private network connection from your premises to AWS.

8) Your VPC needs to connect with the Internet. Which VPC component can help?
	a) NAT Gateways
	b) NAT Instances
	c) network ACL
	d) Internet Gateway

d) An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet.

---

- Set 12

1. Data sitting on an RDS instance would be referred to as?
	a) Data in transit
	b) Data in rest
	c) Encrypted data

b)

---

2. According to the Shared Responsibility Model, who is responsible for firewall and network configuration for EC2 Instances?
	a) AWS
	b) The customer
	c) AWS and the customer

b) The customer is responsible for firewall and network configuration. Customers are responsible for "Security IN the Cloud". It also includes server-side encryption, client-side data protection, customer data protection, etc.

---

3. Which of the following services can you use to discover and protect your sensitive data in AWS?
	a) Macie
	b) Shield
	c) Artifact
	d) X-Ray

a) Amazon Macie is a security service that uses machine learning to automatically discover, classify, and protect sensitive data in AWS, such as personally identifiable information (PII) or intellectual property.

---

4. Which AWS service lets you quickly find the root of potential security issues to take faster actions?
	a) Inspector
	b) Detective
	c) CloudWatch
	d) WAF

b) Amazon Detective makes it easy to analyze, investigate, and quickly identify the root cause of potential security issues or suspicious activities.

---

5. A company would like to protect its web applications from common web exploits that may affect availability, compromise security, or consume excessive resources. Which AWS service should they use?
	a) Auto Scaling Groups (ASG)
	b) Shield
	c) CloudHSM
	d) Web Application Firewall (WAF)

d) AWS WAF is a web application firewall that helps protect your web applications or APIs against common web exploits that may affect availability, compromise security, or consume excessive resources.

---

6. Where can you find on-demand access to AWS compliance documentation and AWS agreements?
	a) Artifact
	b) Personal Health Dashboard
	c) Secrets Manager
	d) Shared Responsibility Model

a) AWS Artifact is your go-to, central resource for compliance-related information that matters to you.

---

7. You can perform any kind of penetration testing on any AWS service without prior approval.

false

---

8. You want to record configurations and changes over time. Which service allows you to do this?
	a) Config
	b) Inspector
	c) GuardDuty
	d) Secrets Manager

a) AWS Config is a service that enables you to assess, audit, and evaluate the configurations of your AWS resources.

---

9. A company would like to secure network communications using SSL & TLS certificates. Which AWS service can it use?
	a) Certificate Manager (ACM)
	b) Secrets Manager
	c) Macie
	d) WAF

a) AWS Certificate Manager is a service that lets you easily provision, manage, and deploy public and private Secure Sockets Layer/Transport Layer Security (SSL/TLS) certificates for use with AWS services and your internal connected resources.

---

10. According to the Shared Responsibility Model, who is responsible for Patch Management?
	a) AWS
	b) The customer
	c) AWS and the customer

c) AWS is responsible for patching and fixing flaws within the infrastructure, but customers are responsible for patching their guest OS and applications. Shared Controls also includes Configuration Management, and Awareness and Training.

---

11. You want to centrally automate security checks across several AWS accounts. Which AWS service can you use?
	a) Macie
	b) Detective
	c) CloudTrail
	d) Security Hub

d) AWS Security Hub provides you with a comprehensive view of your security state within AWS and your compliance with security standards and best practices.

---

12. Which of the following services is managed by AWS and is used to manage encryption keys?
	a) CloudHSM
	b) KMS
	c) AWS Secrets Manager
	d) IAM

b) AWS KMS is a managed service that enables you to easily create and control the keys used for cryptographic operations. It is managed by AWS.

---

13. A company would like to automate security on EC2 instances to assess security and vulnerabilities in these instances. Which AWS service should it use?
	a) Config
	b) Trusted Advisor
	c) Inspector
	d) Systems Manager

c) Amazon Inspector is an automated security assessment service that helps improve the security and compliance of applications deployed on AWS. It helps you test the network accessibility of your Amazon EC2 instances and the security state of your applications running on the instances.

---

14. Which of the following actions does NOT require the root user?
	a) Close your AWS account
	b) Change your AWS Support plan
	c) Register as a reseller in the Reserved Instance Marketplace
	d) Access the billing dashboard

d) This is an action that does not require the root user. By default, only the root user can access the billing dashboard, but you can attach a policy to an IAM user for it to access the billing dashboard

---

15. According to the Shared Responsibility Model, who is responsible for protecting hardware?
	a) AWS
	b) The customer
	c) AWS and the customer

a) AWS is responsible for protecting hardware. AWS is responsible for "Security OF the Cloud". AWS is also responsible for the infrastructure that runs all services in the AWS Cloud, etc.

---

16. Which AWS service's ONLY role is to safeguard running applications from DDoS attacks?
	a) WAF
	b) Shield
	c) CloudFront
	d) KMS

b) Shield is only used to safeguard running applications from DDoS attacks.

---

17. Which service is a threat detection service that continuously monitors for malicious activity and unauthorized behavior to protect your AWS accounts and workloads?
	a) KMS
	b) WAF
	c) Inspector
	d) GuardDuty

d) Amazon GuardDuty is a threat detection service that continuously monitors for malicious activity and unauthorized behavior to protect your AWS accounts and workloads.

---

18. Which of the following options is NOT a situation where you should contact the AWS Abuse team?
	a) DDoS attack from AWS-owned IP addresses
	b) Spam from AWS-owned IP addresses or AWS resources
	c) Hosting objectionable or copyrighted content on AWS
	d) Losing your MFA device

 d) This is not a situation where you should contact the AWS Abuse team. The situations where you should contact the AWS Abuse team are: Spam, Port scanning, DoS or DDoS attacks, Intrusion attempts, Hosting objectionable or copyrighted content, Distributing malware.

---

- Set 13

1. You should use Amazon Transcribe to turn text into lifelike speech using deep learning.
	false

---

2. A company would like to implement a chatbot that will convert speech-to-text and recognize the customers' intentions. What service should it use?
	a) Transcribe
	b) Rekognition
	c) Connect
	d) Lex

d) Amazon Lex is a service for building conversational interfaces into any application using voice and text. Lex provides the advanced deep learning functionalities of automatic speech recognition (ASR) for converting speech to text, and natural language understanding (NLU) to recognize the intent of the text, to enable you to build applications with highly engaging user experiences and lifelike conversational interactions.

---

3. Which fully managed service can deliver highly accurate forecasts?
	 Forecast

---

4. You would like to find objects, people, text, or scenes in images and videos. What AWS service should you use?
	a) Rekognition
	b) Polly
	c) Kendra
	d) Lex

a) Amazon Rekognition makes it easy to add image and video analysis to your applications using proven, highly scalable, deep learning technology that requires no machine learning expertise to use.

---

5. A start-up would like to rapidly create customized user experiences. Which AWS service can help?
	a) Personalize
	b) Kendra
	c) Connect

a) Amazon Personalize is a machine learning service that makes it easy for developers to create individualized recommendations for customers using their applications.

---

6. A research team would like to group articles by topics using Natural Language Processing (NLP). Which service should they use?
	a) translate
	b) Comprehend
	c) Lex
	d) Rekognition

b) Amazon Comprehend is a natural language processing (NLP) service that uses machine learning to find meaning and insights in text.

---

7. A company would like to convert its documents into different languages, with natural and accurate wording. What should they use?
	a) Transcribe
	b) Polly
	c) Translate
	d) WordTranslator

c) Amazon Translate is a neural machine translation service that delivers fast, high-quality, and affordable language translation.

---

8. A developer would like to build, train, and deploy a machine learning model quickly. Which service can he use?
	a) SageMaker
	b) Polly
	c) Comprehend
	d) Personalize

a) Amazon SageMaker is a fully managed service that provides every developer and data scientist with the ability to build, train, and deploy machine learning (ML) models quickly. SageMaker removes the heavy lifting from each step of the machine learning process to make it easier to develop high quality models.

---

9. Which AWS service makes it easy to convert speech-to-text?
	a) Connect
	b) Translate
	c) Transcribe
	d) Polly

c) Amazon Transcribe is an AWS service that makes it easy for customers to convert speech-to-text.

---

10. Which of the following services is a document search service powered by machine learning?
	a) Forecast
	b) Kendra
	c) Comprehend
	d) Polly

b) Amazon Kendra is a highly accurate and easy to use enterprise search service that’s powered by machine learning.

---

- Set 14

1. Which tool allows you to centrally manage all users and roles permissions in your organization?
	a) Technical Account Manager (TAM)
	b) Service control policies
	c) IAM
	d) Config

b) Service control policies (SCPs) are a type of organization policy that you can use to manage permissions in your organization. An SCP spans all IAM users, groups, and roles, including the AWS account root user.

---

2. You would like to automatically set up and govern a secure multi-account AWS environment with best practices for your organization. Which AWS tool can you use?
	a) Control Tower
	b) Organizations
	c) Trusted Advisor
	d) Security Hub

a) AWS Control Tower offers the easiest way to set up and govern a new, secure, multi-account AWS environment. It establishes a landing zone that is based on best-practices blueprints, and enables governance using guardrails you can choose from a pre-packaged list.

---

3. A company would like recommendations regarding its performance, security, and fault tolerance. What can it use?
	a) Inspector
	b) Config
	c) Trusted Advisor
	d) Technical Account Manager

c) AWS Trusted Advisor is an online tool that provides you real time guidance to help you provision your resources following AWS best practices, including performance, security, and fault tolerance, but also cost optimization and service limits.

---

4. Which of the following is INCORRECT regarding AWS Organizations?
	a) Manage multiple AWS accounts
	b) Consolidated billing across all accounts
	c) Volume discounts from aggregated usage
	d) Faster access to the AWS Support

d) AWS Organizations does not offer faster access to the AWS Support.

---

5. What is the most cost-effective option to have 24x7 phone, email, and chat support?
	a) Basic Support Plan
	b) Developer Support Plan
	c) Enterprise Support Plan
	d) Business Support Plan

d) Business Support Plan is the most cost-effective option that offers 24x7 phone, email, and chat support.

---

6. What can you use to estimate the cost of your architecture solution?
	a) Simple Monthly Calculator/Pricing Calculator
	b) Cost and Usage Reports
	c) Total Cost of Ownership (TCO)
	d) Trusted Advisor

a) The AWS Simple Monthly Calculator is an easy-to-use online tool that enables you to estimate their architecture solution monthly cost of AWS services for your use case based on your expected usage. It is being replaced by AWS Pricing Calculator.

---

7. The Enterprise Support Plan comes with a business-critical system down response under 15 minutes and offers access to a Technical Account Manager, as well as a Concierge Support Team.
	True

---

8. A company is not sure whether or not it is cost-effective to migrate to the AWS Cloud. Which service can help the executive board make a decision?
	a) Simple Monthly Calculator
	b) Pricing Calculator
	c) Billing Dashboard
	d) Cost Explorer

b) AWS Pricing Calculator is a web based service that you can use to create cost estimates to suit your AWS use cases. AWS Pricing Calculator is useful both for people who have never used AWS and for those who want to reorganize or expand their usage.

---

9. What do Resource Groups rely on to group your resources?
	a) Labels
	b) Categories
	c) Tags
	d) Stickers

c) You can assign metadata to your AWS resources in the form of tags. Tags can help you manage, identify, organize, search for, and filter resources.

---

10. What can you use to get alerts when your costs and usage are exceeding or are forecasted to exceed your budgeting amount?
	a) CloudWatch Billing Alarms
	b) Budgets
	c) Cost and Usage Reports
	d) Billing Dashboard

b) AWS Budgets gives you the ability to set custom budgets that alert you when your costs or usage exceed (or are forecasted to exceed) your budgeted amount. Difference with CloudWatch Billing Alarms: CloudWatch Billing Alarms only send alerts when your costs and usage are exceeding your budget, not when it is forecasted to exceed your budget, while AWS Budgets does both.

---

11. A company would like to choose the best Savings Plan and forecast its cost in the next 3 months. Which AWS service can help?
	a) Cost and Usage Reports
	b) Budgets
	c) Cost Explorer
	d) Forecast

c) Cost Explorer can be used to forecast usage up to 12 months based on the previous usage. It can also be used to choose an optimal Savings Plan. Cost Explorer has an easy-to-use interface that lets you visualize, understand, and manage your AWS costs and usage over time.

---

12. Which of the following options uses machine learning to recommend optimal AWS resources and therefore reduces costs?
	a) Trusted Advisor
	b) Budgets
	c) Cost Explorer
	d) Compute Optimizer

d) AWS Compute Optimizer recommends optimal AWS resources for your workloads to reduce costs and improve performance by using machine learning to analyze historical utilization metrics.

---

- Set 15

1. Which services are free to use in AWS?
	a) IAM, VPC, Consolidated Billing, and Elastic Beanstalk
	b) Elastic Beanstalk, CloudFormation, Auto Scaling Groups, and Lambda
	c) SNS, SQS, IAM, VPC
	d) All services have a free tier included

a) These services are free to use. Be careful, the resources created in Elastic Beanstalk (as well as in CloudFormation and Auto Scaling Groups) are not free.

---

2. CloudFront pricing is the same in every geographic region.
	CloudFront pricing is different across different geographic regions.

---

3. When you reserve, the larger the upfront payment, the smaller the discount.
	a) True
	b) False, the upfront payment does not matter on the discount
	c) False, the larger the upfront, the bigger the discount

c) When the upfront payment is higher, the discount is bigger.

---

4. Which of the following is NOT a pricing factor in S3?
	a) Storage class
	b) Data transfer into S3
	c) Objects size
	d) Type of requests

b) Inbound data transfer in the S3 region is free.

---

5. EBS Snapshots are added cost in GB per month.
	The added data storage by EBS Snapshots are added cost in GB per month to EBS pricing. Other EBS pricing factors are: Volume type, Provisioned storage volume, IOPS, etc.

---

6. Which of the following options can provide up to 66% discount compared to On-demand for a commitment to a consistent amount of usage for 1 or 3 years and offers the possibility to change EC2 instances family type?
	a) Spot instances
	b) Reserved instances
	c) Compute Savings Plans
	d) EC2 Instances Savings Plans

c) Compute Savings Plans provide the most flexibility and help to reduce your costs by up to 66% in exchange for a commitment to a consistent amount of usage for a 1 or 3 year term. These plans automatically apply to EC2 instance usage regardless of instance family, size, AZ, region, OS or tenancy, and also apply to Fargate or Lambda usage.

---

7. You are running an on-demand Linux EC2 instance, what timing is applied regarding billing?
	a) Pay per minute
	b) Pay per hour
	c) Pay per day
	d) Pay per second

d) With Linux EC2 instances, you pay per second of compute capacity. There is also a minimum of 60s of use.

---

8. Which pricing model allows you to minimize risks, predictably manage budgets, and comply with long-term requirements, and is available for EC2, DynamoDB, ElastiCache, RDS, and Redshift?
	a) Pay as you go
	b) Pay less as AWS grows
	c) Pay less by using more
	d) Save when you reserve

d) Reservations are available for EC2 Reserved Instances, DynamoDB Reserved Capacity, ElastiCache Reserved Nodes, RDS Reserved Instance, Redshift Reserved Nodes. Reservations allow you to minimize risks, predictably manage budgets and comply with long-term requirements.

---

9. Which RDS pricing option is the most cost-effective if you need capacity for 3 years?
	a) On-demand
	b) Spot Instances
	c) Dedicated Instances
	d) reserved instances

d) Reserved Instances are good and more cost-effective (up to 69% discount compared to On-demand pricing, depending on the upfront) for long workloads. You can reserve instances for 1 or 3 years in RDS.

---

- Set 16

1. A company would like to use their on-premises Microsoft Active Directory to connect to its AWS resources. Which service can it use?
	a) Directory Services
	b) IAM Identity Center
	c) Direct Connect
	d) Cognito

a) AWS Directory Service makes it easy for you to setup and run directories in the AWS cloud, or connect your AWS resources with an existing on-premises Microsoft Active Directory.

---

2. Which AWS service allows you to create temporary, limited-privilege credentials for your AWS resources?
	a) IAM Identity Center
	b) Security Token Service (STS)
	c) AWS Directory Services
	d) Amazon Cognito
	
b) AWS Security Token Service (AWS STS) is a web service that enables you to request temporary, limited-privilege credentials for AWS Identity and Access Management (IAM) users or for users that you authenticate (federated users).

---

3. A company just created a new mobile application and wants to add a simple and secure user sign-up, sign-in, and access control. Which AWS service can it use?
	a) IAM
	b) Cognito
	c) Directory Services
	d) IAM Identity Center

b) Amazon Cognito lets you add user sign-up, sign-in, and access control to your web and mobile apps quickly and easily.

---

4. A company would like to centrally manage access to multiple AWS accounts and business applications. Which service can it use?
	a) Organizations
	b) Cognito
	c) Directory Service
	d) IAM Identity Center

d) AWS IAM Identity Center is an AWS service that enables you to makes it easy to centrally manage access to multiple AWS accounts and business applications and provide users with single sign-on access to all their assigned accounts and applications from one place.

---

- Set 17

1. You would like to convert an S3 file so it can be played on users’ devices. Which AWS service can help?
	a) Transcribe
	b) Elastic Transcoder
	c) AppStream 2.0
	d) Sumerian
 
b) Amazon Elastic Transcoder is media transcoding in the cloud. It is used to convert media files from their source format into versions that will play back on devices like smartphones, tablets, and PCs.

---

2. You would like to access desktop applications through a browser. Which AWS service would you use?
	a) Outposts
	b) WorkSpaces
	c) AppStream 2.0
	d) EC2 Instance Connect

c) Amazon AppStream 2.0 is a fully managed non-persistent application and desktop streaming service that provides users instant access to their desktop applications from anywhere.

---

3. Which AWS service can be used to test your application across real desktop browsers and mobile devices?
	a) IoT Core
	b) AppStream 2.0
	c) WorkSpaces
	d) Device Farm

d) AWS Device Farm is an application testing service that lets you improve the quality of your web and mobile apps by testing them across an extensive range of desktop browsers and real mobile devices; without having to provision and manage any testing infrastructure.

---

4. Which AWS service is serverless and lets you connect billions of devices to the AWS Cloud?
	a) Transit Gateway
	b) Connect
	c) Elastic Transcoder
	d) IoT Core

d) AWS IoT Core lets you securely connect IoT devices to the AWS Cloud and other devices without the need to provision or manage servers.

---

5. CloudEndure Disaster Recovery is used to centrally automate backups across AWS services while AWS Backup is used to quickly and easily recover servers into AWS.
	False

---

6. A hybrid company would like to provision desktops to their employees so they can access securely both the AWS Cloud and their data centers. Which AWS service can help?
	a) WorkSpaces
	b) AppStream 2.0
	c) Site-to-Site VPN
	d) Sumerian

a) Amazon WorkSpaces is a fully managed, secure cloud desktop service. You can use Amazon WorkSpaces to provision either Windows or Linux desktops in just a few minutes and quickly scale to provide thousands of desktops to workers across the globe.

---

- Set 18

1) Auto Scaling in EC2 and DynamoDB are examples of?
	a) Horizontal scaling

Auto Scaling in EC2 allows you to have the right number of instances to handle the application load. Auto Scaling in DynamoDB automatically adjusts read and write throughput capacity, in response to dynamically changing request volumes, with zero downtime. These are both examples of horizontal scaling.

---

2) AWS Trusted Advisor can provide guidance against the 6 Well-Architected pillars and architectural best practices.
	false
	The AWS Well-Architected Tool helps you review the state of your workloads and compares them to the latest AWS architectural best practices. It is based on the 6 pillars of the Well-Architected Framework (Operational Excellence, Security, Reliability, Performance Efficiency, Cost Optimization, and Sustainability). AWS Trusted Advisor is an online tool that provides you real time guidance to help you provision your resources following AWS best practices (Cost Optimization, Performance, Security, Fault Tolerance, and Service Limits).

---

3) Which of the following are design principles of Performance Efficiency?
	a) Go global in minutes & experiment more often
	b) Analyze and attribute expenditure & stop spending money on data center operations
	c) Make frequent, small, reversible changes & anticipate failure
	d) Automate security best practices & keep away people from data

a) Performance Efficiency design principles include: democratize advanced technologies, go global in minutes, use serverless architecture, experiment more often, mechanical sympathy.

---

4) Which of the following is NOT an AWS Partner Network (APN) type?
	a) APN Technology Partners
	b) APN SErvices Partners
	c) APN Consulting Partners
	d) APN Training Partners

b) This is a distractor. This type of AWS Partner Network does not exist. It is made up with words related to the AWS Partner Network.

---

5) Testing recovery procedures, stopping guessing capacity, and managing changes in automation are design principles of Performance Efficiency.
	false

Testing recovery procedures, stopping guessing capacity, and managing changes in automation are design principles of Reliability. Performance Efficiency design principles include: democratize advanced technologies, go global in minutes, use serverless architecture, experiment more often, mechanical sympathy.

---

6) Which AWS service is the key to Operational Excellence?
	a) CloudFormation
	b) EC2
	c) OpsWork
	d) CodeDeploy

a) CloudFormation is a key service to Operational Excellence as it prepares, operates, and evolves, but also performs operations as code.

---

7) AWS Cost Explorer and AWS Trusted Advisor are services examples of which Well-Architected Framework pillar?
	a) Security
	b) Operational Excellence
	c) Cost Optimization
	d) Performance Efficiency

c) AWS Cost Explorer and AWS Trusted Advisor are Cost Optimization services examples. It also includes AWS Budgets, Cost and Usage Reports, etc.

---

8) Implementing Security Groups, NACLs, KMS, or CloudTrail reflects which Well-Architected Framework Pillar?
	a) Reliability
	b) Performance Efficiency
	c) Security
	d) Cost Optimization

c) The Security pillar includes the ability to protect information, systems, and assets while delivering business value through risk assessments and mitigation strategies.

