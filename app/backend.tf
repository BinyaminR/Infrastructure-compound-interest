terraform {
 backend "gcs" {
   bucket  = "compound-interest-app-binyamin"
   prefix  = "terraform/state"
 }
}