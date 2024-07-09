rg_location = "East US"
virtual_network = {
  name          = "vnet1"
  address_space = ["10.1.0.0/16"]
}

subnet = {
  name             = "default"
  address_prefixes = ["10.1.0.0/24"]
}