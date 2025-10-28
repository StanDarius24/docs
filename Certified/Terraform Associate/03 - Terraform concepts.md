
# Resources

_Resources_ are the most important element in the Terraform language. Each resource block describes one or more infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records.

A `resource` block declares a resource of a specific type with a specific local name. Terraform uses the name when referring to the resource in the same module, but it has no meaning outside that module's scope.

In the following example, the `aws_instance` resource type is named `web`. The resource type and name must be unique within a module because they serve as an identifier for a given resource.

```
resource "aws_instance" "web" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
}
```

Within the block body (between `{` and `}`) are the configuration arguments for the resource itself. The arguments often depend on the resource type. In this example, both `ami` and `instance_type` are special arguments for [the `aws_instance` resource type](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance).

## Resource Types

Each resource is associated with a single _resource type_, which determines the kind of infrastructure object it manages and what arguments and other attributes the resource supports.

### Providers

A [provider](https://developer.hashicorp.com/terraform/language/providers/requirements) is a plugin for Terraform that offers a collection of resource types. Each resource type is implemented by a provider. A provider provides resources to manage a single cloud or on-premises infrastructure platform. Providers are distributed separately from Terraform, but Terraform can automatically install most providers when initializing a working directory.

# Resource Behavior

A `resource` block declares that you want a particular infrastructure object to exist with the given settings. If you are writing a new configuration for the first time, the resources it defines will exist _only_ in the configuration, and will not yet represent real infrastructure objects in the target platform.

_Applying_ a Terraform configuration is the process of creating, updating, and destroying real infrastructure objects in order to make their settings match the configuration.

## How Terraform Applies a Configuration

When Terraform creates a new infrastructure object represented by a `resource` block, the identifier for that real object is saved in Terraform's [state](https://developer.hashicorp.com/terraform/language/state), allowing it to be updated and destroyed in response to future changes. For resource blocks that already have an associated infrastructure object in the state, Terraform compares the actual configuration of the object with the arguments given in the configuration and, if necessary, updates the object to match the configuration.

In summary, applying a Terraform configuration will:

- _Create_ resources that exist in the configuration but are not associated with a real infrastructure object in the state.
- _Destroy_ resources that exist in the state but no longer exist in the configuration.
- _Update in-place_ resources whose arguments have changed.
- _Destroy and re-create_ resources whose arguments have changed but which cannot be updated in-place due to remote API limitations.

This general behavior applies for all resources, regardless of type. The details of what it means to create, update, or destroy a resource are different for each resource type, but this standard set of verbs is common across them all.

The meta-arguments within `resource` blocks, documented in the sections below, allow some details of this standard resource behavior to be customized on a per-resource basis.

---

