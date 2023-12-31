resource "azurerm_virtual_network" "thor-vn" {
  name                = "thor-vn"
  resource_group_name = azurerm_resource_group.thor-rg.name
  location            = azurerm_resource_group.thor-rg.location

  address_space = [
    "10.16.0.0/16"
  ]

  tags = {
    environment = "dev"
  }
}

resource "azurerm_subnet" "thor-sn" {
  name                 = "thor-sn"
  resource_group_name  = azurerm_resource_group.thor-rg.name
  virtual_network_name = azurerm_virtual_network.thor-vn.name

  address_prefixes = [
    "10.16.1.0/24"
  ]
}

resource "azurerm_subnet_network_security_group_association" "thor-sga" {
  subnet_id                 = azurerm_subnet.thor-sn.id
  network_security_group_id = azurerm_network_security_group.thor-nsg.id
}