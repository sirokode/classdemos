  
provider "aws" {}

resource "aws_iam_user" "user" {
  name = "z-test-user-10"
}
resource "aws_iam_access_key" "admin" {
  user = aws_iam_user.user.id
}
resource "aws_iam_user_login_profile" "user" {
  user    = aws_iam_user.user.id
  pgp_key = "keybase:an-existing-keybase-username"
}
resource "local_file" "admin_password" {
  sensitive_content = "-----BEGIN PGP MESSAGE-----\nComment: https://keybase.io/download\nVersion: Keybase Go 1.0.10 (linux)\n\n${aws_iam_user_login_profile.user.encrypted_password}\n-----END PGP MESSAGE-----\n"
  filename = "encrypted_password.admin.txt"
  file_permission = "0600"
}
