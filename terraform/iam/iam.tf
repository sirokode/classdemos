resource "aws_iam_user" "userexample" {
  name          = "tf-test-user"
  path          = "/"
  force_destroy = true
}

#Uses PGP to encrypt the password for safe transport to the user. 
#PGP keys can be obtained from Keybase
/* for example, use mcowiti has a pgp public key at keybase.io, they can use that to
  decrypt the password and or secret key generated 
  */
resource "aws_iam_user_login_profile" "example" {
  user = aws_iam_user.userexample.name
  #pgp_key = "keybase:mcowiti"
}
