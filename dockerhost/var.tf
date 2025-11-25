variable "aws_region" {
 default = "ap-south-1"
}

variable "vpc_cidr" {
 default = "192.16.0.0/16"
}

variable "subneta_cidr" {
 default = "192.16.1.0/24"
}

variable "subnetb_cidr" {
 default = "192.16.2.0/24"
}

variable "ami_id" {
 default = "ami-02b8269d5e85954ef"
}

variable "instance_type" {
 default = "t3.micro"
}

variable "key_name" {
 default = "mykey"
}
