variable "filename" {
  default = "pets.txt"
}

variable "content" {
  default = "We love another pets!"
}

variable "prefix" {
  default = "Mrs"
}

variable "separator" {
  default = "."
}

variable "length" {
  default = "2"
}

variable filenames {
  type = set(string)
  default = [
    "./cat.txt",
    "./shark.txt",
    "./fish.txt"
  ]
}