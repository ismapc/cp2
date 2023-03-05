output "resource_group_id" {
  value = azurerm_resource_group.cp2-rg.id
}

output "webser_id" {
  value = azurerm_linux_virtual_machine.cp2-webserver.id
}

output "webserver_username" {
  value = azurerm_linux_virtual_machine.cp2-webserver.admin_username
}

output "public_ip_address" {
  value = azurerm_public_ip.cp2-public-ip.ip_address
}

output "acr_id" {
  value = azurerm_container_registry.cp2-registry.id
}

output "acr_login_server" {
  value = azurerm_container_registry.cp2-registry.login_server
}

output "acr_username" {
  value = azurerm_container_registry.cp2-registry.admin_username
}

output "acr_password" {
  value = azurerm_container_registry.cp2-registry.admin_password
  sensitive = true
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.cp2-kubernetes-cluster.name
}
output "aks_id" {
  value = azurerm_kubernetes_cluster.cp2-kubernetes-cluster.id
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.cp2-kubernetes-cluster.fqdn
}

output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.cp2-kubernetes-cluster.node_resource_group
}

output "kubeconfig" {
  value = azurerm_kubernetes_cluster.cp2-kubernetes-cluster.kube_config_raw
  sensitive = true
}

