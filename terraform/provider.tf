#Realizando uma requisição da hashicorp
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
credentials = "${file("../credentials.json")}"
project = "mindful-braid-356703"
region = "us-west1"
}