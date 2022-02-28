resource "google_compute_instance" "default" {
  name         = "sql-class-database"
  machine_type = "f1-micro"
  zone         = "us-west1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

    metadata_startup_script = <<EOF
    sudo apt-get update 
    sudo apt-get install -y git-all
    mkdir /home/class && cd /home/class
    git clone https://github.com/natanascimento/sql-class && cd /home/class/sql-class/ 
    sudo chmod +x scripts/docker.sh && sudo sh scripts/docker.sh 
    sudo docker-compose up -d
    EOF

    tags = ["database"]
}

resource "google_compute_firewall" "database" {
  name    = "default-allow-database-terraform"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "5432", "18080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["database"]
}

output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}