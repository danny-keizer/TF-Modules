# Local File Module
This Terraform module creates three local files with specified content.

## Usage
```hcl
module "local_create_files" {
  source = "git::https://github.com/danny-keizer/terraform-modules.git//Modules//MODULE_LOCAL_EXAMPLE"
  file_name = "lab"
}

