resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 20

  tags = {
    Name = "example-ebs-volume"
  }
}
