data "azurerm_private_dns_zone" "zone" {
  name = "testeterraform"
}

data "azurerm_resource_group" "rg-zone" {
  name = var.rg_name
}