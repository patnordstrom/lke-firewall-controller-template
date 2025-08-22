resource "linode_lke_cluster" "lke_test_cluster" {
  label       = var.lke_cluster_label
  k8s_version = var.k8s_version
  region      = var.region
  apl_enabled = var.enable_app_platform

  control_plane {
    high_availability = (var.enable_ha_control_plane || var.enable_app_platform)
  }

  pool {
    type  = var.lke_image_type
    count = var.lke_node_pool_count
  }

}