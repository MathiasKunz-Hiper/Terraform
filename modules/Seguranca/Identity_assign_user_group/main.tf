resource "azuread_group_member" "grupo_membro" {
  
  //group_object_id = length(azuread_group.grupo) > 0 ? azuread_group.grupo[0].object_id : data.external.verify_group_exists.result.object_id
  group_object_id = var.group_object_id
  member_object_id = data.azuread_user.user_object.object_id
  
}