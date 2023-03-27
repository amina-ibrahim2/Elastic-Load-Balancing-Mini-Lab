#DEFINING ALL VARIABLES

# environment variables 
variable "region" {
  description = "region to create resources"
  type        = string   
}

variable "project_name" {
  description = "name of project"
  type        = string   
}

variable "environment" {
  description = "environment"
  type        = string   
}
# VPC Variables 
variable "vpc_cidr" {
  description = "vpc cidr block"
  type        = string
}

variable "my-test-public-subnet-az-1_cidr" {
  description = "public subnet az1 cidr block"
  type        = string
}

variable "my-test-public-subnet-az-2_cidr" {
  description = "public subnet az2 cidr block"
  type        = string
}

variable "my-test-public-subnet-az-3_cidr" {
  description = "public subnet az3 cidr block"
  type        = string
}

variable "my-test-private-subnet-az1_cidr" {
  description = "private app subnet az1 cidr block"
  type        = string
}

variable "my-test-private-subnet-az2_cidr" {
  description = "private app subnet az2 cidr block"
  type        = string
}

variable "my-test-private-subnet-az3_cidr" {
  description = "private app subnet az3 cidr block"
  type        = string
}