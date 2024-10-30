# Local File Module

This Terraform module creates three local files with specified content.

## Usage

```hcl
module "local_create_files" {
  source = "github.com/your-username/local-file-module"
  file_name = "lab"
}

