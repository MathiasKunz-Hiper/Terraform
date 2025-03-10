data "azuread_user" "user_object" {
  user_principal_name = var.user_name
}