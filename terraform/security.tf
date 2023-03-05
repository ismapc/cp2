# The Network Security Group with the SSH Rule
resource "azurerm_network_security_group" "cp2-secgroup" {
  name                = "security-group"
  location            = azurerm_resource_group.cp2-rg.location
  resource_group_name = azurerm_resource_group.cp2-rg.name

  security_rule {
    name                        = "sshrule"
    priority                    = 1001
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
  security_rule {  
    name                        = "http"
    priority                    = 1002
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "8080"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
  }
}

# Association of the NEtwork Security Group to the Subnet
resource "azurerm_subnet_network_security_group_association" "cp2-nsg-link" {
  subnet_id                 = azurerm_subnet.cp2-subnet.id
  network_security_group_id = azurerm_network_security_group.cp2-secgroup.id
}