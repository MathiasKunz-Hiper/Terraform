data "azurerm_private_dns_zone" "zone" {
  name = "testeterraform.teste"
}

data "azurerm_resource_group" "rg-zone" {
  name = var.rg_name
}