resource "nsxt_firewall_section" "pas_firewall_bottom_section" {
  description  = "PAS FIREWALL BOTTOM SECTION provisioned by Terraform"
  display_name = var.pcf_firewall_bottom_section

  section_type = "LAYER3"
  stateful     = false

  applied_to {
    target_type = "LogicalSwitch"
    target_id   = nsxt_logical_switch.infrastructure.id
  }

  applied_to {
    target_type = "LogicalSwitch"
    target_id   = nsxt_logical_switch.pas.id
  }

  applied_to {
    target_type = "LogicalSwitch"
    target_id   = nsxt_logical_switch.services.id
  }

  applied_to {
    target_type = "LogicalSwitch"
    target_id   = nsxt_vlan_logical_switch.uplinks.id
  }
}

resource "nsxt_firewall_section" "pas_firewall_top_section" {
  description  = "PAS FIREWALL TOP SECTION provisioned by Terraform"
  display_name = var.pcf_firewall_top_section

  section_type = "LAYER3"
  stateful     = false

  applied_to {
    target_type = "LogicalSwitch"
    target_id   = nsxt_logical_switch.infrastructure.id
  }

  applied_to {
    target_type = "LogicalSwitch"
    target_id   = nsxt_logical_switch.pas.id
  }

  applied_to {
    target_type = "LogicalSwitch"
    target_id   = nsxt_logical_switch.services.id
  }

  applied_to {
    target_type = "LogicalSwitch"
    target_id   = nsxt_vlan_logical_switch.uplinks.id
  }

  insert_before = nsxt_firewall_section.pas_firewall_bottom_section.id
}
