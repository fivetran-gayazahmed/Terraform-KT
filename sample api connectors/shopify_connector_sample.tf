// Shopify connector via Terraform

resource "fivetran_connector" "tf_dipen_shopify" {
  group_id           = "unimpaired_prestige"
  service            = "shopify"
  sync_frequency     = 120
  paused             = true
  pause_after_trial  = true
  trust_certificates = true
  run_setup_tests    = true

  destination_schema {
    name = "tf_dipen_shopify"
  }

  config {
    shop = "dipen_shop"
  }
}
