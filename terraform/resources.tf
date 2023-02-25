#1º Crear grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location_name
}

#2º Crear grupo de recursos
