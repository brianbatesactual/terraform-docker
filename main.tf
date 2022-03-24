terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "logstash" {
  name         = "grafana/logstash-output-loki:latest"
  keep_locally = false
}

resource "docker_container" "logstash" {
  image = docker_image.logstash.latest
  name  = "logstash"
  ports {
    internal = 5400
    external = 5400
  }
}

