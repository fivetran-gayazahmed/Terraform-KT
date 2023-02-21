

resource "fivetran_user" "Dipen" {
  email       = "tf_test@fivetran.com"
  given_name  = "Dipen"
  family_name = "Dipen"
}

resource "fivetran_user" "test_destroy" {
  email       = "tf_test2@fivetran.com"
  given_name  = "test"
  family_name = "test"
}
