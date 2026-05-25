resource "azurerm_resource_group" "mapexample" {
  for_each = {
    rg_adidas = "centralindia"
    rg_nike   = "westus"
    rg_reebok = "eastus"

  }
  name     = each.key
  location = each.value

}

resource "azurerm_resource_group" "multiple" {
  for_each = var.mapvalues
  name     = each.key
  location = each.value

}