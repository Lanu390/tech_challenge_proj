variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"  
}
variable "private_subnet_cidr_blocks" { 
  description = "value for the private_cidr_block"
}
variable "public_subnet_cidr_blocks" { 
  description = "value for the public_subnet_cidr_block"
}
variable "aws_region" {
  default = "us-west-2"
  description = "aws region"
}
variable "sg_cidr_blocks" {  
  description = "value for the CIDR range"
}


