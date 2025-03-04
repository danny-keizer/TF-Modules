output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}