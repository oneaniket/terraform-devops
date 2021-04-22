# terraform {
#   backend "gcs" {
#     bucket  = "gcp-training-bucket-2021"
#     prefix  = "terraform/state"
#   }
# }

provider "google" {
  project = "planar-maxim-304714"
  region  = "us-central1"
  zone    = "us-central1-c"
}