#create a cloud storage Bucket for static Files
resource "google_storage_bucket" "static_bucket" {
  name          = var.bucket_name
  location      = var.region
  force_destroy = true
}