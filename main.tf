// Assign AWS Region to Create Things

provider "aws" {
  region = var.aws_region
}

// Create VPC

resource "aws_vpc" "main" {
  cidr_block = "172.10.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "main"
  }
}

// Create Security Group with Firewall

resource "aws_security_group" "jenkin-sg" {
  name = var.security_group
  description = "Security group for EC-2 instance"

  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group
  }
}

//Create EC-2 Instance

resource "aws_instance" "firstinstance" {
  ami = var.ami_id
  key_name = var.key_name
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]

  tags = {Name=var.tag_name}
}

// Create Elatic IP

resource "aws_eip" "firstinstance" {
  domain = "vpc"
  instance = aws_instance.firstinstance.id

  tags = {Name = "Terraform_elastic_ip"}
}
