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
variable "aws_owner_id" {
  description = "Contains owner id "
  type        = string
}

variable "aws_ami_name" {
  description = "Name of the ami I want for my project"
  type        = string
}

variable "ec2_type" {
  description = "Type of my ec2 instance"
  type        = string
  default     = "t2.micro"

}
# VPC Variables 
variable "vpc_cidr" {
  description = "vpc cidr block"
  type        = string
}

variable "vpc_name" {
  description = "Name of the vpc for my project"
  type        = string
}

variable "public_subnet_name" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "private_subnet_name2" {
  type = string
}

variable "private_subnet_name3" {
  type = string
}

variable "my_keypair" {
  default = "Mackey"
}

variable "number_of_instances" {
  description = "Amount of instances for my public subnet"
}

variable "lb_arn" {
  type    = string
  default = ""
}

variable "lb_name" {
  type    = string
  default = ""
}

data "aws_lb" "test" {
  arn  = var.lb_arn
  name = var.lb_name
}