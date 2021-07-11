terraform {
backend "gcs" {
  bucket = "ansible-318616-tfstate-bucket"   # GCS bucket name to store terraform tfstate
  prefix = "terraform"           # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}
