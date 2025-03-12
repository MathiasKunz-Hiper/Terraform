resource "azurerm_private_dns_zone" "example" {
  name                = var.zone_name
  resource_group_name = data.azurerm_resource_group.rg-zone.name
}
