# Variables for AWS infrastructure module

// TODO - use null defaults

# Required
variable "aws_access_key" {
  type        = string
  description = "AWS access key used to create infrastructure"
}

# Required
variable "aws_secret_key" {
  type        = string
  description = "AWS secret key used to create AWS infrastructure"
}

variable "aws_session_token" {
  type        = string
  description = "AWS session token used to create AWS infrastructure"
  default     = ""
}

variable "aws_region" {
  type        = string
  description = "AWS region used for all resources"
  default     = "eu-central-1"
}

variable "aws_zone" {
  type        = string
  description = "AWS zone used for all resources"
  default     = "us-east-1b"
}

variable "prefix" {
  type        = string
  description = "Prefix added to names of all resources"
  default     = "quickstart"
}

variable "instance_type" {
  type        = string
  description = "Instance type used for all EC2 instances"
  default     = "t3a.large"
}


variable "quickstart_node_2_instance_type" {
  description = "Instance type for the second quickstart node"
  type        = string
  default     = "t3a.large"
}

variable "rancher_kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for Rancher server cluster"
  default     = "v1.24.14+k3s1"
}

variable "workload_kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for managed workload cluster"
  default     = "v1.31.3+rke2r1"
}

variable "cert_manager_version" {
  type        = string
  description = "Version of cert-manager to install alongside Rancher (format: 0.0.0)"
  default     = "1.11.0"
}

variable "rancher_version" {
  type        = string
  description = "Rancher server version (format: v0.0.0)"
  default     = "2.7.9"
}

variable "rancher_helm_repository" {
  type        = string
  description = "The helm repository, where the Rancher helm chart is installed from"
  default     = "https://releases.rancher.com/server-charts/latest"
}

# Required
variable "rancher_server_admin_password" {
  type        = string
  description = "Admin password to use for Rancher server bootstrap, min. 12 characters"
}

# Required
variable "add_windows_node" {
  type        = bool
  description = "Add a windows node to the workload cluster"
  default     = false
}
variable "node_username" {
  description = "Username for the EC2 instances"
  type        = string
  default     = "ec2-user"  # or any other default username you prefer
}

variable "additional_worker_nodes_count" {
  type        = number
  description = "Number of additional worker nodes to add"
  default     = 2
}
