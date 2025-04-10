locals {
  project_prefix         = data.terraform_remote_state.infra.outputs.project_prefix
  external_name          = try(data.terraform_remote_state.nap.outputs.external_name)
  host                   = data.terraform_remote_state.aks.outputs.cluster_endpoint
  cluster_ca_certificate = data.terraform_remote_state.aks.outputs.cluster_ca_certificate
  cluster_name           = data.terraform_remote_state.aks.outputs.cluster_name
  token                  = data.terraform_remote_state.aks.outputs.token
}