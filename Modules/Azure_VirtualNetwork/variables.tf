variable "networksecuritygroup_name" {
  description = "The name of the network security group"
  type        = string

  validation {
    condition     = can(regex("^nsg-", var.networksecuritygroup_name))
    error_message = "The network security group name must start with 'nsg-'."
  }
}

variable "resourcegroup_name" {
  description = "The name of the resource group"
  type        = string

  validation {
    condition     = can(regex("^rg-", var.resourcegroup_name))
    error_message = "The resource group name must start with 'rg-'."
  }
}

variable "virtualnetwork_name" {
  description = "The name of the virtual network"
  type        = string

  validation {
    condition     = can(regex("^vnet-", var.virtualnetwork_name))
    error_message = "The virtual network name must start with 'vnet-'."
  }
}

variable "virtualnetwork_address_space" {
  description = "The address space for the virtual network as a list"
  type        = list(string)

  validation {
    condition = alltrue([
    length(var.virtualnetwork_address_space) > 0,
    length(var.virtualnetwork_address_space) < 2
                        ])
    error_message = "The address space list is out of range"
  }
}

variable "virtualnetwork_subnets" {
  description = "A list of subnets"
  type = list(object({
    name           = string
    address_prefix = string
  }))

  validation {
    condition = alltrue([
    length(var.virtualnetwork_subnets) > 0,
    length(var.virtualnetwork_subnets) < 100
                        ])
    error_message = "The specified number of subnets is out of range"
  }
}

variable "dns_servers" {
  description = "A list of DNS servers"
  type        = list(string)

  validation {
    condition     = contains(["10.0.1.2", "10.0.2.2"], var.dns_servers)
    error_message = "Choose a valid DNS server"
  }
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
    contains(keys(var.tags), "DeploymentStage"),
    contains(keys(var.tags), "CreatedByModule")
                        ])
    error_message = "The tags map is missing some required definitions"
  }
}