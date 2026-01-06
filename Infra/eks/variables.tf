variable "aws_region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "netflix-eks-cluster"
}

variable "vpc_id" {
  description = "VPC ID from Phase 1"
}

variable "private_subnet_ids" {
  description = "Private subnets from Phase 1"
  type        = list(string)
}
