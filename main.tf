resource "oci_core_network_security_group" "core_network_security_groups" {
  for_each = var.core_network_security_groups

  compartment_id = each.value.compartment_id
  vcn_id         = each.value.vcn_id
  defined_tags   = each.value.defined_tags
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

