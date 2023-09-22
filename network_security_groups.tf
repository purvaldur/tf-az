resource "azurerm_network_security_group" "thor-nsg" {
  name                = "thor-nsg"
  resource_group_name = azurerm_resource_group.thor-rg.name
  location            = azurerm_resource_group.thor-rg.location

  tags = {
    environment = "dev"
  }
}