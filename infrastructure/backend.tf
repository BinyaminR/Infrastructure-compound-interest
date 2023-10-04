terraform {
  backend "gcs" {
    bucket = "compound-interest-infra-binyamin"
    prefix = "terraform/state"
  }
}