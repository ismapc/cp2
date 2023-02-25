#---------------------------1º Crear grupo de recursos ---------------------------
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location_name
}

#--------------------------- 2º Crear recursos de red ---------------------------
resource "azurerm_virtual_network" "cp2-vnet" {
  name                = var.network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

#-- subred dentro del rango de direcciones de la red
resource "azurerm_subnet" "cp2-subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.cp2-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

#-- Creacion de una IP publica
resource "azurerm_public_ip" "cp2-public-ip" {
  name                = var.public_ip
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}

#-- Creacion de la interfaz de red
resource "azurerm_network_interface" "cp2-nic" {
  name                = var.vm_nic
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "cp2-nic-ip"
    subnet_id                     = azurerm_subnet.cp2-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cp2-public-ip.id
  }
}


#--------------------------- 3º Crear maquina virtual  ---------------------------
resource "azurerm_virtual_machine" "cp2-webserver" {
  name                  = var.vm_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.cp2-nic.id]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "cp2-webserver-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "cp2-webserver-vm"
    admin_username = "uniruser"
    #admin_password = "Web-server!00"
    #ssh-keygen -t rsa -b 4096 -C "web_server_key" -f ~/.ssh/web_server_key
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("~/.ssh/web_server_key.pub")
      path     = "/home/uniruser/.ssh/authorized_keys"
    }  
    #Para acceder:
    #ssh -i ~/.ssh/web_server_key uniruser@<public-ip-address>  
  }

  #Si no estableces este parametro el disco persiste, provoca un error al hacer destroy
  #no es necesario esta persistencia ahora
  delete_os_disk_on_termination = true
}