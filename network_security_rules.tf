resource "azurerm_network_security_rule" "thor-nsg-sr-dev" {
  name                        = "thor-nsg-sr-dev"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  
  source_port_range           = "*"
  destination_port_range      = "*"

  # import from gitignored private_variables.tf file for now...
  source_address_prefix       = var.thor_ip_addr
  destination_address_prefix  = "*"

  resource_group_name         = azurerm_resource_group.thor-rg.name
  network_security_group_name = azurerm_network_security_group.thor-nsg.name
}