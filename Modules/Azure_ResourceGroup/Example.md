# Local File Module
This Terraform module creates a resource group.

## Usage
```hcl
module "local_create_files" {
  source = "git::https://github.com/danny-keizer/terraform-modules.git//Modules//Azure_ResourceGroup"
  name = "sample-rg"
}