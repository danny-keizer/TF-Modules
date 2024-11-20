resource "azurerm_resource_group" "rg" {
  name = var.name
}

output "id" {
  value = data.azurerm_resource_group.rg.id
}
