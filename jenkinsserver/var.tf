variable "aws_region" {
 default = "us-east-1"
}

variable "vpc_cidr" {
 default = "10.0.0.0/16"
}

variable "subneta_cidr" {
 default = "10.0.1.0/24"
}

variable "subnetb_cidr" {
 default = "10.0.2.0/24"
}

variable "ami_id" {
 default = "ami-0ecb62995f68bb549"
}

variable "key_id" {
 default = "mykey2"
}

variable "instance_type" {
 default = "t2.micro"
}

 
 
