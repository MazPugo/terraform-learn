variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "env_prefix" {}
variable "my_ip" {}
variable "instance_type" {}
variable "public_key_location" {}
variable "image_name" {
  type    = string
  default = "amzn2-ami-kernel-*-x86_64-gp2"
}
