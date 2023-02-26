resource "azurerm_public_ip" "cp2-public-ip" {
  name                = var.public_ip
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}


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


resource "azurerm_virtual_machine" "cp2-webserver" {
  name                  = var.vm_name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.cp2-nic.id]
  vm_size               = var.vm_type

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
  }

  os_profile_linux_config {
    disable_password_authentication = true
    #ssh-keygen -t rsa -b 4096 -C "web_server_key" -f ~/.ssh/web_server_key
    ssh_keys {
      #TODO: pasar a variables
      key_data = file("~/.ssh/web_server_key.pub")
      path     = "/home/uniruser/.ssh/authorized_keys"
    }  
    #To open a shell in the new machine
    #ssh -i ~/.ssh/web_server_key uniruser@<public-ip-address>  
  }

  #This parameter must set true to remove the disk when the machine is revomed
  delete_os_disk_on_termination = true
}