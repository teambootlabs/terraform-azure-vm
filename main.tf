
resource "azurerm_virtual_machine" "main" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = var.network_interface_ids
  os_profile_linux_config {
    disable_password_authentication = var.os_profile_linux_config_disable_password_authentication
    ssh_keys {
      key_data = var.os_profile_linux_config_ssh_keys_key_data
      path     = var.os_profile_linux_config_ssh_keys_path
    }
  }
  vm_size             = var.vm_size
  availability_set_id = var.availability_set_id
  boot_diagnostics {
    enabled     = var.boot_diagnostics_enabled
    storage_uri = var.boot_diagnostics_storage_uri
  }
  additional_capabilities {
    ultra_ssd_enabled = var.additional_capabilities_ultra_ssd_enabled
  }
  delete_os_disk_on_termination   = var.delete_os_disk_on_termination
  delete_data_disks_on_termination = var.delete_data_disks_on_termination
  identity {
    type         = var.identity_type
    identity_ids = var.identity_identity_ids
  }
  os_profile {
    computer_name   = var.os_profile_computer_name
    admin_username  = var.os_profile_admin_username
    admin_password  = var.os_profile_admin_password
    custom_data     = var.os_profile_custom_data
  }
  os_profile_secrets {
    source_vault_id = var.os_profile_secrets_source_vault_id
    vault_certificates {
      certificate_url   = var.os_profile_secrets_vault_certificates_certificate_url
      certificate_store = var.os_profile_secrets_vault_certificates_certificate_store
    }
  }
  plan {
    name      = var.plan_name
    publisher = var.plan_publisher
    product   = var.plan_product
  }
  primary_network_interface_id = var.primary_network_interface_id
  proximity_placement_group_id = var.proximity_placement_group_id
  storage_data_disk {
    name                     = var.storage_data_disk_name
    caching                  = var.storage_data_disk_caching
    create_option            = var.storage_data_disk_create_option
    disk_size_gb             = var.storage_data_disk_disk_size_gb
    lun                      = var.storage_data_disk_lun
    write_accelerator_enabled = var.storage_data_disk_write_accelerator_enabled
  }
  storage_image_reference {
    publisher = var.storage_image_reference_publisher
    offer     = var.storage_image_reference_offer
    sku       = var.storage_image_reference_sku
    version   = var.storage_image_reference_version
  }
  storage_os_disk {
    name                     = var.storage_os_disk_name
    caching                  = var.storage_os_disk_caching
    create_option            = var.storage_os_disk_create_option
    disk_size_gb             = var.storage_os_disk_disk_size_gb
    image_uri                = var.storage_os_disk_image_uri
    os_type                  = var.storage_os_disk_os_type
    write_accelerator_enabled = var.storage_os_disk_write_accelerator_enabled
  }
  tags  = var.tags
  zones = var.zones
}