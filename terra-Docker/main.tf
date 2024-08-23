provider "docker" {
  # Configure the Docker provider with your Docker endpoint
}

# Build the Docker image
resource "docker_image" "httpd_image" {
  name         = "my-httpd-image"
  build {
    context    = "Dockerfile"
    dockerfile = "Dockerfile/Dockerfile"
  }
}

# Create and run the Docker container
resource "docker_container" "httpd_container" {
  name  = "my-httpd-container"
  image = docker_image.httpd_image.latest
  ports {
    internal = 80
    external = 8080
  }
}
