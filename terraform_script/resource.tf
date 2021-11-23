terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "fill this with your ssh public key"
}


resource "aws_instance" "app_server" {
  ami             = "ami-0fed77069cd5a6d6c"
  instance_type   = "t2.micro"
  key_name        = "deployer-key"
  security_groups = [aws_security_group.falgi_security_group.name]
  tags = {
    Name = "AppServerInstance"
  }
}

resource "aws_default_vpc" "main" {
  tags = {
    name = "main"
  }
}
