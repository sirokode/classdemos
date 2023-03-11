#we use an existing module
provider "aws" {}

module "iam_iam-user" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-user"
  version = "5.9.2"
  name = var.user #only required attribute for this module
  #set optionals
  pgp_key="keybase:mcowiti"
  force_destroy=true
  password_reset_required=false
}
