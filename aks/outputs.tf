output "resource_group_name" {
  value = azurerm_resource_group.kube_rg.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.kube_cluster.name
}