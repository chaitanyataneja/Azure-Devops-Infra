resource "azurerm_resource_group" "multiplerg" {
  for_each = toset(["rg_ketan", "rg_chatty", "rg_bharat"])
  name     = each.key
  location = "centralindia"

}

resource "azurerm_resource_group" "rg" {
  for_each = toset(var.rg)
  name = each.key
  location = var.location
  
}