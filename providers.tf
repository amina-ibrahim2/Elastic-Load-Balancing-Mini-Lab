provider "aws" {
  region = var.region
  profile = "TA-Sandbox-Lab2"

  default_tags {
    tags = {
      "Automation" = "terraform"
      "Project" = var.project_name
      "Environment" = var.environment
    }
  }
}