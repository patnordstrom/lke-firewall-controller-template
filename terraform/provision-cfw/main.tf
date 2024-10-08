resource "helm_release" "cloud_firewall_crd" {
  name       = "cloud-firewall-crd"
  repository = "https://linode.github.io/cloud-firewall-controller"
  chart      = "cloud-firewall-crd"
}

resource "helm_release" "cloud_firewall_ctrl" {
  name       = "cloud-firewall-ctrl"
  repository = "https://linode.github.io/cloud-firewall-controller"
  chart      = "cloud-firewall-controller"
  depends_on = [ helm_release.cloud_firewall_crd ]
}

resource "time_sleep" "allow_firewall_creation" {
  create_duration = "30s"
  triggers = {
    controller_release_version = helm_release.cloud_firewall_ctrl.version
    lke_cloud_firewall_label = "lke-${var.lke_cluster_id}"
  }
}

data "linode_firewalls" "lke_cloud_firewall" {
  filter {
    name = "label"
    values = [ time_sleep.allow_firewall_creation.triggers["lke_cloud_firewall_label"] ]
  }
}
