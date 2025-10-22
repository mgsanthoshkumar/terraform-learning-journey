# 1. Terraform Block: Define the Docker Provider
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# 2. Define the Docker Provider connection
provider "docker" {}

# 3. Provisioning: Pull the NGINX Docker image (Your "AMI" equivalent)
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = true
}

# 4. Provisioning: Create a container instance (Your "EC2 Instance" equivalent)
resource "docker_container" "nginx_container" {
  name  = "compliant-web-server"
  image = docker_image.nginx_image.name

  # Networking/Security Group equivalent (Port exposure)
  ports {
    internal = 80
    external = 8082 
  }

  # Tagging/Compliance equivalent (Resource Labels)
  labels {
    label = "Environment"
    value = "LocalDev"
  }
  labels {
    label = "Owner"
    value = "hr265"
  }
}
