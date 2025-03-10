resource "azuread_group" "grupo" {
  count = var.create_group ? 1 : 0

  display_name     = var.group_name
  security_enabled = true
}

output "group_object_id" {
  value = azuread_group.grupo[0].object_id
}

# resource "azuread_group_member" "grupo_membro" {
  
#   //group_object_id = length(azuread_group.grupo) > 0 ? azuread_group.grupo[0].object_id : data.external.verify_group_exists.result.object_id
#   group_object_id = azuread_group.grupo[0].object_id
#   member_object_id = data.azuread_user.user_object.object_id
  
# }



# resource "azuread_group" "groups" {
#   for_each = var.azuread_groups
  
#   display_name = each.key
#   security_enabled = true
# }

# locals {
#   user_groups = flatten([
#     for group, users in var.azuread_groups : [
#       for user in users : {
#         group_name = group
#         user_email = user
#       }
#     ]
#   ])

#   user_groups_after_for = tomap({
#      for user_group in local.user_groups : "${user_group.group_name}.${user_group.user_email}" => user_group
#   })
# }

# resource "azuread_group_member" "group_members" {

#   for_each = local.user_groups_after_for

#     group_object_id = azuread_group.groups[each.value.group_name].id
#     member_object_id = data.azuread_user.users[each.value.user_email].id
# }

# output "user_group_identity" {
#   value = local.user_groups
# }

# output "user_group_after_for_identity" {
#   value = local.user_groups_after_for
# }