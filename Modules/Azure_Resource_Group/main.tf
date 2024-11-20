resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
}

output "id" {
  value = data.azurerm_resource_group.rg.id
}
