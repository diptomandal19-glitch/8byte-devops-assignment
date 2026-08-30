terraform {
  backend "s3" {
    bucket       = "8byte-devops-tfstate-445567100357"
    key          = "8byte-devops/staging/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}