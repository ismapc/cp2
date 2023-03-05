resource "azurerm_linux_virtual_machine" "cp2-webserver" {
  name                  = var.vm_name
  location              = azurerm_resource_group.cp2-rg.location
  resource_group_name   = azurerm_resource_group.cp2-rg.name
  size                  = var.vm_size
  admin_username        = var.vm_user
  network_interface_ids = [azurerm_network_interface.cp2-nic.id,]

  admin_ssh_key {
    username   = var.vm_user
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  plan {
    name      = "centos-8-stream-free"
    product   = "centos-8-stream-free"
    publisher = "cognosys"
  }

  source_image_reference {
    publisher = "cognosys"
    offer     = "centos-8-stream-free"
    sku       = "centos-8-stream-free"
    version   = "22.03.28"
  }
   #ssh -i var.public_key_path var.ssh_user@<public-ip-address>  
}