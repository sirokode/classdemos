provider "aws" {
}
 

resource "aws_instance" "test-instances" {
  ami  = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  key_name = "ubuntu22keyPair"
  
  user_data = <<EOF
                #! /bin/bash
               sudo apt-get update
                sudo git clone https://github.com/sirokode/classdemos
                sudo chmod -R 775 classdemos
                sudo classdemos/user.sh
        EOF

  tags = {
    Name = "tf-test-userdata"
    training = "sirokode"
  }
}
