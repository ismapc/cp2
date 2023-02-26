
resource "azurerm_role_assignment" "cp2-role-acrpull" {
  scope                            = azurerm_container_registry.cp2-registry.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.cp2-kubernetes-cluster.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}

resource "azurerm_container_registry" "cp2-registry" {
  name                          = var.container_registry
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  sku                           = "Standard"
  admin_enabled                 = true
  public_network_access_enabled = true
}


