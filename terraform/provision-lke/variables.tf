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

variable "lke_node_pool_count" {
  type = number
  description = "number of nodes to deploy for lke"
  default = 2
  
}

variable "enable_ha_control_plane" {
  type = bool
  description = "determines if we want to enable the HA control plane"
  default = false
}

variable "enable_app_platform" {
 type = bool
 description = "determines if we enable App Platform" 
 default = false
}

variable "k8s_version" {
  type        = string
  description = "The version of LKE to deploy.  Default not provided because changes frequently."
}