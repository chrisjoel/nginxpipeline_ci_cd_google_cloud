# create SQL instance to be able to run with the nginx
resource "google_sql_database_instance" "instance" {
  name             = "devops-mysql"
  database_version = "MYSQL_5_7"
  region           = var.region
  settings {
    tier            = "db-f1-micro"
    disk_autoresize = true
  }

  deletion_protection = false

}

resource "google_sql_database" "db" {
  name     = "mysqldatabase"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "user" {
  name     = "ebenkajoel"
  instance = google_sql_database_instance.instance.name
  password = var.db_password
}