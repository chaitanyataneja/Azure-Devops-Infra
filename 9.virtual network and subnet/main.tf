resource "azurerm_virtual_network" "vnetblock" {
  resource_group_name = "myrg1"
  location            = "centralindia"
  name                = "myvnet1"
  address_space       = ["10.0.0.0/16"]

}
resource "azurerm_subnet" "subnet-1" {
     name="frontendsubnet"
    resource_group_name = "myrg1"
    virtual_network_name = "myvnet1"
    address_prefixes = [ "10.0.1.0/24" ]
   
}