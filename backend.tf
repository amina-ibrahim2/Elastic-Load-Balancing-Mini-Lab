terraform {
  backend "s3" {
    bucket         = "amina-elb-mini-lab-tfstates"
    key            = "load-balancing-mini-lab/terraform.tfstate"
    region         = "us-east-2"
    profile        = "TA-Sandbox-Lab2"
    dynamodb_table = "terraform-state-lock"
  }
}

# store state file in s3 bucket, in that bucket terraform will create a folder and store the state file in that folder which will be /terraform.tfstate file 