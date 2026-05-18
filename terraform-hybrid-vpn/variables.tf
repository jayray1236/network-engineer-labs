variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the AWS VPC"
  type        = string
  default     = "10.50.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.50.1.0/24"
}

variable "onprem_public_ip" {
  description = "Public IP address of the on-prem firewall or router"
  type        = string
  default     = "203.0.113.10"
}

variable "onprem_network_cidr" {
  description = "Internal on-prem network that will route across the VPN"
  type        = string
  default     = "10.10.0.0/16"
}
