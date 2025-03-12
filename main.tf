#  module "testegrupos" {
#   source = "../../modules/Seguranca"
#   group_and_users = {
#     "grupoterraformteste"  = ["gilnei.nogueira@hiper.com.br"]
#   }

#  }

#  output "group_exists" {
#    value = module.testegrupos.group_exists
#  }


 module "pdz-registro" {
   source = "github.com/MathiasKunz-Hiper/Terraform//Private-DNS-Zone/Zone-Registry?ref=modules"

   registry_name = "testes"
   rg_name = "rg-testeterraform"
 }