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

resource "aws_instance" "node_express_api" {
  ami                         = "ami-01f18be4e32df20e2"
  subnet_id                   = aws_subnet.public_a.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.nodejs_security_group.id]
  key_name                    = var.key_name
  count                       = 1

  provisioner "remote-exec" {
    inline = [
      "echo 'Wait until SSH is ready'",
      # "sudo apt-get update", 
      # "sudo apt-get upgrade",
    ]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }
  provisioner "local-exec" {
    command = <<-EOT
    ansible-playbook  -i ${self.public_ip}, --private-key ${var.private_key_path} ${var.play_book_path} -e 'ansible_python_interpreter=/usr/bin/python3'
    touch ${var.inventory_path}
    echo ${self.public_ip} > ${var.inventory_path}
    EOT
  }

  tags = {
    Name = var.instance_name
  }
}
