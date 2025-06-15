Step 1: Understand Problems with Traditional way of Managing Infrastructure
- Time it takes for building multiple environments
- Issues we face with different environments
- Scale-up and Scale-down on demand

Step 2: Discuss how IaC with Terraform solves them
- Visibility
- Stability
- Scalability
- Security
- Audit

Step 1: Introduction
- Understand basic Terraform Commands:
	- terraform init
	- terraform validate
	- terraform plan
	- terraform apply
	- terraform destroy

---

Step 2: Review terraform manifest for EC2 Instance
	- Pre-Conditions-1: Ensure you have default-vpc in that respective
	- Pre-Conditions-2: Ensure AMI you are provisioning exists in that region if not update AMI ID
	- Pre-Conditions-3: Verify your AWS Credentials in $HOME/.aws/credentials

```tf
# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-04d29b6f966df1537" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
}
```

---

Step 3: Terraform Core Commands

```tf
# Initialize Terraform
terraform init

# Terraform Validate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create EC2 Instance
terraform apply 
```

---

Step 4: Verify the EC2 Instance in AWS Management Console

- Go to AWS Management Console -> Services -> EC2
- Verify newly created EC2 instance

---

Step 5: Destroy Infrastructure

```tf
# Destroy EC2 Instance
terraform destroy

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

---

### Section 2: Terraform Configuration Language Syntax

---
---

Step 1: Introduction
- Understand Terraform Language Basics
	- Understand Blocks
	- Understand Arguments, Attributes & Meta-Arguments
	- Understand Identifiers
	- Understand Comments

---

Step 2: Terraform Configuration Language Syntax
- Understand Blocks
- Understand Arguments
- Understand Identifiers
- Understand Comments
- [[https://developer.hashicorp.com/terraform/language]]
- [[https://developer.hashicorp.com/terraform/language/syntax/configuration]]

```tf
# Template
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>"   {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}

# AWS Example
resource "aws_instance" "ec2demo" { # BLOCK
  ami           = "ami-04d29b6f966df1537" # Argument
  instance_type = var.instance_type # Argument with value as expression (Variable value replaced from varibales.tf
}
```

---

Step 3: Understand about Arguments, Attributes and Meta-Arguments.
- Arguments can be `required` or `optional`
- Attributes format looks like `resource_type.resource_name.attribute_name`
- Meta-Arguments change a resource type's behaviour (ex: count, for_each)
- [[https://developer.hashicorp.com/terraform/tutorials/configuration-language/resource?in=terraform%2Fconfiguration-language]]

