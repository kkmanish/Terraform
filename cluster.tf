resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.cluster_name}"
  location            = "${azurerm_resource_group.demo.location}"
  dns_prefix          = "${var.dns_prefix}-aksdemo"
  resource_group_name = "${azurerm_resource_group.demo.name}"
  

  linux_profile {
    admin_username = "azureuser"

    ssh_key {
      key_data = "${file(var.public_ssh_key_path)}"
    }
  }

  agent_pool_profile {
    name            = "agentpool"
    count           = "${var.agent_count}"
    vm_size         = "Standard_D2_v2"
    os_type         = "Linux"
    os_disk_size_gb = 30

    vnet_subnet_id = "${azurerm_subnet.demo.id}"
  }


  service_principal {
    client_id     = "${var.client_id}"
    client_secret = "${var.client_secret}"
  }

 

  
}