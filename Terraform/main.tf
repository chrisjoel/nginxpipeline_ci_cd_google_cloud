#configure the google cloud provider in order to be capable to use variables
provider "google" {
  project = var.project_id
  region  = var.region
}

#configure the google cloud project 
#Reference: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project
resource "google_project" "project" {
  name       = var.project_name
  project_id = var.project_id
}