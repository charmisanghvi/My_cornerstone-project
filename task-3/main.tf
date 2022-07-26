terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "jenkins_server" {
  ami             = "ami-0cff7528ff583bf9a"
  instance_type   = "t2.micro"
  key_name        = "devopskp"
  security_groups = ["default"]
  user_data = file("jenkins.sh")

  tags = {
    Name = "Jenkins_server-terraform"
  }
}
  resource "aws_security_group" "default" {
	tags = {
	type = "jenkins-test-security-group"
}
}
# terraform {
#   required_version = ">= 0.14.9"
# }

# provider "aws" {
#   profile = "default"
#   region = "us-east-1"
# }

#  resource "aws_security_group" "jenkins_sg" {
#   name        = "jenkins_sg"
#   description = "Allow Jenkins Traffic"
#   vpc_id      = var.vpc_id

#   ingress {
#     description      = "Allow from Personal CIDR block"
#     from_port        = 8080
#     to_port          = 8080
#     protocol         = "tcp"
#     cidr_blocks      = [var.cidr_block]
#   }

#   ingress {
#     description      = "Allow SSH from Personal CIDR block"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = [var.cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "Jenkins SG"
#   }
# }

# data "aws_ami" "amazon_linux" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-2.0*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }

#   owners = ["amazon"] # Canonical
# }

# resource "aws_instance" "web" {
#   ami             = data.aws_ami.amazon_linux.id
#   instance_type   = "t2.micro"
#   key_name        = var.key_name
#   security_groups = [aws_security_group.jenkins_sg.name]
#   user_data       = "${file("install_jenkins.sh")}"
#   tags = {
#     Name = "Jenkins"
#   }
# }