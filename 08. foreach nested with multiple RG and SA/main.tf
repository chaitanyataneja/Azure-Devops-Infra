resource "azurerm_resource_group" "block1" {
  for_each   = var.resource
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by

}
resource "azurerm_storage_account" "tala" {
  depends_on               = [azurerm_resource_group.block1]
  for_each                 = var.accounts
  name                     = each.value.name
  resource_group_name      = each.value.rgname
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.art

}