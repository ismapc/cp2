output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "webser_id" {
  value = azurerm_virtual_machine.cp2-webserver.id
}

output "public_ip_address" {
  value = azurerm_public_ip.cp2-public-ip.ip_address
}