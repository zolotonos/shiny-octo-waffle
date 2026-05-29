terraform {
  required_providers {
    vagrant = {
      source  = "bmatcuk/vagrant"
      version = "~> 4.1.0"
    }
  }
}

provider "vagrant" {}

resource "vagrant_vm" "my_infrastructure" {
  vagrantfile_dir = "."
}