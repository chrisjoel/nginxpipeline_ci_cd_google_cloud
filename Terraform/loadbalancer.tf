resource "google_compute_global_address" "default" {
  name = "global-address"
}

resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name    = "http-proxy"
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "http-forwarding-rule"
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "8080:80"
  ip_address = google_compute_global_address.default.address
}

resource "google_compute_backend_service" "default" {
  name        = "backend-service"
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 10

  backend {
    group = google_compute_region_network_endpoint_group.default.id
  }
  health_checks = [google_compute_health_check.default.self_link]
}

resource "google_compute_health_check" "default" {
  name = "health-check"
  http_health_check {
    request_path = "/"
    port         = 8080
  }
}

resource "google_compute_region_network_endpoint_group" "default" {
  name                  = "neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
}

resource "google_cloud_run_service" "name" {
  name     = "php-nginx-app"
  location = var.region
  project  = var.project_id
  
}