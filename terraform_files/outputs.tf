# Return service URL
output "url" {
  value = "${google_cloud_run_service.mywebapp.status[0].url}"
}
