resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-pws-bucket-p"
  tags = {
        Name = "${var.env}-pws-bucket-p"
        Environment = var.env
  }
}