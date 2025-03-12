resource "azurerm_private_dns_a_record" "example" {
  name                = var.registry_name
  zone_name           = data.azurerm_private_dns_zone.zone.name
  resource_group_name = data.azurerm_resource_group.rg-zone.name
  ttl                 = 300
  records             = ["10.0.180.17"]
}