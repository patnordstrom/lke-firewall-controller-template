output lke_cloud_firewall_id {
  value = try(data.linode_firewalls.lke_cloud_firewall.firewalls.0.id, null)
}