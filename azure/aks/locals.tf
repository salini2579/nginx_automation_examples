locals {
  vnet_name           = data.terraform_remote_state.infra.outputs.vnet_name
  subnet_name         = data.terraform_remote_state.infra.outputs.subnet_name
  subnet_id           = data.terraform_remote_state.infra.outputs.vnet_id
  vnet_id             = data.terraform_remote_state.infra.outputs.subnet_id
#  aks_resource_group_name  = format("MC_%s-rg-%s_%s-aks-%s_%s", local.project_prefix, local.build_suffix,local.project_prefix, local.build_suffix,local.azure_region)
}