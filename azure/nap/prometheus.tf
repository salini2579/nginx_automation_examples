resource "helm_release" "prometheus" {
    name = format("%s-pro", var.project_prefix)
    repository = "https://prometheus-community.github.io/helm-charts"
    chart = "prometheus"
    #version = "27.3.0"
    namespace = kubernetes_namespace.monitoring.metadata[0].name
    values = [file("./charts/prometheus/values.yaml")]


}