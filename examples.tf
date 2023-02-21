terraform {
  required_providers {
    fivetran = {
      source  = "fivetran/fivetran"
      version = "0.6.11"
    }
  }
}

provider "fivetran" {
  api_key    = var.api_key
  api_secret = var.api_secret
}

###############
# CONNECTORS ##
###############

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

resource "fivetran_connector" "tf_github" {
  group_id           = "unimpaired_prestige"
  service            = "github"
  sync_frequency     = 120
  paused             = true
  pause_after_trial  = true
  trust_certificates = true
  run_setup_tests    = true

  destination_schema {
    name = "tf_github"
  }

  config {
    sync_mode    = "SpecificRepositories"
    repositories = ["12345678", "23456789"]
    use_webhooks = false
  }
}

resource "fivetran_connector" "tf_square" {
  group_id           = "unimpaired_prestige"
  service            = "square"
  sync_frequency     = 120
  paused             = true
  pause_after_trial  = true
  trust_certificates = true
  run_setup_tests    = false

  destination_schema {
    name = "tf_square"
  }

  config {
    client_id     = "sq0idp-WljsFtvVl79AHgCL4jl6gw"
    client_secret = "sq0csp-KtvmxBI_xuYIxkNxa2hfHEfizTIqi4bne3XpOEUITAo"
  }

}


################
## USERS ##
################

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
