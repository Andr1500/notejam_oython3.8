#Define Cloud Provider
provider "google" {
  project = "notejam-325412"
}

# Deploy image to Cloud Run
resource "google_cloud_run_service" "mywebapp" {
  name     = "mywebapp"
  location = "europe-central2"
  template {
    spec {
      containers {
        image = "gcr.io/notejam-325412/webapp"
      }
    }
  }
  traffic {
    percent         = 100
    latest_revision = true
  }
}

# Create public access
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

# Enable public access on Cloud Run service
resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.mywebapp.location
  project     = google_cloud_run_service.mywebapp.project
  service     = google_cloud_run_service.mywebapp.name
  policy_data = data.google_iam_policy.noauth.policy_data
}
