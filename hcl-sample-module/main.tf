resource "azurerm_dummy" "example" {
  ami           = var.name
  instance_type = var.resource_group
}