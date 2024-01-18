variable "linode_token" {
  default = ""
  type = string
  sensitive   = true
}

variable "instance_type" {
  description = "Instance type"
  default = "g6-dedicated-8"
  type = string
}

variable "region" {
  description = "region"
  type = string
  default = "ap-south"
}

variable "cluster_label" {
  description = "LKE cluster label"
  type = string
  default = "wordpress"
}

variable "helm_deployment_label"  {
  description = "K8S deployment label"
  type = string
  default = "wordpress"
}
