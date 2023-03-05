resource "azurerm_resource_group" "cp2-rg" {
  name     = var.resource_group_name
  location = var.location_name
}

resource "azurerm_virtual_network" "cp2-vnet" {
  name                = var.network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.cp2-rg.location
  resource_group_name = azurerm_resource_group.cp2-rg.name
}

resource "azurerm_subnet" "cp2-subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.cp2-rg.name
  virtual_network_name = azurerm_virtual_network.cp2-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "cp2-public-ip" {
  name                = var.public_ip
  location            = azurerm_resource_group.cp2-rg.location
  resource_group_name = azurerm_resource_group.cp2-rg.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "cp2-nic" {
  name                = var.vm_nic
  location            = azurerm_resource_group.cp2-rg.location
  resource_group_name = azurerm_resource_group.cp2-rg.name

  ip_configuration {
    name                          = "cp2-nic-ip"
    subnet_id                     = azurerm_subnet.cp2-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cp2-public-ip.id
  }
}