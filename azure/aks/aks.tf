resource "azurerm_kubernetes_cluster" "aks" {
  name                = format("%s-aks", var.project_prefix)
  location            = var.azure_region
  resource_group_name = var.resource_group_name
  dns_prefix          = format("%s-aks-dns", var.project_prefix)
  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_D2_v2"
    vnet_subnet_id      = null
    auto_scaling_enabled= false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
	network_plugin = "azure"
  }
}

## Azure Virtual Network peering between AKS created vnet and Azure Infra created Vnet
#resource "azurerm_virtual_network_peering" "peer_a2b" {
#  name                         = "peer-aks-to-vnet"
#  resource_group_name          = var.resource_group_name
#  virtual_network_name         = local.vnet_name
#  remote_virtual_network_id    = data.azurerm_resources.vnet[0].resources[0].id
#  allow_virtual_network_access = true
#  allow_forwarded_traffic      = true
#  depends_on = [data.azurerm_resources.vnet]
#}
#
#resource "azurerm_virtual_network_peering" "peer_b2a" {
#  name                         = "peer-vnet-to-aks"
#  resource_group_name          = format("MC_%s-rg-%s_%s-aks-%s_%s", local.project_prefix, local.build_suffix,local.project_prefix, local.build_suffix,local.azure_region)
#  virtual_network_name         = data.azurerm_resources.vnet[0].resources[0].name
#  remote_virtual_network_id    = local.vnet_id
#  allow_virtual_network_access = true
#  allow_forwarded_traffic      = true
#  depends_on                   = [azurerm_virtual_network_peering.peer_a2b]
#}
#
##Fetch kubeconfig file
#resource "local_file" "kubeconfig" {
#  depends_on   = [azurerm_kubernetes_cluster.ce_waap]
#  filename     = "./kubeconfig"
#  content      = azurerm_kubernetes_cluster.ce_waap.kube_config_raw
#}
#
## Deploy application using yaml
#resource "null_resource" "deploy-yaml" {
#  depends_on  = [local_file.kubeconfig]
#  provisioner "local-exec" {
#    command = "curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl"
#  }
#  provisioner "local-exec" {
#      command = "./kubectl apply -f manifest.yaml"
#      environment = {
#      		KUBECONFIG = "./kubeconfig"
#    }
#  }
#}