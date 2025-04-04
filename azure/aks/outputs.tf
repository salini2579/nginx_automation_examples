output "kubeconfig" {
  value = data.azurerm_kubernetes_cluster.aks.kube_config[0].raw_kube_config
  sensitive = true
}
output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
  sensitive = true
}
output "cluster_id" {
  value = azurerm_kubernetes_cluster.aks.id
  sensitive = true
}