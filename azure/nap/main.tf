provider "azurerm" {
  features {}
  subscription_id = jsondecode(var.azure_credentials)["subscriptionId"]
  client_id       = jsondecode(var.azure_credentials)["clientId"]
  client_secret   = jsondecode(var.azure_credentials)["clientSecret"]
  tenant_id       = jsondecode(var.azure_credentials)["tenantId"]
}

#provider "kubernetes" {
#  host                   = data.terraform_remote_state.aks.outputs.aks_host
#  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.kubeconfig-certificate-authority-data)
#  token                  = data.aws_eks_cluster_auth.auth.token
#  exec {
#    api_version = "client.authentication.k8s.io/v1beta1"
#    command     = "aws"
#    args = [
#      "eks",
#      "get-token",
#      "--cluster-name",
#      data.terraform_remote_state.eks.outputs.cluster_name
#    ]
#  }
#}

provider "kubernetes" {
  host                   = local.host
  cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
#  token = local.token
  load_config_file       = true
  exec {
    api_version = "client.authentication.k8s.io/v1"
    command     = "az"
    args = [
      "aks",
      "get-credentials",
      "--resource-group", var.resource_group_name,
      "--name", data.terraform_remote_state.aks.outputs.cluster_name,
#      "--admin"
    ]
  }
}

#provider "helm" {
#  kubernetes {
#    host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
#    cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.kubeconfig-certificate-authority-data)
#    token                  = data.aws_eks_cluster_auth.auth.token
#    exec {
#      api_version = "client.authentication.k8s.io/v1beta1"
#      command     = "aws"
#      args = [
#        "eks",
#        "get-token",
#        "--cluster-name",
#        data.terraform_remote_state.eks.outputs.cluster_name
#      ]
#    }
#  }
#}

provider "helm" {
  kubernetes {
    host                   = local.host
    cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
#    token = local.token

    exec {
      api_version = "client.authentication.k8s.io/v1"
      command     = "az"
      args = [
        "aks",
        "get-credentials",
        "--resource-group", var.resource_group_name,
        "--name", data.terraform_remote_state.aks.outputs.cluster_name,
#        "--admin"
      ]
    }
  }
}

#provider "kubectl" {
#  host                   = data.terraform_remote_state.eks.outputs.cluster_endpoint
#  cluster_ca_certificate = base64decode(data.terraform_remote_state.eks.outputs.kubeconfig-certificate-authority-data)
#  token                  = data.aws_eks_cluster_auth.auth.token
#  load_config_file       = false
#  exec {
#    api_version = "client.authentication.k8s.io/v1beta1"
#    command     = "aws"
#    args = [
#      "eks",
#      "get-token",
#      "--cluster-name",
#      data.terraform_remote_state.eks.outputs.cluster_name
#    ]
#  }
#}

provider "kubectl" {
  host                   = local.host
  cluster_ca_certificate = base64decode(local.cluster_ca_certificate)
  token                  = local.token
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1"
    command     = "az"
    args = [
      "aks",
      "get-credentials",
      "--resource-group", var.resource_group_name,
      "--name", data.terraform_remote_state.aks.outputs.cluster_name,
#      "--admin"
    ]
  }
}