data "azurerm_resource_group" "rg" {
  name = var.resourcegroup_name
}

resource "azurerm_network_security_group" "nsg" {
  name                = var.networksecuritygroup_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  security_rule {
    name                       = "prd-app-all-allow-ingress"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  timeouts {
    create = "10m"
    update = "10m"
    delete = "30m"
    read   = "3m"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtualnetwork_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = var.virtualnetwork_address_space
  dns_servers         = var.dns_servers
  tags                = var.tags

  encryption {
    enforcement = "DropUnencrypted"
  } 

  timeouts {
    create = "15m"
    update = "15m"
    delete = "1h"
    read   = "3m"
  }

  dynamic "subnet" {
    for_each = var.virtualnetwork_subnets

    content {
      name           = subnet.value.name
      address_prefixes = tolist(subnet.value.address_prefix)
    }
  }
}
