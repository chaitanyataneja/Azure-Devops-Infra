resource "azurerm_resource_group" "hello" {
  for_each   = var.setrgvalue
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by

}
resource "azurerm_virtual_network" "mynetwork" {
  depends_on          = [azurerm_resource_group.hello]
  for_each            = var.collectionsofvnets
  resource_group_name = each.value.rg_name
  location            = each.value.location
  name                = each.value.vnetname
  address_space       = each.value.address_space

}
resource "azurerm_subnet" "front" {
  for_each             = var.smallersubnets
  name                 = each.value.name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnetname
  address_prefixes     = each.value.address_prefixes
}