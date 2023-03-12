resource "aws_iam_user" "userexample" {
  name          = "tf-test-user"
  path          = "/"
  force_destroy = true
  #a user with non-Terraform-managed access keys and login profile will fail to be destroyed otherwise during destroy
}

resource "aws_iam_user_login_profile" "example" {
  user = aws_iam_user.userexample.name
}
