terraform {
  required_version = ">= 1.5.0"
}

provider "local" {
  # Local provider allows file resources
}

resource "local_file" "example_file" {
  filename = "${path.module}/hello.txt"
  content  = "Hello Terraform Lab!"
}
