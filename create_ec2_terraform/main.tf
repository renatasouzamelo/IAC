terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.3.7"
}

provider "aws" {
  profile = "default"  
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {  
  ami           = "ami-095413544ce52437d"
  instance_type = "t2.micro"
  key_name = "iac_tf"
  user_data = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                echo “<h1>Mensagem a ser mostrada</h1>” > index.js
                nohup busybox httpd -f -p 8080 &
                EOF
  tags = {
    Name = "InstanceTwo"   #NAME INSTANCE
  }
}
