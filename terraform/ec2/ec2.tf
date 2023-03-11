provider "aws" {}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "ubuntu22keyPair"

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "tf-ec2-latest-ami"
  }
}
