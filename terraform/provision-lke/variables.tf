variable "region" {
  type        = string
  description = "Linode region to deploy"
  default     = "us-ord"
}

variable "lke_cluster_label" {
  type        = string
  description = "Label for LKE cluster"
  default     = "lke-test-cluster"
}

variable "lke_image_type" {
  type        = string
  description = "The image type to deploy all nodes with."
  default     = "g6-standard-1"
}

variable "k8s_version" {
  type        = string
  description = "The version of LKE to deploy.  Default not provided because changes frequently."
}