variable "resource_group_name" {
  type        = string
  description = "Name of Resources Group"
  default     = "cp2-resources"
}

variable "location_name" {
  type        = string
  description = "Name of the resources Location"
  default     = "EastUS2"
}

variable "network_name" {
  type        = string
  description = "Name of Network"
  default     = "cp2-vnet"
}

variable "subnet_name" {
  type        = string
  description = "Name of Subnet"
  default     = "cp2-subnet1"
}

variable "public_ip" {
  type        = string
  description = "Name of public IP"
  default     = "cp2-pubip"
}
variable "vm_nic" {
  type        = string
  description = "Name of Network Interface"
  default     = "cp2-nic"
}

variable "vm_name" {
  type        = string
  description = "Name of webserver VM"
  default     = "cp2-webserver"
}
variable "vm_type" {
  type        = string
  description = "Type of AKS worker nodes"
  default     = "Standard_DS1_v2"
}

variable "container_registry" {
  type        = string
  description = "Name of Container Registry Server"
  default     = "cp2acs"
}
 variable "aks_cluster_name" {
  type        = string
  description = "Name of AKS cluster"
  default     = "cp2-kubernetes-cluster"
 }

variable "aks_kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.26.0"
  }
variable "aks_workers_count" {
  type        = number
  description = "Number of AKS worker nodes"
  default     = 1
}
variable "aks_workers_type" {
  type        = string
  description = "Type of AKS worker nodes"
  default     = "Standard_DS2_v2"
}


