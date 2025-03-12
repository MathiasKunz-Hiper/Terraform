 module "testegrupos" {
  source = "github.com/MathiasKunz-Hiper/Terraform//Seguranca?ref=modules"
  group_and_users = {
    "grupoterraformteste"  = ["mathias@hiper.com.br", "vitor.soberanski@hiper.com.br"]
    "grupoterraformteste2" = ["mathias@hiper.com.br", "vitor.soberanski@hiper.com.br"]
  }

 }

# output "user_group_prod" {
#   value = module.testegrupos.user_group_seguranca
# }

# output "user_group_after_for_prod" {
#   value = module.testegrupos.user_group_after_for_seguranca
# }

# locals {
#   # flatten ensures that this local value is a flat list of objects, rather
#   # than a list of lists of objects.
#   network_subnets = flatten([
#     for network_key, network in var.networks : [
#       for subnet_key, subnet in network.subnets : {
#         network_key = network_key
#         subnet_key  = subnet_key
#         cidr_block  = subnet.cidr_block
#       }
#     ]
#   ])

#   network_for = tomap({
#     for subnet in local.network_subnets : "${subnet.network_key}.${subnet.subnet_key}" => subnet
#   })
# }

data "azurerm_subscriptions" "prd" {
  display_name_contains = "prd"

}

data "azurerm_subscriptions" "mpn" {
  display_name_contains = "MPN"

}

data "azurerm_client_config" "example" {
}


resource "azurerm_role_assignment" "example" {
  scope                = data.azurerm_subscriptions.mpn.subscriptions[1].id
  role_definition_name = "Reader"
  principal_id         = data.azurerm_client_config.example.object_id
}

module "private_zone" {
  source = "github.com/MathiasKunz-Hiper/Terraform.git//Private-DNS-Zone/Zone?ref=modules"

  zone_name = "testeterraform.teste"
  resource_group_name = "rg-testeterraform"
}