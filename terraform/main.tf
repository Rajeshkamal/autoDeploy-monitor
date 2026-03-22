provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "app_sg" {
  name        = "autodeploy-sg"
  description = "Allow SSH and app traffic"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.app_sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "allow_app" {
  security_group_id = aws_security_group.app_sg.id
  from_port         = 5000
  to_port           = 5000
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.app_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "autodeploy-monitor"
  }
}

resource "aws_s3_bucket" "app_logs" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "autodeploy-logs"
  }
}
