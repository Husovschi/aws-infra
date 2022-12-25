variable "availability_zone" {
  description = "availability zone"
  type = string
  default     = "eu-central-1a"  # Frankfurt
}

variable "blueprint_id" {
  description = "blueprint id for vps"
  type = string
  default     = "ubuntu_20_04"
}

variable "bundle_id" {
  description = "bundle id for vps"
  type = string
  default     = "nano_2_0" 
}

variable "ssh_port" {
  description = "SSH port"
  type = number
  default     = 22
}

variable "ssh_protocol" {
  description = "SSH protocol"
  type = string
  default     = "tcp"
}

variable "wireguard_port" {
  description = "Wireguard port"
  type = number
  default     = 51820
}

variable "wireguard_protocol" {
  description = "Wireguard protocol"
  type = string
  default     = "udp"
}

variable "bucket_name" {
  description = "S3 bucket name"
  type = string
  default     = "husovschi-vps-bucket"
}

variable "s3_acl" {
  description = "S3 ACL permission"
  type = string
  default     = "private"
}
