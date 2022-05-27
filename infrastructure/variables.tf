variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "node_express_api"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "private_key_path" {
  default = "~/Downloads/thomas.pem"
}

variable "key_name" {
  default = "thomas"
}

variable "ssh_user" {
  default = "ubuntu"
}

variable "inventory_path" {
  default = "/home/erklarungsnot/Git/devops/ec2-ansible/ansible/inventory"
}

variable "play_book_path" {
  default = "/home/erklarungsnot/Git/devops/ec2-ansible/ansible/nodejs.yaml"
}
