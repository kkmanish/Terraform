variable “subscription_id”{}
variable “client_id”{}
variable “client_secret”{}
variable “tenant_id”{}

variable “azure_region” {
default = Central US”
}
variable "prefix"{
    default = "kube"
}

variable "agent_count" {
    default = 2
}

variable "ssh_public_key" {
    default = ".ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "k8stest"
}

variable "cluster_name" {
    default = "democluster"
}

