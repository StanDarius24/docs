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