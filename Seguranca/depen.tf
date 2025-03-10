data "external" "verify_group_exists" {
  for_each = var.group_and_users
  program = [ "Powershell.exe", "${path.module}/verify_groups.ps1" ]
  query = {
    group_name = each.key
  }
}
