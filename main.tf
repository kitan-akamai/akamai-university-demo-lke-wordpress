resource "linode_lke_cluster" "wordpress-cluster" {
    label       = var.cluster_label
    k8s_version = "1.28"
    region      = var.region
    tags        = ["demo-au"]

    pool {
        type  = var.instance_type
        count = 3

        autoscaler {
          min = 3
          max = 10
        }
    }

  lifecycle {
    ignore_changes = [
      pool.0.count
    ]
  }
}

resource "helm_release" "wordpress" {
  name       = var.helm_deployment_label
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  depends_on = [linode_lke_cluster.wordpress-cluster]
}

output "kubeconfig" {
  value = linode_lke_cluster.wordpress-cluster.kubeconfig
  sensitive = true
}

locals {
  decoded_kubeconfig = base64decode(linode_lke_cluster.wordpress-cluster.kubeconfig)
}

resource "null_resource" "save_kubeconfig" {
  provisioner "local-exec" {
    command = "echo '${local.decoded_kubeconfig}' > ./${var.cluster_label}-kubeconfig.yaml"
  }
  depends_on = [linode_lke_cluster.wordpress-cluster]
}
