# Create a Cloud Load Balancing to route traffic to the Cloud Run service
resource "google_compute_global_address" "app_ip_address" {
  name = "app-ip-address"
}

resource "google_compute_global_forwarding_rule" "http_forwarding_rule" {
  name       = "http-forwarding-rule"
  target     = google_compute_target_http_proxy.http_proxy.id
  port_range = "80"
  ip_address = google_compute_global_address.app_ip_address.id
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "http-proxy"
  url_map = google_compute_url_map.url_map.id
}

resource "google_compute_url_map" "url_map" {
  name            = "url-map"
  default_service = google_compute_backend_service.backend_service.id
}

resource "google_compute_backend_service" "backend_service" {
  name        = "backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 30
  health_checks = [google_compute_health_check.health_check.id]
}

resource "google_compute_health_check" "health_check" {
  name               = "health-check"
  check_interval_sec = 5
  timeout_sec        = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2

  http_health_check {
    port = 80
  }
}