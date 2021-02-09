resource “azurerm_resource_group” “demo” {
name = “kub-cluster-demo-rg”
location = ${var.azure_region}
tags {
“Owner” = “Manish”
“Department” = “Devops”
}
}