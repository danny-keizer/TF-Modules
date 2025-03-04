# Terraform Modules
### Repository for housing custom Terraform modules.

<img src="https://www.svgrepo.com/show/376353/terraform.svg" width="300" height="300" alt="Terraform Logo">

## Considerations 

Before adding a new module to this repository please consider the following:
- Modules should raise the level of abstraction by consolidating multiple interdependent resources.
- If any external providers are required by the module they should be declared in the consuming HCL.
- Before creating a Pull Request ensure that the module is compliant with the conventions outlined below.

## Conventions


### Module Naming Scheme

```
<Platform>_<Type>_<Variant>
```

```
Azure_ResourceGroup
Azure_VirtualMachine_Linux
Azure_VirtualMachine_Windows
Azure_StorageAccount
```

### Module File Structure

Azure_VirtualMachine_Windows/   <br />
├── main.tf                     <br />
├── variables.tf                <br />
├── outputs.tf                  <br />
├── readme.md                   <br />

### main.tf
Contains the resources that will be created by invoking the module. 
Try to use variables to pass parameters whenever it is possible. A good module balances simplicity with flexibility.                             

### variables.tf
Declares the variables required to fill parameters within the module. Do not assign defaults to variables in order to prevent unexpected behaviours.      Instead, if any value should be static hardcode it.

### outputs.tf
Describes the outputs that will be accessible.
Providing outputs is not mandatory but is preferred.

### META.md
Outlines the general purpose of the module.
This file should also contain a usage example.

## Useful links
- [Terraform Registry](https://registry.terraform.io/)
- [Developing Modules](https://developer.hashicorp.com/terraform/language/modules/develop)
- [Authentication](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/managed_service_identity)

#### Authored by: Danny Keizer
