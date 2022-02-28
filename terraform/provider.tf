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
project = "senai-sql-class"
region = "us-west1"
}