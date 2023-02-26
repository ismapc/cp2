resource "azurerm_kubernetes_cluster" "cp2-kubernetes-cluster" {
  name                = var.aks_cluster_name
  kubernetes_version  = var.aks_kubernetes_version
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_cluster_name

  default_node_pool {
    name                = "system"
    node_count          = var.aks_workers_count
    vm_size             = var.aks_workers_type
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }
}
