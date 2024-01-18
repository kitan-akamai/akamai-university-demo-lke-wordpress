terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
    }
  }
}

# Configure the Linode Provider
provider "linode" {
   token = var.linode_token
}

provider "kubernetes" {
  config_path = "./${var.cluster_label}-kubeconfig.yaml"
}

provider "helm" {
  kubernetes {
    config_path = "./${var.cluster_label}-kubeconfig.yaml"
  }
}