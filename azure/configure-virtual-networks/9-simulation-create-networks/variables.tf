variable "project_name" {
  type    = string
  default = "certified-skills"
}

variable "rg_location" {
  type = string
}

variable "virtual_network" {
  type = object({
    name          = string
    address_space = list(string)
  })
}

variable "subnet" {
  type = object({
    name             = string
    address_prefixes = list(string)
  })
}
