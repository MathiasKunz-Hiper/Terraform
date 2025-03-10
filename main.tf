 module "testegrupos" {
  source = "../../modules/Seguranca"
  group_and_users = {
    "grupoterraformteste"  = ["gilnei.nogueira@hiper.com.br"]
  }

 }

 output "group_exists" {
   value = module.testegrupos.group_exists
 }