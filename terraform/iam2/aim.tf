
resource "aws_iam_user" "lb" {
  name = "z_test_user"
}

#Uses PGP to encrypt the password for safe transport to the user. 
#PGP keys can be obtained from Keybase
/* for example, use mcowiti has a pgp public key at keybase.io, they can use that to
  decrypt the password and or secret key generated 
  */
resource "aws_iam_user_login_profile" "u" {
  user  = "${aws_iam_user.lb.name}"
  password_reset_required = true
  pgp_key="keybase:mcowiti"
}
