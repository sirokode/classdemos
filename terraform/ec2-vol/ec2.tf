resource "aws_instance" "web" {
  ami               = "ami-put-correct-ami-here"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"

  tags = {
    Name = "Tf-TestEc2-with-Vol"
    usage ="evaluations"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}
