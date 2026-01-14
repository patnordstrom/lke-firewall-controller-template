resource "linode_lke_cluster" "lke_test_cluster" {
  label       = var.lke_cluster_label
  k8s_version = var.k8s_version
  region      = var.region
  apl_enabled = var.enable_app_platform

  control_plane {
    high_availability = (var.enable_ha_control_plane || var.enable_app_platform)

    dynamic "acl" {
      for_each = var.enable_control_plane_acl ? [1] : []
      content {
        enabled = true
        addresses {
          ipv4 = var.control_plane_acl_ipv4_addresses
          ipv6 = var.control_plane_acl_ipv6_addresses
        }
      }
    }

  }

  pool {
    type  = var.lke_image_type
    count = var.lke_node_pool_count
  }

}