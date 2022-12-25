resource "aws_s3_bucket" "vps_bucket" {
  bucket = "${var.bucket_name}"
}

resource "aws_s3_bucket_acl" "vps_bucket_acl" {
  bucket = aws_s3_bucket.vps_bucket.id
  acl    = "${var.s3_acl}"
}
