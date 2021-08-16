terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "1.2.2"
    }
  }
}
resource "local_file" "pet" {
  filename = var.filename
  content  = "My favourite pet is ${random_pet.my-pet.id}"
  depends_on = [
    random_pet.my-pet
  ]
}

resource "local_file" "dogito" {
  filename = var.filename
  content  = "My favourite pet is ${data.local_file.dog.content}"
}
resource "random_pet" "my-pet" {
  prefix    = var.prefix
  separator = var.separator
  length    = var.length
  lifecycle {
      create_before_destroy = true
  }
}

resource "local_file" "pets" {
  filename = each.value
  for_each = var.filenames // filenames must be a set
  //count = 3
}
//pets is now a map

data "local_file" "dog" {
  filename = "./dog.txt"
}

output "test" {
  value       = random_pet.my-pet.id
  description = "test"
}

#terraform state allows to know,
#when apply in 2nd time, 
#which ressources should be created first
# terraform init does not refresh state
#.tfstate => sensitive content => cloud
#*.tf => github 

#terraform validate
#terraform providers
#terraform graph => show dependencies

#immutable infra => delete old servers when we need 
#to deploy new versions of the service

#depends_on and lifecycle are called meta-arguments
