terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.39"
    }
  }

  required_version = ">= 1.3.4"
}

# AWS Provider
provider "aws" {
  region = "eu-central-1"
}

resource "aws_lightsail_key_pair" "key_pair" {
  name       = "LightsailKey"
  public_key = file("public-keys/LightsailKey.pub")
}

resource "aws_lightsail_static_ip_attachment" "vps_static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.vps_static_ip.id
  instance_name  = aws_lightsail_instance.vps_instance.id
}

resource "aws_lightsail_static_ip" "vps_static_ip" {
  name = "husovschi-vps-static_ip"
}

resource "aws_lightsail_instance" "vps_instance" {
  name              = "husovschi-vps-instance"
  availability_zone = "eu-central-1a" # Frankfurt
  blueprint_id      = "ubuntu_20_04"
  bundle_id         = "nano_2_0"
  key_pair_name     = "LightsailKey"
}

resource "aws_lightsail_instance_public_ports" "vps_public_ports" {
  instance_name = aws_lightsail_instance.vps_instance.name

  port_info {
    protocol  = "udp"
    from_port = 51820
    to_port   = 51820
  }

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
  }
}