resource "azurerm_resource_group" "block1" {
  name     = "rg_bhakua"
  location = "centralindia"

}

resource "azurerm_storage_account" "sa1" {
  depends_on               = [azurerm_resource_group.block1]
  name                     = "mystorageaccount8732"
  resource_group_name      = "rg_bhakua"
  location                 = "central india"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}