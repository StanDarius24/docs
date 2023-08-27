Always create a new file called `variables.tf`
- Input Variables
	- var.< name >
- Local Variables
	- local.< name >
- Output Variables

```json
variable "instance_type" {
	description = "ec2 instance type"
	type = string
	default = "t2.micro"
}

locals {
	service_name = "My Service"
	owner = "DevOps Directive"
}

output "instance_ip_addr" {
	value = aws_instance.instance.public_ip
}
```
##### Setting Input Variables (In order of precedence //lowest -> highest)
- Manual entry during plan/apply
- Default value in declaration block
- TF_VAR_< name > environment variables
- terraform.tfvars file
- Command line -var or -var-file

##### Types & Validation
Primitive Types:
- string
- number
- bool
Complex Types:
- list(< TYPE >)
- set(< TYPE >)
- map(< TYPE >)
- object({< ATTR NAME > = < TYPE >, ...})
- tuple([< TYPE >, ...])

Validation:
- Type checking happens automatically
- Custom conditions can also be enforced

##### Sensitive Data
Mark variables as sensitive:
- Sensitive = true
Pass to terraform apply with:
- TV_VAR_variable
- -var (retrieved from secret manager at runtime)
Can also use external secret store
- For example, AWS Secret Manager

```json
resource "some_resource" "a" {
 + sensitive_value = (sensitive)
}
```

```json
variable "prefix" {
	default = ["Mr", "Mrs", "Sir"]
	type = list
}
---
resource "random_pet" "my-pet" {
	prefix = var.prefix[0]
}
```
```json
variable file-content {
	type = map
	default = {
		"statement1" = "We love pets!"
		"statement2" = "We love animals!"
	}
}
---
resource local_file my-pet {
	filename = "/root/pets.txt"
	content = var.file-content["statemen2"]
}
```

type = list(string/number)

set -> as well

---
OBJECT

```json
variable "bella" {
	type = object({
		name = string
		color = string
		age = number
		food = list(string)
		favorite_pet = bool
	})
	default = {
		name = "bella"
		color = "brown"
		age = 7
		food = ["fish", "chicken"]
		favourite_pet = true
	}
}
```

tuple
type = tuple([string, number, bool]) -> ["cat", 3, true]
