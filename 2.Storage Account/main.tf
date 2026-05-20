resource "azurerm_resource_group" "rg2" {
    name="rg_india"
    location="centralindia"
  
}
resource "azurerm_storage_account" "sa" {
  name                     = "mystorage87311612"
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = "central india"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}