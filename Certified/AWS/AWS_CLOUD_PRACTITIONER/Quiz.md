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