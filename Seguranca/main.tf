locals {
  user_groups = flatten([
    for group, users in var.group_and_users : [
      for user in users : {
        group_name = group
        user_email = user
      }
    ]
  ])

  user_groups_after_for = tomap({
     for user_group in local.user_groups : "${user_group.group_name}.${user_group.user_email}" => user_group
  })
}



module "identity-group" {
    source = "./Identity_group"
    
    for_each = var.group_and_users

    /*azuread_groups = {
        "grupoterraformteste" = ["mathias@hiper.com.br", "vitor.soberanski@hiper.com.br"]
        "grupoterraformteste2" = ["mathias@hiper.com.br", "vitor.soberanski@hiper.com.br"]
    }*/

    

    create_group = data.external.verify_group_exists[each.key].result.exists ? false : true
    # group_object_id = data.external.verify_group_exists[each.value.group_name].result.object_id
    # user_name  = each.value.user_email
    group_name = each.key

}


module "identity-assign-user-group" {
    source = "./Identity_assign_user_group"

    depends_on = [ module.identity-group ]
    
    for_each = local.user_groups_after_for

    group_object_id = module.identity-group[each.value.group_name].group_object_id
    user_name  = each.value.user_email
}

# output "user_group_seguranca" {
#   value = module.identity.user_group_identity
# }

# output "user_group_after_for_seguranca" {
#   value = module.identity.user_group_after_for_identity
# }

output "group_exists" {
  
  value = data.external.verify_group_exists["grupoterraformteste"].result.exists
}