provider "aws" {}

resource "aws_iam_user" "user" {
  name = "z_test_user2"
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.user.name

  policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
{
   "Effect": "Allow",
   "Action": [
     "ec2:Describe*"
   ],
   "Resource": "*"
}]
}
 EOF
}

resource "aws_iam_user_login_profile" "u" {
  user                    = aws_iam_user.user.name
  password_reset_required = true
  pgp_key                 = "keybase:mcowiti"
}
