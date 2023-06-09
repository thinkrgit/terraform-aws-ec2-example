terraform {
 
 
}

provider "aws" {

  region  = "us-east-2"
  
}




data "aws_vpc" "cal_vpc" {
  id = var.vpc_id
}
data "template_file" "user_data" {
	template = file("${abspath(path.module)}/userdata.yaml")
}

resource "aws_security_group" "sg_cal_server" {
  name        = "sg_cal_server"
  description = "cal_server security group"
  vpc_id      = data.aws_vpc.cal_vpc.id
  

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
  }
  ingress {
    # office ip
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.office_cidr_block]
    ipv6_cidr_blocks = []
  }
  ingress {
    # house ip
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.home_cidr_block]
    ipv6_cidr_blocks = []
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_key_pair" "deployer-key" {
  key_name   = "deployer-key"
  public_key = var.public_key
}

resource "aws_instance" "cal_server" {
  ami           = var.ami
  instance_type = var.inst_type
  key_name = aws_key_pair.deployer-key.key_name
  vpc_security_group_ids = [aws_security_group.sg_cal_server.id]
  user_data = data.template_file.user_data.rendered

  subnet_id = var.public_subnet_id
  
  tags = {
    name = var.server_name
  }
 
}