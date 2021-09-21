variable "gcp_project" {
  description = "The project where you want to set up environment"
  default     = "notejam-325412"
}

variable "gcp_region" {
  description = "The region where you want to run Cloud Run Service"
  type        = string
  default     = "europe-central2"
}
