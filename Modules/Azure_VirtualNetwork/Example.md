# Local File Module
This Terraform module creates a virtual network along with it's subnets.
The module also creates and applies and network security group.

## Usage
```hcl
module "vnet-dev-app" {
  source = "git::https://github.com/danny-keizer/terraform-modules.git//Modules//Azure_VirtualNetwork"

  resourcegroup_name        = "rg-1"
  networksecuritygroup_name = "nsg-dev-app"
  virtualnetwork_name       = "vnet-dev-app"
  virtualnetwork_address_space = ["10.0.0.0/16"]
  dns_servers               = ["10.0.1.2", "10.0.2.2"]
  tags = {
    DeploymentStage = "Production"
    CreatedByModule = "True"
  }
  virtualnetwork_subnets = [
    {
      name           = "sn-frontend"
      address_prefix = ["10.0.1.0/24"]
    },
    {
      name           = "sn-backend"
      address_prefix = ["10.0.2.0/24"]
    }
  ]
}