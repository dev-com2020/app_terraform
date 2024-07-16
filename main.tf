terraform {
  required_version = ">= 1.9.2"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.58.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
}

resource "aws_security_group" "web_server_sg" {
    name = "web_server_sg"
    description = "Allow http and shh traffic"
    vpc_id = "vpc-0023a48bafb84f43c"

    # ingress = {
    #     from_port = 22
    #     to_port = 22
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }

    # ingress = {
    #     from_port = 443
    #     to_port = 443
    #     protocol = "tcp"
    #     cidr_blocks = ["0.0.0.0/0"]
    # }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 443
        to_port = 443
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
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "web_server_sg"
    }
}

resource "aws_instance" "web_server" {
    count = 2
    ami = var.ami_id
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web_server_sg.name]
    key_name = "ALX-2"

    provisioner "remote-exec" {
        inline = [ 
            "sudo apt-get update",
            "sudo apt-get install -y nginx",
         ]
    
    connection {
        type     = "ssh"
        user     = "ubuntu"
        private_key = file("ALX-2.pem")
        host     = self.public_ip
  }
      
    }

    tags = {
      Name = "web_server_${count.index + 1}"
    }
  
}



