terraform {
  required_providers {
    virtualbox = {
      source  = "shekeriev/virtualbox"
      version = "0.0.4"
    }
  }
}

provider "virtualbox" {
  delay      = 60
  mintimeout = 5
}

resource "virtualbox_vm" "worker" {
  count     = 1
  name      = "worker-vm"
  image     = "https://app.vagrantup.com/ubuntu/boxes/focal64/versions/20230209.0.0/providers/virtualbox.box"
  cpus      = 1
  memory    = 1024
  user_data = file("${path.module}/cloud_init.cfg")

  network_adapter {
    type           = "hostonly"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}

resource "virtualbox_vm" "db" {
  count     = 1
  name      = "db-vm"
  image     = "https://app.vagrantup.com/ubuntu/boxes/focal64/versions/20230209.0.0/providers/virtualbox.box"
  cpus      = 1
  memory    = 1024
  user_data = file("${path.module}/cloud_init.cfg")

  network_adapter {
    type           = "hostonly"
    host_interface = "VirtualBox Host-Only Ethernet Adapter"
  }
}