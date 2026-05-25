resource "azurerm_resource_group" "nestedblock" {
  for_each = {
    rg_1 = {
      name       = "appleios"
      location   = "centralindia"
      managed_by = "terraform"
    }
    rg2 = {
      name       = "samsung"
      location   = "eastus"
      managed_by = "chaitanya"

    }
  }

  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.managed_by
}

resource "azurerm_resource_group" "multirg" {
    for_each = var.hello
    name=each.value.name
    location = each.value.location
    managed_by = each.value.managed_by
  
}





    