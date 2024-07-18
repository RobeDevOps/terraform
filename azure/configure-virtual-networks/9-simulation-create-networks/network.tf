# Resource Group
resource "azurerm_resource_group" "rg" {
  location = var.rg_location
  name     = "${var.project_name}-rg"
}


resource "azurerm_virtual_network" "network" {
  name                = var.virtual_network.name
  address_space       = var.virtual_network.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}


# Subnet 1
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet.name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = var.subnet.address_prefixes
}

resource "azurerm_network_security_group" "rdp" {
  name                = "rdp_inbound"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "rdp_rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "vms_nic" {
  for_each            = toset(local.vms)
  name                = "${each.key}_nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${each.key}-configuration"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "sg_associations" {
  for_each                  = toset(local.vms)
  network_interface_id      = azurerm_network_interface.vms_nic[each.key].id
  network_security_group_id = azurerm_network_security_group.rdp.id
}
