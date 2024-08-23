terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"  # You can use a more recent version if available
    }
  }
}

provider "docker" {
  # Docker provider configuration
}

resource "docker_image" "httpd" {
  name = "httpd:latest"
}

resource "docker_container" "httpd" {
  image = docker_image.httpd.latest
  name  = "my-httpd-container"
  ports {
    internal = 80
    external = 8080
  }
}
