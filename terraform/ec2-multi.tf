provider "aws" {}

resource "aws_instance" "aws-multi-instance" {
  count         = 3
  ami           = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"

  tags = {
   Name = "tf-demo-instnce-${count.index}"
  }
}
