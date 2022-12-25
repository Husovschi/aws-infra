resource "aws_lightsail_static_ip_attachment" "vps_static_ip_attachment" {
  static_ip_name = aws_lightsail_static_ip.vps_static_ip.id
  instance_name  = aws_lightsail_instance.vps_instance.id
}

resource "aws_lightsail_static_ip" "vps_static_ip" {
  name = "vps-static_ip"
}

resource "aws_lightsail_instance_public_ports" "vps_public_ports" {
  instance_name = aws_lightsail_instance.vps_instance.name

  port_info {
    protocol  = "${var.wireguard_protocol}"
    from_port = "${var.wireguard_port}"
    to_port   = "${var.wireguard_port}"
  }

  port_info {
    protocol  = "${var.ssh_protocol}"
    from_port = "${var.ssh_port}"
    to_port   = "${var.ssh_port}"
  }
}