terraform {
  backend "s3" {
    bucket = "mahendharemmadi514"
    key = "day03-outputfile/terraform.tfstate"
    region = "ap-south-1"
  }
}