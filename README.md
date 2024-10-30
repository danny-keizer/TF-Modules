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
[MODULE]-[PLATFORM]-[TYPE]
```
```
MODULE-AZURE-COMPUTE
MODULE-AZURE-NETWORK
MODULE-AZURE-STORAGE
```

### Module File Structure
<span style="color:4136be">
MODULE-AZURE-DATABASE/      <br />
├── main.tf                 <br />
├── variables.tf            <br />
├── outputs.tf              <br />
├── META.md                 <br />
</span>

### main.tf
Contains the resources that will be created by invoking the module.                 <br />
Try to use variables to pass parameters whenever it is possible.                    <br />
A good module will balance simplicity with flexibility                              <br />

### variables.tf
Describes the variables required to fill parameters within the module.              <br />
Do not assign defaults to variables in order to prevent unexpected behaviours.      <br />
Instead, if any value should be static it should be hardcoded.                      <br />

### outputs.tf
Describes the outputs that will be accessible.
Providing outputs is not mandatory but is preferred.                                <br />

### META.md
Outlines the general purpose of the module.                                         <br />
This file should also contain a brief example of the module in use.

## Useful links
- [Terraform Registry](https://registry.terraform.io/)
- [Developing Modules](https://developer.hashicorp.com/terraform/language/modules/develop)
- [Authentication](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/managed_service_identity)

#### Authored by Danny Keizer
