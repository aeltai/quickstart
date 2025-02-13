# Rancher resources

# Initialize Rancher server
resource "rancher2_bootstrap" "admin" {
  depends_on = [
    helm_release.rancher_server
  ]

  provider = rancher2.bootstrap

  password  = var.admin_password
  telemetry = true
}

# Create custom managed cluster for quickstart
resource "rancher2_cluster_v2" "quickstart_workload" {
  provider           = rancher2.admin
  name               = var.workload_cluster_name
  kubernetes_version = var.workload_kubernetes_version

  rke_config {
    # The fundamental cluster-level settings are defined here.
    machine_global_config = <<EOF
cni: cilium
disable-kube-proxy: false
etcd-expose-metrics: false
EOF

    # Override the Cilium helm chart values via the chart_values block.
    chart_values = <<EOF
rke2-cilium:
  encryption:
    enabled: true
    ipsec:
      encryptedOverlay: false
      interface: ""
      keyFile: "keys"
      keyRotationDuration: "5m"
      keyWatcher: true
      mountPath: "/etc/ipsec"
      secretName: "cilium-ipsec-keys"
    nodeEncryption: true
    strictMode:
      allowRemoteNodeIdentities: false
      cidr: ""
      enabled: false
    type: "wireguard"
    wireguard:
      persistentKeepalive: "0s"
      userspaceFallback: false
EOF
  }
}
