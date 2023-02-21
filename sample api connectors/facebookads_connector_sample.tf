// Facebook_ads connector via Terraform

resource "fivetran_connector" "tf_FacebookAds" {
  group_id           = "unimpaired_prestige"
  service            = "facebook_ads"
  sync_frequency     = 120
  paused             = true
  pause_after_trial  = true
  trust_certificates = true
  run_setup_tests    = true

  destination_schema {
    name = "tf_facebook_ads"
  }

  config {
    sync_mode = "SpecificAccounts"
    accounts  = ["act_123"]
    custom_tables {
      action_breakdowns  = []
      action_report_time = "impression"
      aggregation        = "Week"
      breakdowns = [
        "publisher_platform",
      ]
      click_attribution_window = "DAY_7"
      config_type              = "Custom"
      fields = [
        "account_id",
        "spend",
        "impressions",
        "campaign_id",
        "ad_name",
        "account_name",
        "adset_id",
        "clicks",
        "buying_type",
        "ad_id",
        "inline_link_clicks",
        "objective",
        "campaign_name",
      ]
      table_name              = "abc"
      view_attribution_window = "DAY_1"
    }
    timeframe_months = "THREE"
  }
}
