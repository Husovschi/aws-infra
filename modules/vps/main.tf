
resource "aws_lightsail_key_pair" "key_pair" {
    name       = "LightsailKey"
    public_key = file("public-keys/LightsailKey.pub")
}

resource "aws_lightsail_instance" "vps_instance" {
    name              = "vps-instance"
    availability_zone = "${var.availability_zone}"
    blueprint_id      = "${var.blueprint_id}"
    bundle_id         = "nano_2_0"
    key_pair_name     = aws_lightsail_key_pair.key_pair.name
}