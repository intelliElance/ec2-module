data "terraform_remote_state" "vpc" {

    backend = "s3" 
    config = {
        bucket = "intellidevops-dpt6-terraform-state"
        key    = "edwiki/vpc/terraform.tfstate"
        region = "us-east-1"
        dynamodb_table = "dpt6_table"
    }
   
  }

data "aws_ami" "myami" {
  most_recent      = true
  owners           = ["343666433467"]

  filter {
    name   = "name"
    values = ["ami-web-*"]
  }
}