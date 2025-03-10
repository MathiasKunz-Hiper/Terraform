/*data "external" "verify_group_exists" {
  program = [ "Powershell.exe", "${path.module}/verify_groups.ps1" ]
  query = {
    group_name = var.group_name
  }
}*/

# data "azuread_user" "user_object" {
#   user_principal_name = var.user_name
# }


# data "azuread_user" "users" {
#   //for_each = toset(flatten([for users in var.azuread_groups : users]))

#   for_each = toset(flatten([for group, users in var.azuread_groups : users]))


#   user_principal_name = each.value
# }