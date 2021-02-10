data "azurerm_kubernetes_cluster "my_cluster" {
  name     = "${var.cluster_name}"
  location = "${azurerm_resource_group.demo.location}"
}

# 
provider "kubectl" {
  load_config_file       = false
  host                   = "https://${data.azurerm_kubernetes_cluster.my_cluster.endpoint}"
  token                  = "${data.azurerm_kubernetes_cluster.my_cluster.access_token}"
  cluster_ca_certificate = "${base64decode(data.azurerm_kubernetes_cluster.my_cluster.master_auth.0.cluster_ca_certificate)}"
}

data "kubectl_filename_list" "manifests" {
    pattern = "./manifests/*.yaml"
}

resource "kubectl_manifest" "test" {
    count = length(data.kubectl_filename_list.manifests.matches)
    yaml_body = file(element(data.kubectl_filename_list.manifests.matches, count.index))
}


