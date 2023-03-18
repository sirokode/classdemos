resource "aws_instance" "web" {
  ami               = "ami-21f78e11"
  availability_zone = "us-east-1a"
  instance_type     = "t2.micro"

  tags = {
    Name = "Tf-TestEc2-with-Vol"
    usage ="evaluations"
  }
}
