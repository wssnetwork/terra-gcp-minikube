# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account
resource "google_service_account" "svc-acc" {
  account_id = "${var.proj_name}-svc-acc"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_project_iam
resource "google_project_iam_member" "svc-acc" {
  project = var.project
  role    = "roles/compute.admin"
  member  = "serviceAccount:${google_service_account.svc-acc.email}"
}