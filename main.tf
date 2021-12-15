resource "kubernetes_config_map" "grafana_dashboard_mounts" {
  count    = length(var.DASHBOARD_FILES)

  metadata {
    name               = "${var.DASHBOARD_FILES[count.index].basename}"
    namespace          = var.NAMESPACE
    labels = {
      "grafana_dashboard" = "1",
      "heat_reporting_fwk" = "true"
    }
  }

  data = {
    "${var.DASHBOARD_FILES[count.index].name}" = file(var.DASHBOARD_FILES[count.index].localPath)
  }
}