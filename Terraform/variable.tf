# Refactoring the Terraform configuration to follow best practices

variable "project_id" {
  description = "The ID of the project in which to create resources."
  type        = string
}

variable "project_name" {
  description = "The name of the project."
  type        = string

}

variable "region" {
  description = "The region in which to create resources."
  type        = string
}

variable "google_sql_database_instance" {
  description = "the name of the db instance"
  type        = string
}

variable "db_password" {
  description = "The password for the MySQL user."
  type        = string
}

variable "bucket_name" {
  description = "The name of the Cloud Storage bucket."
  type        = string
}

variable "google_credential" {
  description = "connection credential"
  type        = string
}
