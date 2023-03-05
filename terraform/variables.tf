variable "resource_group_name" {
  type        = string
  description = "Name of Resources Group"
}

variable "location_name" {
  type        = string
  description = "Name of the resources Location"
}

variable "network_name" {
  type        = string
  description = "Name of Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of Subnet"
}

variable "public_ip" {
  type        = string
  description = "Name of public IP"
}

variable "vm_nic" {
  type        = string
  description = "Name of Network Interface"
}

variable "vm_name" {
  type        = string
  description = "Name of webserver VM"
}

variable "vm_user" {
  type        = string
  description = "Admin and user webserver"
}

variable "vm_size" {
  type = string
  description = "Virtual machine type/size"
}

variable "public_key_path" {
  type = string
}

variable "container_registry" {
  type        = string
  description = "Name of Container Registry Server"
}

 variable "aks_cluster_name" {
  type        = string
  description = "Name of AKS cluster"
 }

variable "aks_kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  }

variable "aks_workers_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

variable "aks_workers_type" {
  type        = string
  description = "Type of AKS worker nodes"
}

variable "aks_kubeconfig_path" {
  type        = string
  description = "ASK Kubeconfig path"
}



