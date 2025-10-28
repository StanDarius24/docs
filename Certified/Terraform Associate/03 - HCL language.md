Terraform is written in HCL (HashiCorp Configuration Language) and is designed to be both human and machine
readable. HCL is built using code configuration blocks which typically follow the following syntax:
```
1 # Template
2 <BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
3 # Block body
4 <IDENTIFIER> = <EXPRESSION> # Argument
5 }
6
7 # AWS EC2 Example
8 resource "aws_instance" "web_server" { # BLOCK
9 ami = "ami-04d29b6f966df1537" # Argument
10 instance_type = var.instance_type # Argument with value as expression (Variable value re
11 }
```

Terraform Code Configuration block types include:
• Terraform Settings Block
• Terraform Provider Block
• Terraform Resource Block
• Terraform Data Block
• Terraform Input Variables Block
• Terraform Local Variables Block
• Terraform Output Values Block
• Terraform Modules Block

===


