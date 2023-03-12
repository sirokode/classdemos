resource "aws_iam_user" "userexample" {
  name          = "tf-test-user"
  path          = "/"
  force_destroy = true
}


resource "aws_iam_user_login_profile" "example" {
  user = aws_iam_user.userexample.name
  #pgp_key = "keybase:mcowiti"
}
