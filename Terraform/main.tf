# Création du groupe de ressources
resource "azurerm_resource_group" "monRessourceGroup" {
  name     = "monRessourceGroup"
  location = "westeurope"  
}

# Création du réseau virtuel
resource "azurerm_virtual_network" "main" {
  name                 = "network-gp-tf"
  location             = "westeurope"  
  address_space        = ["10.0.0.0/16"]
  resource_group_name  = azurerm_resource_group.monRessourceGroup.name  # Référence correcte au groupe de ressources

}

# IP publique pour la VM
resource "azurerm_public_ip" "my_public_ip" {
  name                = "myPublicIP"
  location            = azurerm_resource_group.monRessourceGroup.location
  resource_group_name = azurerm_resource_group.monRessourceGroup.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}


# Création du sous-réseau
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = "subnet-gp-tf"
  resource_group_name  = azurerm_resource_group.monRessourceGroup.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "mon_nsg" {
  name                = "monNSG"
  location            = azurerm_resource_group.monRessourceGroup.location
  resource_group_name = azurerm_resource_group.monRessourceGroup.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}



resource "azurerm_network_interface" "my_terraform_nic" {
  name                = "myNIC"
  location            = azurerm_resource_group.monRessourceGroup.location
  resource_group_name = azurerm_resource_group.monRessourceGroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.my_public_ip.id
  }
}

# Crée une machine virtuelle Linux
resource "azurerm_linux_virtual_machine" "my_terraform_vm" {
  name                  = "myVM"
  location              = azurerm_resource_group.monRessourceGroup.location
  resource_group_name   = azurerm_resource_group.monRessourceGroup.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = "Standard_DS1_v2"

  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  computer_name  = "hostname"
  admin_username = "adminGP"

  admin_password = "TonMotDePasseSuperSecure123!"  # <-- remplace par ton mot de passe fort

  disable_password_authentication = false  # obligatoire pour activer le login par mot de passe
}