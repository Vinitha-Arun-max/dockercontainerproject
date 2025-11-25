resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidr
}
resource "aws_subnet" "subneta" {
 vpc_id = aws_vpc.main.id
 cidr_block = var.subneta_cidr
 map_public_ip_on_launch = true 
}
resource "aws_subnet" "subnetb" {
 vpc_id = aws_vpc.main.id
 cidr_block = var.subnetb_cidr
 map_public_ip_on_launch = true
}


resource "aws_internet_gateway" "igw"{
 vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public_rt" {
 vpc_id = aws_vpc.main.id
 route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}
}

resource "aws_route_table_association" "public_association" {
 subnet_id = aws_subnet.subneta.id
 route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_ass_01" {
 subnet_id = aws_subnet.subnetb.id
 route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "sg-01" {
 vpc_id = aws_vpc.main.id
 ingress {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

ingress {
 from_port = 8080
 to_port = 8080
 protocol = "tcp"
 cidr_blocks = ["0.0.0.0/0"]
}
egress {
 from_port = 0
 to_port = 0
 protocol = -1
 cidr_blocks = ["0.0.0.0/0"]
}
}

resource "aws_instance" "jenkinsserver" {
 instance_type = var.instance_type
 ami = var.ami_id
 key_name = var.key_id
 vpc_security_group_ids = [aws_security_group.sg-01.id]
 subnet_id = aws_subnet.subneta.id
 associate_public_ip_address = true
 user_data = file ("${path.module}/user_data.sh")
}

output "jenkins_public_ip" {
 value = aws_instance.jenkinsserver.public_ip
}

