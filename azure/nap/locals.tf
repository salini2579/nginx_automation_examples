locals {
  project_prefix         = data.terraform_remote_state.infra.outputs.project_prefix
#  build_suffix            = data.terraform_remote_state.infra.outputs.build_suffix
  host                   = data.terraform_remote_state.aks.outputs.aks_host
  kubeconfig_certificate_authority_data = data.terraform_remote_state.aks.outputs.kubeconfig_certificate_authority_data
  cluster_name           = data.terraform_remote_state.aks.outputs.cluster_name
  cluster_id           = data.terraform_remote_state.aks.outputs.cluster_id
#  cluster_token          = data.terraform_remote_state.aks.outputs.kubernetes_cluster_access_token
#  cidr                   = data.terraform_remote_state.infra.outputs.cidr
}