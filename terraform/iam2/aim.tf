
resource "aws_iam_user" "lb" {
  name = "z_test_user"
}

resource "aws_iam_user_login_profile" "u" {
  user  = "${aws_iam_user.lb.name}"
  password_reset_required = true
  pgp_key="keybase:mcowiti"
}
