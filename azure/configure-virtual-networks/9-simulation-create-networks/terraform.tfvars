rg_location = "Central US"
virtual_network = {
  name          = "vnet1"
  address_space = ["10.1.0.0/16"]
}

subnet = {
  name             = "subnet1"
  address_prefixes = ["10.1.0.0/24"]
}