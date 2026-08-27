#  Copyright (c) Juniper Networks, Inc., 2025-2026.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

resource "apstra_raw_json" "evpn_df_election_collector" {
  depends_on = [
    apstra_raw_json.evpn_df_election_service
  ]

  url = "/api/telemetry/collectors"
        id  = "ri_evpn_df_election_${var.blueprint_id}"

  payload = <<-EOT
{
    "service_name": "ri_evpn_df_election_${var.blueprint_id}",
    "collectors": [
        {
            "platform": {
                "os_type": "junos",
                "os_version": "23.4r2",
                "family": "junos",
                "model": ""
            },
            "config": {
                "xml_parse_evpn_instance": {
                    "accessors": {
                        "evpn_esi_local_intf_status": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-local-intf-information/evpn-esi-local-intf-status",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_value": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-value",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_backup_forwarder": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-backup-forwarder",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_remote_pe_ipaddr": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-remote-pe-information/evpn-esi-remote-pe/evpn-esi-remote-pe-ipaddr",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_remote_aliasing_label": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-remote-pe-information/evpn-esi-remote-pe/evpn-esi-remote-aliasing-label",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_df_election_algorithm": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-df-election-algorithm",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_instance_name": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-instance-name",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_remote_mac_label": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-remote-pe-information/evpn-esi-remote-pe/evpn-esi-remote-mac-label",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_num_esi": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-num-esi",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_num_remote_pe": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-remote-pe-information/evpn-esi-num-remote-pe",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_local_intf_name": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-local-intf-information/evpn-esi-local-intf-name",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_remote_pe_mode": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-remote-pe-information/evpn-esi-remote-pe/evpn-esi-remote-pe-mode",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_designated_forwarder": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-designated-forwarder",
                            "type": "String",
                            "none_value": null
                        },
                        "evpn_esi_status": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-status",
                            "type": "String",
                            "none_value": null
                        },
                        "esi_last_df_update_timestamp": {
                            "path": "/evpn-instance-information/evpn-instance/evpn-esi/evpn-esi-df-information/esi-last-df-update-timestamp",
                            "type": "String",
                            "none_value": null
                        }
                    },
                    "cmd": "show evpn instance esi-info | display xml",
                    "desc": "",
                    "type": "xml_transform"
                },
                "select_esi_fields": {
                    "desc": "",
                    "type": "select_filter",
                    "from": "xml_parse_evpn_instance",
                    "row": {
                        "keys": {
                            "EVI": "evpn_instance_name"
                        },
                        "values": {
                            "ESI_RMT_MAC_LABEL": "evpn_esi_remote_mac_label",
                            "ESI_LOCAL_INTF_STATUSS": "evpn_esi_local_intf_status",
                            "ESI_LAST_DF_UPD_TS": "esi_last_df_update_timestamp",
                            "ESI_DF": "esi_designated_forwarder",
                            "ESI_VAL": "evpn_esi_value",
                            "ESI_STATUS": "evpn_esi_status",
                            "ESI_NUM_RMT_PES": "evpn_esi_num_remote_pe",
                            "ESI_RMT_PE_MODE": "evpn_esi_remote_pe_mode",
                            "ESI_LOCAL_INTF": "evpn_esi_local_intf_name",
                            "ESI_RMT_PE_IP_ADDR": "evpn_esi_remote_pe_ipaddr",
                            "ESI_DF_ALG": "esi_df_election_algorithm",
                            "ESI_BDF": "esi_backup_forwarder",
                            "ESI_RMT_ALIASING_LABEL": "evpn_esi_remote_aliasing_label"
                        }
                    }
                },
                "filter_non_irb": {
                    "type": "condition_filter",
                    "from": "select_esi_fields",
                    "desc": "",
                    "filter": "'irb' not in values[\"ESI_LOCAL_INTF\"]"
                },
                "ri_evpn_df_election_${var.blueprint_id}": {
                    "type": "service_sink",
                    "from": "filter_non_irb",
                    "desc": ""
                }
            },
            "relaxed_schema_validation": true
        }
    ]
}
  EOT
}
